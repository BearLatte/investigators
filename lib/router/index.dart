import 'package:get/get.dart';
import 'package:investigators/home/controller/home_view_controller.dart';
import 'package:investigators/home/controller/tab_bar_controller.dart';
import 'package:investigators/home/view/home_view.dart';
import 'package:investigators/home/view/tab_bar.dart';
import 'package:investigators/login/view/login_view.dart';
import 'package:investigators/profile/controller/profile_controller.dart';
import 'package:investigators/profile/view/profile_view.dart';

abstract class ApplicationRoutes {
  static const initial = '/';
  static const home = '/home';
  static const profile = '/profile';
}

class ApplicationPages {
  static final routes = [
    GetPage(
      name: ApplicationRoutes.initial,
      page: () => const LoginView(),
    ),
  ];
}
