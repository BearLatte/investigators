import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/home/controller/interview_controller.dart';
import 'package:investigators/home/view/interview_item_view.dart';
import 'package:investigators/utils/method_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class InterviewView extends StatelessWidget {
  const InterviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InterviewController>(
      init: Get.put(InterviewController()),
      builder: (controller) => SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () => controller.onRefresh(true),
        onLoading: () => controller.onRefresh(false),
        header: const WaterDropHeader(),
        footer: const ClassicFooter(),
        enablePullUp: true,
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: controller.dataList
                .map(
                  (item) => InterviewItemView(
                    data: item,
                    modifyAction: controller.modifyAction,
                    modifyAddressAction: controller.modifyAddress,
                    interviewAction: controller.interviewAction,
                    forbiddenAction: (id) => MethodUtil.showUnableInterviewDialog(id, reasonEditingController: controller.reasonEditingController, backAction: () {
                      controller.reasonEditingController.clear();
                      Get.back();
                    }, confirmAction: controller.confirmUnable2Interview),
                  ),
                )
                .toList()),
      ),
    );
  }
}
