import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:investigators/home/controller/tab_bar_controller.dart';
import 'package:investigators/utils/global.dart';

class TabBar extends StatelessWidget {
  const TabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabBarController>(
        init: Get.put(TabBarController()),
        builder: (controller) => Scaffold(
              body: IndexedStack(index: controller.currentIndex, children: controller.views),
              bottomNavigationBar: BottomNavigationBar(
                iconSize: 25,
                currentIndex: controller.currentIndex,
                selectedFontSize: 8,
                unselectedFontSize: 8,
                selectedItemColor: Global.instance.themeColor,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home, size: 20), label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.person, size: 20), label: 'Profile'),
                ],
                onTap: controller.updateView,
              ),
            ));
  }
}
