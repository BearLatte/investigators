import 'package:get/get.dart';
import 'package:investigators/models/interview_pending_list.dart';
import 'package:investigators/network_service/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class InterviewController extends GetxController {
  int currentPage = 0;
  List<InterviewPendingListData> dataList = [];
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

    InterviewPendingList? model = await NetworkService.fetchInterviewPendingList(currentPage);
    refreshController.refreshCompleted();
    refreshController.loadComplete();
    if (model == null) return;
    if (model.data.length < 10) refreshController.loadNoData();
    isRefresh ? dataList = model.data : dataList.addAll(model.data);
    update();
  }
}
