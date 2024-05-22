import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investigators/common/common_snack_bar.dart';
import 'package:investigators/models/appointment_pending_list.dart';
import 'package:investigators/network_service/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../view/appointment_view.dart';

class AppointmentController extends GetxController {
  int currentPage = 0;
  RefreshController refreshController = RefreshController();

  List<AppointmentPendingListData> dataList = [];

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

  void reserveAction(String orderId) {
    debugPrint('DEBUG: 去预约');
  }

  void forbiddenAction(String orderId) {
    debugPrint('DEBUG: 设置无法面签');
  }
}
