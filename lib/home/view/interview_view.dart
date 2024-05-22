import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/home/controller/interview_controller.dart';
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
        child: ListView(),
      ),
    );
  }
}
