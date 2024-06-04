import 'package:get/get.dart';
import 'package:investigators/home/controller/interview_controller.dart';
import 'package:investigators/home/view/camera_take_view.dart';
import 'package:investigators/home/view/city_selection_view.dart';
import 'package:investigators/home/view/contract_view.dart';
import 'package:investigators/home/view/district_selection_view.dart';
import 'package:investigators/home/view/home_view.dart';
import 'package:investigators/home/view/interview_detail_view.dart';
import 'package:investigators/home/view/interview_view.dart';
import 'package:investigators/home/view/province_selection_view.dart';
import 'package:investigators/home/view/reconsideration_view.dart';
import 'package:investigators/home/view/reservation_modal_view.dart';
import 'package:investigators/home/view/signature_view.dart';
import 'package:investigators/home/view/tab_bar.dart';
import 'package:investigators/login/view/login_view.dart';
import 'package:investigators/profile/view/interview_history_list_view.dart';

abstract class ApplicationRoutes {
  static const tab = '/tab';
  static const login = '/login';
  static const home = '/home';
  static const interview = '/interview';
  static const profile = '/profile';
  static const history = '/history';
  static const reservation = '/reservation';
  static const interviewDetail = '/interviewDetail';
  static const takePhoto = '/takePhoto';
  static const province = '/province';
  static const city = '/city';
  static const district = '/district';
  static const contract = '/contract';
  static const reconsideration = '/reconsideration';
  static const signature = '/signature';
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
      transition: Transition.cupertino,
      name: ApplicationRoutes.history,
      page: () => const InterviewHistoryListView(),
    ),
    GetPage(
      name: ApplicationRoutes.reservation,
      opaque: false,
      page: () => const ReservationModalView(),
    ),
    GetPage(
      transition: Transition.native,
      name: ApplicationRoutes.interviewDetail,
      page: () => const InterviewDetailView(),
    ),
    GetPage(
      transition: Transition.native,
      name: ApplicationRoutes.takePhoto,
      page: () => const CameraTakeView(),
    ),
    GetPage(
      transition: Transition.native,
      name: ApplicationRoutes.province,
      page: () => const ProvinceSelectionView(),
    ),
    GetPage(
      transition: Transition.native,
      name: ApplicationRoutes.city,
      page: () => const CitySelectionView(),
    ),
    GetPage(
      transition: Transition.native,
      name: ApplicationRoutes.district,
      page: () => const DistrictSelectionView(),
    ),
    GetPage(
      transition: Transition.native,
      name: ApplicationRoutes.contract,
      page: () => const ContractView(),
    ),
    GetPage(
      transition: Transition.native,
      name: ApplicationRoutes.reconsideration,
      page: () => const ReconsiderationView(),
    ),
    GetPage(
      transition: Transition.native,
      name: ApplicationRoutes.signature,
      page: () => const SignatureView(),
    ),
  ];
}
