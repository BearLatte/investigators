import 'dart:convert';

import 'package:flutter_nb_net/flutter_net.dart';
import 'package:investigators/models/base_response.dart';
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

  static void login({required String phone, required String password, String? code}) {
    _post('/inv/investigator/login', {
      'telephone': phone,
      'password': password,
      'verify_code': code,
      'device_id': Global.instance.deviceUUID,
      'version': Global.instance.packageInfo.version,
    });
  }

  static Future<BaseResponse> _post<T>(String path, Map<String, dynamic> params) async {
    Map<String, dynamic> encryptedParams = {};
    for (var key in params.keys) {
      if (!isNullOrEmpty(params[key])) {
        var result = await Global.instance.methodChannel.invokeMapMethod('cryptoAES', {'secretKey': Global.instance.deviceUUID, 'plainText': params[key]});
        if (result == null) return BaseResponse(code: 0, msg: 'Unknown Error', tag: '');
        encryptedParams[key] = result['aesText'];
      }
    }
    var response = await post(path, data: encryptedParams);
    var result = response.when(
      success: (data) {
        return BaseResponse<T>.fromJson(data);
      },
      failure: (error, code) {
        return BaseResponse(code: code, msg: error, tag: '');
      },
    );

    return result;
  }
}
