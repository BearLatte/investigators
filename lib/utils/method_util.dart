import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'global.dart';
import 'hex_color.dart';

class MethodUtil {
  static bool isNullOrEmpty(dynamic obj) {
    if (obj == null) {
      return true;
    }

    if (obj is String) {
      return obj.isEmpty || obj == 'null';
    }

    if (obj is num) {
      return false;
    }

    if (obj is int) {
      return false;
    }

    if (obj is DateTime) {
      return false;
    }

    if (obj is Map) {
      return obj.isEmpty;
    }

    if (obj is List) {
      return obj.isEmpty;
    }

    return false;
  }

  static List<String> configImageNames(List<String> imgs) {
    List<String> photoNames = [];
    for (var img in imgs) {
      int index = img.lastIndexOf('/');
      photoNames.add(img.substring(index + 1));
    }

    return photoNames;
  }

  /*
  * 无法预约功能弹窗
  * */
  static void showUnableInterviewDialog(
    String dataId, {
    TextEditingController? reasonEditingController,
    required void Function() backAction,
    required void Function(String itemId) confirmAction,
  }) {
    Get.dialog(
        barrierDismissible: false,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text('Reason for not being able to interview', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    TextField(
                      maxLines: 5,
                      style: TextStyle(color: HexColor('#282828'), fontSize: 13),
                      controller: reasonEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: HexColor('#DAEFFD'),
                        hintText: 'Please enter the reason',
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: HexColor('#CCCCCC'), width: 1.0), borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 1.0), borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                        onPressed: () => confirmAction(dataId),
                        child: Container(
                          height: 35,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                          child: Text('Confirm', style: TextStyle(color: Global.instance.themeColor, fontSize: 13, fontWeight: FontWeight.bold)),
                        )),
                  ],
                ),
              ),
              Positioned(
                  top: -12,
                  right: 0,
                  child: IconButton(
                    onPressed: backAction,
                    icon: Container(color: Colors.white, child: Icon(Icons.close_outlined, color: Global.instance.themeColor)),
                  )),
            ])
          ],
        ));
  }
}
