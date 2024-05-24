import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_nb_net/flutter_net.dart';
import 'package:get/get.dart';
import 'package:investigators/common/common_snack_bar.dart';
import 'package:investigators/models/appointment_pending_list.dart';
import 'package:investigators/models/base_response.dart';
import 'package:investigators/models/interview_pending_list.dart';
import 'package:investigators/models/returned_list.dart';
import 'package:investigators/router/index.dart';
import 'package:investigators/utils/field_null_or_empty.dart';
import 'package:investigators/utils/global.dart';

class NetworkService {
  static Future<bool> isNeedEnterVerifyCode({required String phone, required String password}) async {
    BaseResponse response = await _post('/inv/investigator/isNewDevice', {
      'telephone': phone,
      'password': password,
      'device_id': Global.instance.deviceUUID,
    });

    return response.data['is_new_device'] == '1';
  }

  static Future<String?> sendVerifyCode({required String phone}) async {
    BaseResponse response = await _post('/inv/sms/sendVerifyCode', {'telephone': phone, 'verify_type': '7'});
    if (response.code == 0) {
      CommonSnackBar.showSnackBar(response.msg, type: SnackType.error);
      return null;
    }
    return response.data['verify_code'];
  }

  static Future<String?> login({required String phone, required String password, String? code}) async {
    BaseResponse response = await _post('/inv/investigator/login', {
      'telephone': phone,
      'password': password,
      'verify_code': code,
      'device_id': Global.instance.deviceUUID,
      'version': Global.instance.packageInfo.version,
    });

    if (response.code == 0) {
      CommonSnackBar.showSnackBar(response.msg, type: SnackType.error);
      return null;
    }

    return response.data['token'];
  }

  // 待预约列表
  static Future<AppointmentPendingList?> fetchAppointmentPendingList(int page) async {
    BaseResponse response = await _get<AppointmentPendingList>(
      '/inv/appointment/list',
      {'page': page.toString(), 'page_size': '10'},
      isNeedLoading: false,
    );
    if (response.code != 1) {
      CommonSnackBar.showSnackBar(response.msg, type: SnackType.error);
      return null;
    }
    return response.data;
  }

  // 待面签列表
  static Future<InterviewPendingList?> fetchInterviewPendingList(int page) async {
    BaseResponse response = await _get<InterviewPendingList>('/inv/pending/list', {'page': page.toString(), 'page_size': '10'}, isNeedLoading: false);
    if (response.code != 1) {
      CommonSnackBar.showSnackBar(response.msg, type: SnackType.error);
      return null;
    }
    return response.data;
  }

  // 退回列表
  static Future<ReturnedList?> fetchReturnedList(int page) async {
    BaseResponse response = await _get<ReturnedList>('/inv/revert/list', {'page': page.toString(), 'page_size': '10'}, isNeedLoading: false);
    if (response.code != 1) {
      CommonSnackBar.showSnackBar(response.msg, type: SnackType.error);
      return null;
    }
    return response.data;
  }

  // 预约面签
  static Future<bool> bookReservation({required String appointId, required String time, required String address}) async {
    BaseResponse response = await _post('/inv/appointment/booking', {
      'sign_record_id': appointId,
      'booking_time': time,
      'booking_address': address,
    });

    return response.code == 1;
  }

  // 无法面签
  static Future<bool> setUnable2Interview({required String signId, required String reason}) async {
    BaseResponse response = await _post('/inv/appointment/cancel', {'sign_record_id': signId, 'cancel_reason': reason});
    return response.code == 1;
  }

  static Future<BaseResponse> _get<T>(String path, Map<String, dynamic> params, {bool isNeedLoading = true}) async {
    if (isNeedLoading) {
      EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black);
    }

    Map<String, dynamic> encryptedParams = await _encryptParametersValue(params);
    var response = await get(path, queryParameters: encryptedParams);
    var result = response.when(success: (data) {
      return BaseResponse<T>.fromJson(data);
    }, failure: (error, code) {
      return BaseResponse(code: code, msg: error, tag: 'tag');
    });
    EasyLoading.dismiss();
    if (result.code == 0 && RegExp('auth.token.').hasMatch(result.tag)) {
      Global.instance.clearLoginInfo();
      Get.offAllNamed(ApplicationRoutes.login);
    }
    return result;
  }

  static Future<BaseResponse> _post<T>(String path, Map<String, dynamic> params) async {
    if (path == '/inv/investigator/login') {
      EasyLoading.show(status: 'login...', maskType: EasyLoadingMaskType.black);
    } else if (path == '/inv/sms/sendVerifyCode') {
      EasyLoading.show(status: 'sending...', maskType: EasyLoadingMaskType.black);
    } else {
      EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black);
    }

    Map<String, dynamic> encryptedParams = await _encryptParametersValue(params);

    var response = await post(path, data: encryptedParams);
    var result = response.when(
      success: (data) {
        return BaseResponse<T>.fromJson(data);
      },
      failure: (error, code) {
        return BaseResponse(code: code, msg: error, tag: '');
      },
    );
    EasyLoading.dismiss();
    if (result.code == 0 && RegExp('auth.token.').hasMatch(result.tag)) {
      Get.offAllNamed(ApplicationRoutes.login);
    }
    return result;
  }

  static Future<Map<String, dynamic>> _encryptParametersValue(Map<String, dynamic> params) async {
    Map<String, dynamic> encryptedParams = {};
    for (var key in params.keys) {
      if (!isNullOrEmpty(params[key])) {
        var result = await Global.instance.methodChannel.invokeMapMethod('cryptoAES', {'secretKey': Global.instance.deviceUUID, 'plainText': params[key]});
        if (result == null) {
          return {};
        }
        encryptedParams[key] = result['aesText'];
      }
    }

    return encryptedParams;
  }
}
