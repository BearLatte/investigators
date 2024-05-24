import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investigators/models/interview_pending_list.dart';
import 'package:investigators/network_service/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/common_snack_bar.dart';

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

  void modifyAction(String itemId) {
    debugPrint('DEBUG: 当前要修改时间的选项id为$itemId');
  }

  void modifyAddress(InterviewPendingListData data) {
    debugPrint('DEBUG: 当前要修改的地址信息 ${data.signRecordId}');
  }

  void interviewAction(InterviewPendingListData interview) {}

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
