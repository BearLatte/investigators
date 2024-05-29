import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investigators/home/controller/Appointment_controller.dart';
import 'package:investigators/home/view/appointment_item_view.dart';
import 'package:investigators/models/address_model.dart';
import 'package:investigators/models/appointment_pending_list.dart';
import 'package:investigators/utils/hex_color.dart';
import 'package:investigators/utils/method_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../utils/global.dart';

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
                    forbiddenAction: (id) => MethodUtil.showUnableInterviewDialog(id, reasonEditingController: controller.reasonEditingController, backAction: () {
                      controller.reasonEditingController.clear();
                      Get.back();
                    }, confirmAction: controller.confirmUnableInterviewAction),
                    subscribeAction: controller.go2reservation,
                  ))
              .toList(),
        ),
        onRefresh: () => controller.onRefresh(true),
        onLoading: () => controller.onRefresh(false),
      ),
    );
  }
}
