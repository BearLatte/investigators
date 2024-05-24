import 'package:get/get.dart';
import 'package:investigators/models/user_model.dart';
import 'package:investigators/network_service/index.dart';
import 'package:investigators/router/index.dart';
import 'package:investigators/utils/global.dart';

class ProfileController extends GetxController {
  UserModel? user;

  @override
  void onReady() {
    super.onReady();
    _loadUserInfo();
  }

  void _loadUserInfo() async {
    user = await NetworkService.fetchUserInfo();
    update();
  }

  void historiesSignList() => Get.toNamed(ApplicationRoutes.history);

  void logout() {
    Global.instance.clearLoginInfo();
    Get.offAllNamed(ApplicationRoutes.login);
  }
}
