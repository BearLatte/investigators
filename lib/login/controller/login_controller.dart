import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investigators/common/common_snack_bar.dart';
import 'package:investigators/network_service/index.dart';
import 'package:investigators/utils/global.dart';
import 'package:investigators/utils/hex_color.dart';

class LoginController extends GetxController {
  FocusNode phoneNode = FocusNode();
  FocusNode pwdNode = FocusNode();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    phoneController.text = '9789732334';
    pwdController.text = '123456';
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
    phoneNode.dispose();
    pwdNode.dispose();
    super.onClose();
  }

  void loginAction() async {
    String phone = phoneController.text.trim();
    String password = pwdController.text.trim();
    String verifyCode = codeController.text.trim();

    if (phone.isEmpty) return CommonSnackBar.showSnackBar('Please enter your phone number!');
    if (phone.length != 10) return CommonSnackBar.showSnackBar('Please enter correct phone number!');

    if (password.isEmpty) return CommonSnackBar.showSnackBar('Please enter password!');

    bool needsVerifyCode = await NetworkService.isNeedEnterVerifyCode(phone: phone, password: password);
    if (needsVerifyCode) {
      _showVerifyCodeAlert();
    } else {
      NetworkService.login(phone: phone, password: password, code: verifyCode);
    }
  }

  void _sendVerifyCode() {}

  void _showVerifyCodeAlert() {
    Get.dialog(
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
                  Text(
                    'A verification code has sent to your mobile phone number 09xxxxxxxxx, please enter it below.',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: HexColor('#282828'),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
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
                    onTap: _sendVerifyCode,
                    child: Text('Did not receive the code? Try again', style: TextStyle(color: Global.instance.themeColor)),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                      onPressed: () {
                        print('验证验证码是否正确');
                        Get.back();
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
