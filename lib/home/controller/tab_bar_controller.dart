import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:investigators/profile/view/profile_view.dart';
import 'package:investigators/router/index.dart';
import 'package:investigators/utils/global.dart';
import '../view/home_view.dart';

class TabBarController extends GetxController {
  var currentIndex = 0;
  List<Widget> views = const [HomeView(), ProfileView()];

  @override
  void onInit() {
    super.onInit();
  }

  void updateView(int index) {
    currentIndex = index;
    update();
  }
}
