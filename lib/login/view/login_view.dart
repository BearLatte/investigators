import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/common/common_image.dart';
import 'package:investigators/login/controller/login_controller.dart';
import 'package:investigators/utils/global.dart';
import 'package:investigators/utils/hex_color.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: Get.put(LoginController()),
        builder: (controller) => Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(),
            body: Stack(children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 40, 16, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('WelCome to Investigators', style: TextStyle(color: HexColor('#282828'), fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 40),
                    TextField(
                      keyboardType: TextInputType.number,
                      focusNode: controller.phoneNode,
                      style: TextStyle(color: HexColor('#282828'), fontSize: 15, fontWeight: FontWeight.bold),
                      controller: controller.phoneController,
                      decoration: InputDecoration(
                          labelText: 'Enter your phone number',
                          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: HexColor('#CCCCCC')),
                          prefix: Container(
                            width: 35,
                            margin: const EdgeInsets.only(right: 10),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(border: Border(right: BorderSide(color: HexColor('#282828'), width: 1.0))),
                            child: Text('+63', style: TextStyle(color: HexColor('#282828'), fontSize: 15, fontWeight: FontWeight.bold)),
                          )),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      focusNode: controller.pwdNode,
                      controller: controller.pwdController,
                      decoration: InputDecoration(
                        labelText: 'Enter your password',
                        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: HexColor('#CCCCCC')),
                      ),
                      obscureText: true,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: HexColor('#282828')),
                    ),
                    const SizedBox(height: 40),
                    TextButton(
                      onPressed: controller.loginAction,
                      child: Container(
                        height: 35,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: BorderRadius.circular(5)),
                        child: const Text('Log in', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
              const Positioned(left: 0, right: 0, bottom: 0, child: CommonImage(src: 'asset/icons/login_bottom_icon.png'))
            ])));
  }
}
