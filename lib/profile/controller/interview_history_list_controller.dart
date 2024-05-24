import 'package:get/get.dart';
import 'package:investigators/network_service/index.dart';

import '../../models/sign_history_model.dart';

class InterviewHistoryListController extends GetxController {
  List<SignHistoryModel> historyList = [];

  @override
  void onInit() {
    super.onInit();
    _fetchHistory();
  }


  void _fetchHistory() async {
    historyList = await NetworkService.fetchHistory();
    update();
  }
}