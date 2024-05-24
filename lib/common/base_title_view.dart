import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/utils/global.dart';

class BaseTitleView extends StatelessWidget {
  final String title;
  final Widget body;
  final void Function()? backAction;

  const BaseTitleView({
    super.key,
    required this.title,
    required this.body,
    this.backAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Global.instance.themeColor,
        leading: IconButton(onPressed: backAction ?? Get.back, icon:const Icon(Icons.arrow_back_ios_new_rounded, size: 15, color: Colors.white)),
        title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
      ),
      body: body,
    );
  }
}
