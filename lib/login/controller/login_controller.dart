import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nb_net/flutter_net.dart';
import 'package:get/get.dart';
import 'package:investigators/common/common_snack_bar.dart';
import 'package:investigators/network_service/index.dart';
import 'package:investigators/router/index.dart';
import 'package:investigators/utils/global.dart';
import 'package:investigators/utils/hex_color.dart';

class LoginController extends GetxController {
  FocusNode phoneNode = FocusNode();
  FocusNode pwdNode = FocusNode();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  late String _wasSentCode;

  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(() {
      if (phoneController.text.trim().length == 10) {
        pwdNode.requestFocus();
      }
    });
  }

  @override
  void onClose() {
    phoneController.dispose();
    pwdController.dispose();
    codeController.dispose();
    phoneNode.dispose();
    pwdNode.dispose();
    super.onClose();
  }

  void loginAction() async {
    String phone = phoneController.text.trim();
    String password = pwdController.text.trim();

    if (phone.isEmpty) return CommonSnackBar.showSnackBar('Please enter your phone number!');
    if (phone.length != 10) return CommonSnackBar.showSnackBar('Please enter correct phone number!');

    if (password.isEmpty) return CommonSnackBar.showSnackBar('Please enter password!');

    bool needsVerifyCode = await NetworkService.isNeedEnterVerifyCode(phone: phone, password: password);
    if (needsVerifyCode) {
      String? code = await NetworkService.sendVerifyCode(phone: phone);
      if (code == null) return CommonSnackBar.showSnackBar('Failed to send the verification code, please send again later!');
      _wasSentCode = code;
      if (await _showVerifyCodeAlert()) {
        _loginAction(phone: phone, password: password, verifyCode: codeController.text);
      }
    } else {
      _loginAction(phone: phone, password: password);
    }
  }

  void _loginAction({required String phone, required String password, String? verifyCode}) async {
    String? token = await NetworkService.login(phone: phone, password: password, code: verifyCode);
    if (token == null) return;
    Global.instance.prefs.setString(Global.ACCESS_TOKEN_KEY, 'Inv $token');
    Global.instance.prefs.setBool(Global.LOG_IN_BADGE_KEY, true);
    Get.offAllNamed(ApplicationRoutes.tab);
  }



  Future<bool> _showVerifyCodeAlert() async {
    codeController.clear();
    return await Get.dialog(
      barrierDismissible: false,
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: 'A verification code has sent to your mobile phone number ',
                          style: TextStyle(
                            color: HexColor('#282828'),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                          text: phoneController.text.replaceRange(2, phoneController.text.length, '********'),
                          style: TextStyle(
                            color: Global.instance.themeColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                          text: ', please enter it below.',
                          style: TextStyle(
                            color: HexColor('#282828'),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ))
                    ]),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: codeController,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Please enter the SMS verification code'),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: HexColor('#282828')),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      await NetworkService.sendVerifyCode(phone: phoneController.text);
                    },
                    child: Text('Did not receive the code? Try again', style: TextStyle(color: Global.instance.themeColor)),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                      onPressed: () {
                        if (_wasSentCode == codeController.text) {
                          Get.back(result: true);
                        } else {
                          CommonSnackBar.showSnackBar('The verification code entered is wrong!', type: SnackType.error);
                        }
                      },
                      child: Container(
                        height: 35,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: BorderRadius.circular(5)),
                        child: const Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
