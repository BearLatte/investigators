import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/models/subcategory.dart';
import 'package:investigators/utils/global.dart';

import '../utils/hex_color.dart';

class CommonBottomSheet {
  static Future<int?> showBottomSheet(String title, {required List<Subcategory> options}) async {
    return await Get.bottomSheet(
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        Container(
          constraints: const BoxConstraints(maxHeight: 350),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(children: [
                Container(
                    width: double.infinity,
                    height: 52,
                    alignment: Alignment.center,
                    color: Global.instance.themeColor,
                    child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600))),
                Positioned(top: 5, right: 0, child: IconButton(onPressed: Get.back, icon: const Icon(Icons.close, size: 20, color: Colors.white)))
              ]),
              Expanded(
                child: SingleChildScrollView(
                  child: SafeArea(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                        options.length,
                        (index) => TextButton(
                            onPressed: () => Get.back(result: index),
                            style: TextButton.styleFrom(padding: EdgeInsets.zero, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                            child: Container(
                                alignment: Alignment.center,
                                height: 52,
                                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: HexColor('#FFCCCCCC'), width: 0.5))),
                                child: Text(options[index].cateName, style: TextStyle(color: HexColor('#FF3B414B'), fontSize: 15))))),
                  )),
                ),
              )
            ],
          ),
        ));
  }
}
