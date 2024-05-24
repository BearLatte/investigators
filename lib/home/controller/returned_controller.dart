import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investigators/models/returned_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../common/common_snack_bar.dart';
import '../../network_service/index.dart';

class ReturnedController extends GetxController {
  int currentPage = 0;
  List<ReturnedListData> dataList = [];
  RefreshController refreshController = RefreshController();

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
    ReturnedList? model = await NetworkService.fetchReturnedList(currentPage);

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

  void callUpAction(String phone) async {
    final phoneNumber = 'tel:$phone';
    if (await canLaunchUrlString(phoneNumber)) {
    await launchUrlString(phoneNumber);
    } else {
    CommonSnackBar.showSnackBar('This device cannot be call up phone.');
    }
  }

  void modifyAction(ReturnedListData data) {
    debugPrint('DEBUG: 修改信息');
  }


}
