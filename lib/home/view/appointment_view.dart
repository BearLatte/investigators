import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/home/controller/Appointment_controller.dart';
import 'package:investigators/home/view/appointment_item_view.dart';
import 'package:investigators/models/appointment_pending_list.dart';
import 'package:investigators/utils/hex_color.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentController>(
      init: Get.put(AppointmentController()),
      builder: (controller) => SmartRefresher(
        controller: controller.refreshController,
        header: const WaterDropHeader(),
        footer: const ClassicFooter(),
        enablePullUp: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: controller.dataList
              .map((model) => AppointmentItemView(
                    data: model,
                    callUpAction: controller.callUp,
                    forbiddenAction: controller.forbiddenAction,
                    subscribeAction: controller.reserveAction,
                  ))
              .toList(),
        ),
        onRefresh: () => controller.onRefresh(true),
        onLoading: () => controller.onRefresh(false),
      ),
    );
  }
}
