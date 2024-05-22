import 'package:get/get.dart';
import 'package:investigators/router/index.dart';
import 'package:investigators/utils/global.dart';

class ProfileController extends GetxController {
  void historiesSignList() => print('去查看历史面签');

  void logout() {
    Global.instance.clearLoginInfo();
    Get.offAllNamed(ApplicationRoutes.login);
  }
}
