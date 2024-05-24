import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investigators/home/controller/Appointment_controller.dart';
import 'package:investigators/home/view/appointment_item_view.dart';
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
                    subscribeAction: _showReserveDialog,
                  ))
              .toList(),
        ),
        onRefresh: () => controller.onRefresh(true),
        onLoading: () => controller.onRefresh(false),
      ),
    );
  }

  void _showReserveDialog(AppointmentPendingListData data) {
    late AppointmentPendingListDataAddressInfo residentialAdd;
    late AppointmentPendingListDataAddressInfo companyAdd;
    for (var item in data.addressInfo) {
      if (item.type == '1') {
        residentialAdd = item;
      } else {
        companyAdd = item;
      }
    }
    Get.dialog(
      barrierDismissible: false,
      Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
        GetBuilder<AppointmentController>(
            builder: (controller) => Stack(children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    decoration: BoxDecoration(
                      color: Global.instance.themeColor,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                    ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      const SizedBox(height: 10),
                      const Text('Reservation Time:', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      _createTextField(controller.dateEditingController, hitText: 'Select Date', onTapAction: _showDateTimeSelector),
                      const SizedBox(height: 5),
                      _createTextField(controller.timeController, hitText: 'Select Time', onTapAction: controller.showTimeSelector),
                      const SizedBox(height: 10),
                      const Text('Reservation Location:', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      InkWell(
                          onTap: () => controller.selectedAddressAction(residentialAdd),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                            decoration: BoxDecoration(
                                color: controller.selectedAddressInfo == residentialAdd ? Colors.white : HexColor('#D9EFFD'),
                                border: Border.all(color: Colors.white, width: 1.0),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'Residential Address: ${residentialAdd.fullAddress}',
                              style: TextStyle(
                                color: controller.selectedAddressInfo == residentialAdd ? Global.instance.themeColor : Global.instance.textPrimaryColor,
                                fontSize: 13,
                              ),
                            ),
                          )),
                      InkWell(
                          onTap: () => controller.selectedAddressAction(companyAdd),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                            decoration: BoxDecoration(
                                color: controller.selectedAddressInfo == companyAdd ? Colors.white : HexColor('#D9EFFD'),
                                border: Border.all(color: Colors.white, width: 1.0),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'Company Address: ${companyAdd.fullAddress}',
                              style: TextStyle(color: controller.selectedAddressInfo == companyAdd ? Global.instance.themeColor : Global.instance.textPrimaryColor, fontSize: 13),
                            ),
                          )),
                      const SizedBox(height: 5),
                      TextButton(
                          onPressed: () => controller.confirmReservation(data.signRecordId),
                          child: Container(
                            height: 35,
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                            child: Text('Confirm', style: TextStyle(color: Global.instance.themeColor, fontSize: 15, fontWeight: FontWeight.bold)),
                          ))
                    ]),
                  ),
                  Positioned(
                    top: -12,
                    right: 0,
                    child: IconButton(
                        onPressed: controller.clearReservationInfoAndBack,
                        icon: Container(color: Colors.white, child: Icon(Icons.close_outlined, color: Global.instance.themeColor))),
                  )
                ])),
      ]),
    );
  }

  TextField _createTextField(TextEditingController controller, {String? hitText, void Function()? onTapAction}) {
    return TextField(
      controller: controller,
      style: TextStyle(color: HexColor('#282828'), fontSize: 13),
      onTap: onTapAction,
      keyboardType: TextInputType.none,
      readOnly: true,
      decoration: InputDecoration(
          hintText: hitText,
          hintStyle: TextStyle(color: HexColor('#75849D'), fontSize: 13),
          filled: true,
          isCollapsed: true,
          fillColor: HexColor('#D9EFFD'),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.0)),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.0)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
    );
  }

  // 弹出日期选择器
  void _showDateTimeSelector() {
    Get.bottomSheet(
      isDismissible: false,
      enableDrag: false,
      GetBuilder<AppointmentController>(
        builder: (controller) => Container(
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: HexColor('#CCCCCC'), width: 1.0))),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    InkWell(
                      onTap: Get.back,
                      child: Text('Cancel', style: TextStyle(color: Global.instance.themeColor, fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    InkWell(
                      onTap: controller.confirmSelectDate,
                      child: Text('Confirm', style: TextStyle(color: Global.instance.themeColor, fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ])),
              EasyInfiniteDateTimeLine(
                firstDate: DateTime.now(),
                focusDate: controller.selectedDate,
                lastDate: DateTime.now().add(const Duration(days: 30)),
                showTimelineHeader: false,
                onDateChange: controller.selectDate,
              )
            ],
          ),
        ),
      ),
    );
  }
}
