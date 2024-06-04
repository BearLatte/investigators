import 'dart:collection';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/common/common_snack_bar.dart';
import 'package:investigators/network_service/index.dart';
import 'package:investigators/router/index.dart';
import 'package:investigators/utils/aliyun_oss_util.dart';
import 'package:investigators/utils/global.dart';
import 'package:signature/signature.dart';

class SignatureViewController extends GetxController {
  late Map<String, dynamic> interviewDetailParams;
  SignatureController signatureController = SignatureController(
    penColor: Global.instance.themeColor,
    strokeCap: StrokeCap.round,
    strokeJoin: StrokeJoin.round,
    penStrokeWidth: 5.0,
    exportBackgroundColor: Colors.transparent,
  );

  @override
  void onInit() {
    super.onInit();
    interviewDetailParams = Get.arguments;
  }

  @override
  void onClose() {
    signatureController.dispose();
    super.onClose();
  }

  void confirmAction() async {
    Uint8List? pngBytes = await signatureController.toPngBytes();
    if (pngBytes == null) return CommonSnackBar.showSnackBar('Save signature image failed, please try again latter!', type: SnackType.error);
    String? signatureImg = await AliyunOssUtil.instance.uploadImage(bytes: pngBytes);
    if (signatureImg == null) return CommonSnackBar.showSnackBar('Signature image upload failed, please try again latter!', type: SnackType.error);
    interviewDetailParams['sign_img'] = signatureImg.substring(signatureImg.lastIndexOf('/') + 1);
    bool isSuccess = await NetworkService.saveInterviewContent(interviewDetailParams);
    if (isSuccess) {
      showToast();
    }
  }

  void showToast() {
    Get.dialog(
      PopScope(
        canPop: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatedBox(
              quarterTurns: 1,
              child: Container(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                width: 300,
                height: 160,
                decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Interview Finished!', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () => Get.until((route) => route.settings.name == ApplicationRoutes.tab),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                        child: Text('Confirm', style: TextStyle(color: Global.instance.themeColor, fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
