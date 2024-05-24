import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:investigators/common/base_view.dart';
import 'package:investigators/home/controller/home_view_controller.dart';
import 'package:investigators/home/view/interview_view.dart';
import 'package:investigators/home/view/appointment_view.dart';
import 'package:investigators/home/view/returned_view.dart';
import 'package:investigators/utils/hex_color.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      init: Get.put(HomeViewController()),
      builder: (controller) => BaseView(
        titleIcon: Icons.sign_language_rounded,
        title: 'Investigators',
        appBarAdditionalHeight: 57,
        appBarBottomWidget: SizedBox(
          height: 57,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TabBar(
                controller: controller.tabController,
                padding: const EdgeInsets.only(right: 40),
                tabs: controller.tabs,
                dividerHeight: 0,
                indicatorWeight: 1,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                labelPadding: const EdgeInsets.fromLTRB(0, 0, 10, 2),
                labelColor: Colors.white,
                unselectedLabelColor: HexColor('#9FB6C6'),
              )
            ],
          ),
        ),
        child: TabBarView(
          controller: controller.tabController,
          children: const [AppointmentView(), InterviewView(), ReturnedView()],
        ),
      ),
    );
  }
}
