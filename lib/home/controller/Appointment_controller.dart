import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:investigators/common/common_snack_bar.dart';
import 'package:investigators/models/address_model.dart';
import 'package:investigators/models/appointment_pending_list.dart';
import 'package:investigators/network_service/index.dart';
import 'package:investigators/router/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../view/appointment_view.dart';

class AppointmentController extends GetxController {
  int currentPage = 0;
  RefreshController refreshController = RefreshController();

  // 待预约列表
  List<AppointmentPendingListData> dataList = [];

  // 拒绝原因输入控制器
  TextEditingController reasonEditingController = TextEditingController();

  // 当前选中的地址对象
  AddressModel? selectedAddressInfo;

  DateTime? selectedDate;

  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    onRefresh(true);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      for (final item in dataList) {
        int interval = int.parse(item.remainTime);
        if (interval > 0) interval--;
        item.remainTime = interval.toString();
      }
      update();
    });
  }

  Future<void> onRefresh(bool isRefresh) async {
    if (isRefresh) {
      currentPage = 0;
      refreshController.resetNoData();
    } else {
      currentPage = currentPage + 1;
    }
    AppointmentPendingList? model = await NetworkService.fetchAppointmentPendingList(currentPage);
    if (model == null) {
      refreshController.refreshCompleted();
      refreshController.loadComplete();
      return;
    }

    refreshController.refreshCompleted();
    refreshController.loadComplete();

    if (model.data.length < 10) refreshController.loadNoData();

    isRefresh ? dataList = model.data : dataList.addAll(model.data);
    update();
  }

  void callUp(String phone) async {
    final phoneNumber = 'tel:$phone';
    if (await canLaunchUrlString(phoneNumber)) {
      await launchUrlString(phoneNumber);
    } else {
      CommonSnackBar.showSnackBar('This device cannot be call up phone.');
    }
  }

  void go2reservation(AppointmentPendingListData appointment) async {
    var result = await Get.toNamed(ApplicationRoutes.reservation, arguments: {'addressList': appointment.addressInfo});
    if (result == null) return;
    bool isSuccess = await NetworkService.bookReservation(appointId: appointment.signRecordId, time: result['time'], address: result['address']);
    if (isSuccess) {
      onRefresh(true);
      CommonSnackBar.showSnackBar('Make appointment successfully!', type: SnackType.success);
    }
  }

  void confirmUnableInterviewAction(String itemId) async {
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
