import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investigators/models/interview_pending_list.dart';
import 'package:investigators/network_service/index.dart';
import 'package:investigators/router/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../common/common_snack_bar.dart';
import '../../models/interview_cache_model.dart';
import '../../utils/global.dart';

class InterviewController extends GetxController {
  int currentPage = 0;
  List<InterviewPendingListData> dataList = [];
  RefreshController refreshController = RefreshController();

  TextEditingController reasonEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    onRefresh(true);
  }

  void onRefresh(bool isRefresh) async {
    if (isRefresh) {
      currentPage = 0;
      refreshController.resetNoData();
    } else {
      currentPage = currentPage + 1;
    }

    InterviewPendingList? model = await NetworkService.fetchInterviewPendingList(currentPage);
    refreshController.refreshCompleted();
    refreshController.loadComplete();
    if (model == null) return;
    if (model.data.length < 10) refreshController.loadNoData();
    isRefresh ? dataList = model.data : dataList.addAll(model.data);
    update();
  }

  void modifyAction(InterviewPendingListData interview) async {
    var result = await Get.toNamed(ApplicationRoutes.reservation, arguments: {
      'selectedTime': interview.bookingTime,
      'selectedAddId': interview.bookingAddress,
      'addressList': interview.addressInfo,
    });
    if (result == null) return;
    bool isSuccess = await NetworkService.bookReservation(appointId: interview.signRecordId, time: result['time'], address: result['address']);
    if (isSuccess) {
      onRefresh(true);
      CommonSnackBar.showSnackBar('Appointment information has modified successfully!', type: SnackType.success);
    }
  }

  void callUpAction(String phone) async {
    final phoneNumber = 'tel:$phone';
    if (await canLaunchUrlString(phoneNumber)) {
      await launchUrlString(phoneNumber);
    } else {
      CommonSnackBar.showSnackBar('This device cannot be call up phone.');
    }
  }

  void interviewAction(InterviewPendingListData interview) async {
    var result = await Get.toNamed(ApplicationRoutes.interviewDetail, arguments: {
      'signRecordId': interview.signRecordId,
      'clientId': interview.clientId,
      'type': 0,
    });

    if (result == 'error') {
      CommonSnackBar.showSnackBar('Unknown error!');
    } else if (result == null) {
      return onRefresh(true);
    } else {
      InterviewCacheModel model = result as InterviewCacheModel;
      var json = model.toJson();
      String? allCaches = Global.instance.prefs.getString(Global.instance.prefs.getString(Global.CURRENT_PHONE_NUMBER));
      if (allCaches == null) {
        Global.instance.prefs.setString(Global.instance.prefs.getString(Global.CURRENT_PHONE_NUMBER), jsonEncode({interview.signRecordId: json}));
      } else {
        var allCacheJson = jsonDecode(allCaches);
        allCacheJson[interview.signRecordId] = json;
        Global.instance.prefs.setString(Global.instance.prefs.getString(Global.CURRENT_PHONE_NUMBER), jsonEncode(allCacheJson));
      }
    }
  }

  void confirmUnable2Interview(String itemId) async {
    String reason = reasonEditingController.text.trim();
    if (reason.isEmpty) {
      return CommonSnackBar.showSnackBar('The reason of unable cannot be empty!');
    }

    bool isSuccess = await NetworkService.setUnable2Interview(signId: itemId, reason: reason);
    if (isSuccess) {
      Get.back();
      onRefresh(true);
    }
  }
}
