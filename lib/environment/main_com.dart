import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:investigators/environment/config.dart';
import 'package:investigators/router/index.dart';
import 'package:investigators/utils/global.dart';
import 'package:investigators/utils/hex_color.dart';

void mainCom() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Global.instance.initGlobalInfo();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final env = Get.find<BuildEnvironment>();
    return GetMaterialApp(
      title: 'Investigators',
      debugShowCheckedModeBanner: false,
      initialRoute: Global.instance.isLogin ? ApplicationRoutes.tab : ApplicationRoutes.login,
      defaultTransition: Transition.native,
      getPages: ApplicationPages.routes,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: HexColor('#008CE2'),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: HexColor('#CCCCCC'), width: 1.0)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: HexColor('#008CE2'), width: 1.0)),
          labelStyle: TextStyle(color: HexColor('#CCCCCC'), fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
      onInit: () async {
        Global.instance.initNetwork(baseUrl: env.apiBaseURL);
      },
      builder: EasyLoading.init(),
    );
  }
}
