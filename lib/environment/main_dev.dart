import 'package:get/get.dart';
import 'package:investigators/environment/config.dart';
import 'package:investigators/environment/main_com.dart';

void main() async {
  final env = BuildEnvironment.dev(apiBaseURL: 'http://test.pxtlending.com');
  Get.put(env);
  mainCom();
}