import 'package:get/get.dart';
import 'package:investigators/home/view/home_view.dart';
import 'package:investigators/home/view/tab_bar.dart';
import 'package:investigators/login/view/login_view.dart';
import 'package:investigators/profile/view/interview_history_list_view.dart';

abstract class ApplicationRoutes {
  static const tab = '/tab';
  static const login = '/login';
  static const home = '/home';
  static const profile = '/profile';
  static const history = '/history';
}

class ApplicationPages {
  static final routes = [
    GetPage(
      name: ApplicationRoutes.tab,
      page: () => const TabBar(),
    ),
    GetPage(
      name: ApplicationRoutes.login,
      page: () => const LoginView(),
    ),
    GetPage(
      name: ApplicationRoutes.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: ApplicationRoutes.history,
      page: () => const InterviewHistoryListView(),
    )
  ];
}
