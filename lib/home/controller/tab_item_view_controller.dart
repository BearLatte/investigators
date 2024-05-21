import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../view/tab_item_view.dart';

class TabItemViewController extends GetxController {
  late ItemType type;

  void refreshData(RefreshController controller) {
    controller.refreshCompleted();
  }
}