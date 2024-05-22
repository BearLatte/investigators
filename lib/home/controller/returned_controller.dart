import 'package:get/get.dart';
import 'package:investigators/models/returned_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../network_service/index.dart';

class ReturnedController extends GetxController {
  int currentPage = 0;
  List<ReturnedListData> dataList = [];
  RefreshController refreshController = RefreshController(initialRefresh: true);

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
}
