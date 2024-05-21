import 'package:get/get.dart';
import 'config.dart';
import 'main_com.dart';

void main() async {
  final env = BuildEnvironment.dev(apiBaseURL: 'https://api.pxtlending.com');
  Get.put(env);
  mainCom();
}
