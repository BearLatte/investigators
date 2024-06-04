import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/utils/global.dart';
import 'package:investigators/utils/hex_color.dart';
import 'package:signature/signature.dart';
import '../controller/signature_view_controller.dart';

class SignatureView extends StatelessWidget {
  const SignatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RotatedBox(
          quarterTurns: 1,
          child: GetBuilder<SignatureViewController>(
            init: Get.put(SignatureViewController()),
            builder: (SignatureViewController controller) => Stack(
              children: [
                Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: HexColor('#F1FAFF'),
                    child: Center(
                        child: Text('Please handwrite your real name', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 35, fontWeight: FontWeight.bold)))),
                Signature(
                  controller: controller.signatureController,
                  backgroundColor: Colors.transparent,
                ),
                Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: controller.confirmAction,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                            decoration: BoxDecoration(color: HexColor('#0370BA'), borderRadius: BorderRadius.circular(8)),
                            child: const Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: Get.back,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                            decoration: BoxDecoration(color: HexColor('#0370BA'), borderRadius: BorderRadius.circular(8)),
                            child: const Text('Cancel', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
