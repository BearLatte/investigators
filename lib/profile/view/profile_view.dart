import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investigators/common/base_view.dart';
import 'package:investigators/profile/controller/profile_controller.dart';
import 'package:investigators/utils/global.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: Get.put(ProfileController()),
      builder: (controller) => BaseView(
        appBarAdditionalHeight: 120,
        appBarBottomWidget: SizedBox(
          height: 120,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                height: 20,
                margin: const EdgeInsets.only(top: 10, left: 15),
                child: const Text('Hello, Friend', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
            Container(
              height: 15,
              margin: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
              child: const Text('登录账号占位', style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
            Container(
              height: 35,
              margin: const EdgeInsets.fromLTRB(12, 0, 100, 10),
              padding: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(3))),
              child: InkWell(
                  onTap: controller.historiesSignList,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('History Interviews', style: TextStyle(color: Global.instance.themeColor, fontSize: 12)),
                    Icon(Icons.keyboard_arrow_right, color: Global.instance.themeColor, size: 20)
                  ])),
            )
          ]),
        ),
        child: Center(
          child: TextButton(
            onPressed: controller.logout,
            style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8), side: BorderSide(color: Global.instance.themeColor, width: 1)),
            child: Text('Pull out', style: TextStyle(color: Global.instance.themeColor, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
