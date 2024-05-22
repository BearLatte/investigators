import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/utils/global.dart';

enum SnackType { info, error, success }

class CommonSnackBar {
  static SnackbarStatus snackBarStatus = SnackbarStatus.CLOSED;

  static void showSnackBar(String? message, {String? title, SnackType type = SnackType.info}) {
    String snackBarTitle = title ?? (type == SnackType.info ? 'Info' : (type == SnackType.error ? 'Error' : 'Success'));
    IconData snackBarIcon = type == SnackType.info ? Icons.info_outline : (type == SnackType.error ? Icons.error_outline_outlined : Icons.check_outlined);
    Color iconColor = type == SnackType.info ? Colors.orangeAccent : (type == SnackType.error ? Colors.redAccent : Colors.lightGreenAccent);
    if (snackBarStatus == SnackbarStatus.CLOSED) {
      Get.showSnackbar(
        GetSnackBar(
          snackbarStatus: (state) => snackBarStatus = state!,
          barBlur: 10.0,
          borderRadius: 12,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          duration: const Duration(milliseconds: 1500),
          icon: Icon(snackBarIcon, color: iconColor, size: 40),
          titleText: Text(snackBarTitle, style: TextStyle(color: Global.instance.themeColor, fontSize: 20, fontWeight: FontWeight.bold)),
          messageText: Text(message ?? '', style: TextStyle(color: Global.instance.themeColor, fontSize: 16)),
          backgroundColor: Colors.black.withOpacity(0.5),
        ),
      );
    }
  }
}
