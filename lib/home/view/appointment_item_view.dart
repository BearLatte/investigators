import 'package:flutter/material.dart';
import 'package:investigators/utils/string_extension.dart';

import '../../models/appointment_pending_list.dart';
import '../../utils/global.dart';
import '../../utils/hex_color.dart';

class AppointmentItemView extends StatelessWidget {
  final AppointmentPendingListData data;
  final void Function(String phone) callUpAction;
  final void Function(AppointmentPendingListData item) subscribeAction;
  final void Function(String itemId)? forbiddenAction;

  const AppointmentItemView({
    super.key,
    required this.data,
    required this.callUpAction,
    required this.subscribeAction,
    this.forbiddenAction,
  });

  @override
  Widget build(BuildContext context) {
    int remindTime = int.parse(data.remainTime);
    String hours = (remindTime ~/ 3600).toString().padZero;
    String minutes = (remindTime % 3600 ~/ 60).toString().padZero;
    String seconds = (remindTime % 60).toString().padZero;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 8, bottom: 5),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: HexColor('#0370BA')))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Contact the Client', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13, fontWeight: FontWeight.bold)),
                Text(remindTime > 0 ? '$hours : $minutes : $seconds' : 'Out Of Time', style: TextStyle(color: HexColor('#FF3254'), fontSize: 13, fontWeight: FontWeight.bold))
              ])),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Order ID: ${data.signRecordId}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
                Text('Name: ${data.identityInfo.fullName}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
                Text('Approved Amount: ${data.approveAmount}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
                Row(
                  children: [
                    Text('Phone Number: ${data.clientTel}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () => callUpAction(data.clientTel),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: BorderRadius.circular(3)),
                        child: const Text('Call up', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
                Row(children: [
                  ElevatedButton(
                    onPressed: () => subscribeAction(data),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Global.instance.themeColor,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      minimumSize: const Size(75, 25),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    child: const Text('Reserve', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (forbiddenAction != null) forbiddenAction!(data.signRecordId);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Global.instance.themeColor,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      minimumSize: const Size(120, 25),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    child: const Text('Unable to interview', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                  ),
                ])
              ]))
        ],
      ),
    );
  }
}
