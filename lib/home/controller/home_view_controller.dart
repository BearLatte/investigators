import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/utils/global.dart';



class HomeViewController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  List<Tab> tabs = const [
    Tab(height: 54, child: Text('Appointment pending', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))),
    Tab(height: 54, child: Text('Interview pending', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))),
    Tab(height: 54, child: Text('Returned', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))),
  ];

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);

    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
