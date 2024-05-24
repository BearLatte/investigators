import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:investigators/common/common_snack_bar.dart';
import 'package:investigators/models/appointment_pending_list.dart';
import 'package:investigators/network_service/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../view/appointment_view.dart';

class AppointmentController extends GetxController {
  int currentPage = 0;
  RefreshController refreshController = RefreshController();

  // 待预约列表
  List<AppointmentPendingListData> dataList = [];

  // 日期输入控制器
  TextEditingController dateEditingController = TextEditingController();

  // 时间输入控制器
  TextEditingController timeController = TextEditingController();

  // 住宅输入控制器
  TextEditingController residentialAddController = TextEditingController();

  // 公司地址输入控制器
  TextEditingController companyAddController = TextEditingController();

  // 拒绝原因输入控制器
  TextEditingController reasonEditingController = TextEditingController();

  // 当前选中的地址对象
  AppointmentPendingListDataAddressInfo? selectedAddressInfo;

  DateTime? selectedDate;

  @override
  void onInit() {
    super.onInit();
    onRefresh(true);
  }

  @override
  void onClose() {
    print('从内存中删除了');
    super.onClose();
  }

  void onRefresh(bool isRefresh) async {
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

  void forbiddenAction(String orderId) {
    debugPrint('DEBUG: 设置无法面签');
  }

  void selectedAddressAction(AppointmentPendingListDataAddressInfo address) {
    selectedAddressInfo = address;
    update();
  }

  void confirmReservation(String appointId) async {
    String date = dateEditingController.text.trim();
    String time = timeController.text.trim();
    if (date.isEmpty) {
      return CommonSnackBar.showSnackBar('Please select reservation date!');
    }
    if (time.isEmpty) {
      return CommonSnackBar.showSnackBar('Please select reservation time!');
    }
    if (selectedAddressInfo == null) {
      return CommonSnackBar.showSnackBar('Please select reservation location!');
    }

    bool isSuccess = await NetworkService.bookReservation(appointId: appointId, time: time, address: selectedAddressInfo!.addressId);
    if (isSuccess) {
      clearReservationInfoAndBack();
      onRefresh(true);
    }
  }

  void clearReservationInfoAndBack() {
    dateEditingController.clear();
    timeController.clear();
    selectedAddressInfo = null;
    selectedDate = null;
    Get.back();
  }

  void confirmSelectDate() {
    selectedDate ??= DateTime.now();
    dateEditingController.text = DateFormat.yMMMMd().format(selectedDate!);
    Get.back();
  }

  void selectDate(DateTime date) {
    selectedDate = date;
    update();
  }

  void showTimeSelector() async {
    DateTime? time = await DatePicker.showTimePicker(Get.context!);
    if (time == null) return;

    timeController.text = DateFormat.Hms().format(time);
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
