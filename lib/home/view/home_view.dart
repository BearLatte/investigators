import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:investigators/common/base_view.dart';
import 'package:investigators/home/controller/home_view_controller.dart';
import 'package:investigators/home/view/tab_item_view.dart';
import 'package:investigators/utils/hex_color.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      init: Get.put(HomeViewController()),
      builder: (controller) => BaseView(
        appBarAdditionalHeight: 90,
        appBarBottomWidget: Container(
          height: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 12),
                child: const Text('Investigators', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TabBar(
                  controller: controller.tabController,
                  padding: const EdgeInsets.only(right: 40),
                  tabs: controller.tabs,
                  dividerHeight: 0,
                  indicatorWeight: 1,
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  labelPadding: const EdgeInsets.fromLTRB(0, 0, 10, 2),
                  labelColor: Colors.white,
                  unselectedLabelColor: HexColor('#4F4F4F'),
                ),
              )
            ],
          ),
        ),
        child: TabBarView(
          controller: controller.tabController,
          children: const [
            TabItemView(type: ItemType.appointment),
            TabItemView(type: ItemType.interview),
            TabItemView(type: ItemType.returned),
          ],
        ),
      ),
    );
  }
}
