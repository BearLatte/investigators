import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/common/base_title_view.dart';
import 'package:investigators/home/controller/reconsideration_controller.dart';
import 'package:investigators/home/view/photo_upload_item.dart';
import 'package:investigators/utils/global.dart';

class ReconsiderationView extends StatelessWidget {
  const ReconsiderationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseTitleView(
      title: 'Reconsideration Application',
      body: GetBuilder<ReconsiderationController>(
        init: Get.put(ReconsiderationController()),
        builder: (ReconsiderationController controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              PhotoUploadItem(
                images: controller.photos,
                title: 'Identification Information',
                addAction: controller.addImageAction,
                itemOnTap: controller.imgItemOnTap,
              ),
              const SizedBox(height: 20),
              Text(
                'Reason of Limit Increasing',
                style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 15),
              ),
              const SizedBox(height: 10),
              TextField(
                style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 14),
                controller: controller.reasonTextEditingController,
                maxLines: 5,
                decoration: InputDecoration(
                    hintText: 'Please elaborate on the reason',
                    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Global.instance.themeColor))),
              ),
              const SizedBox(height: 15),
              TextButton(
                  onPressed: controller.confirmAction,
                  child: Container(
                    width: double.infinity,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: BorderRadius.circular(8)),
                    child: const Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                  ))
            ])),
      ),
    );
  }
}
