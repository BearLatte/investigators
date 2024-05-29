import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/common/base_title_view.dart';
import 'package:investigators/profile/controller/interview_history_list_controller.dart';
import 'package:investigators/utils/global.dart';
import 'package:investigators/utils/hex_color.dart';

class InterviewHistoryListView extends StatelessWidget {
  const InterviewHistoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InterviewHistoryListController>(
        init: Get.put(InterviewHistoryListController()),
        builder: (controller) => BaseTitleView(
            title: 'History Interviews',
            body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                color: HexColor('#EBF8F9'),
                child: Text('Interview records are displayed only the last 3 months.', style: TextStyle(color: Global.instance.themeColor, fontSize: 13)),
              ),
              Expanded(
                  child: ListView(
                      children: controller.historyList
                          .map((item) => Container(
                                margin: const EdgeInsets.only(top: 10, left: 12, right: 12),
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.month, style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 15, fontWeight: FontWeight.bold)),
                                    Text('Number of interviews ${item.signSuccessCount}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13))
                                  ],
                                ),
                              ))
                          .toList())),
            ])));
  }
}
