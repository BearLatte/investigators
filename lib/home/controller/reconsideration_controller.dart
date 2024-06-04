import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:investigators/common/common_snack_bar.dart';

import '../../router/index.dart';
import '../../utils/aliyun_oss_util.dart';
import '../../utils/method_util.dart';

class ReconsiderationController extends GetxController {
  late CameraDescription camera;
  late Map<String, dynamic> params;
  List<String> photos = [];

  TextEditingController reasonTextEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    params = Get.arguments['params'];
    camera = Get.arguments['camera'];
  }

  @override
  void onClose() {
    reasonTextEditingController.dispose();
    super.onClose();
  }

  void addImageAction() async {
    var imgPath = await Get.toNamed(ApplicationRoutes.takePhoto, arguments: camera);
    // 上传图片
    String? uploadedImgName = await AliyunOssUtil.instance.uploadImage(filePath: imgPath);
    if (uploadedImgName == null) return;
    photos.add(uploadedImgName);
    update();
  }

  void imgItemOnTap(int index) {}

  void confirmAction() {
    String reason = reasonTextEditingController.text.trim();
    if (reason.isEmpty) return CommonSnackBar.showSnackBar('Reason of Limit Increasing cannot be empty!');
    Map<String, dynamic> addition = {};
    addition['addition_status'] = '2';
    addition['content'] = MethodUtil.configImageNames(photos);
    addition['additional_content'] = reason;
    params['addition'] = jsonEncode(addition);
    Get.toNamed(ApplicationRoutes.signature, arguments: params);
  }
}
