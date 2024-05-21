import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/home/controller/tab_item_view_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum ItemType { appointment, interview, returned }

class TabItemView extends StatelessWidget {
  final ItemType type;

  const TabItemView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    TabItemViewController controller = TabItemViewController();
    controller.type = type;

    RefreshController refreshController = RefreshController(initialRefresh: true, initialRefreshStatus: RefreshStatus.refreshing);

    return GetBuilder<TabItemViewController>(
      init: Get.put(controller),
      builder: (controller) => Container(
        color: Colors.white,
        child: SmartRefresher(
          controller: refreshController,
          header: const WaterDropHeader(),
          footer: const ClassicFooter(),
          enablePullUp: true,
          child: ListView(),
          onRefresh: () => controller.refreshData(refreshController),
          onLoading: () => controller.refreshData(refreshController),
        ),
      ),
    );
  }
}
