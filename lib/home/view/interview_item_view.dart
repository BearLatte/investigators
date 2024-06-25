import 'package:flutter/material.dart';
import 'package:investigators/utils/string_extension.dart';

import '../../models/interview_pending_list.dart';
import '../../utils/global.dart';
import '../../utils/hex_color.dart';

class InterviewItemView extends StatelessWidget {
  final InterviewPendingListData data;
  final void Function(InterviewPendingListData interview) modifyAction;
  final void Function(InterviewPendingListData interview) interviewAction;
  final void Function(String itemId) forbiddenAction;
  final void Function(String phone) callUpAction;

  const InterviewItemView({
    super.key,
    required this.data,
    required this.modifyAction,
    required this.interviewAction,
    required this.forbiddenAction,
    required this.callUpAction,
  });

  @override
  Widget build(BuildContext context) {
    int remindTime = int.parse(data.remainTime);
    String hours = (remindTime ~/ 3600).toString().padZero;
    String minutes = (remindTime % 3600 ~/ 60).toString().padZero;
    String seconds = (remindTime % 60).toString().padZero;
    late String selectedAddress;
    for (final address in data.addressInfo) {
      if (address.addressId == data.bookingAddress) {
        selectedAddress = address.fullAddress;
      }
    }
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Global.instance.themeColor, width: 1.0))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Interview', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
                Text(remindTime > 0 ? '$hours : $minutes : $seconds' : 'Out Of Time', style: TextStyle(color: HexColor('#FF3254'), fontSize: 13, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Reservation Time:', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 15, fontWeight: FontWeight.bold)),
                Row(children: [
                  Text(data.bookingTime, style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
                  InkWell(
                      onTap: () => modifyAction(data),
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: BorderRadius.circular(2)),
                        child: const Text('Modify', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                      ))
                ]),
                Text('Reservation Location:', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 15, fontWeight: FontWeight.bold)),
                Text.rich(TextSpan(
                  children: [
                    TextSpan(
                      text: selectedAddress,
                      style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13),
                    ),
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: InkWell(
                            onTap: () => modifyAction(data),
                            child: Container(
                              margin: const EdgeInsets.only(left: 5),
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                              decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: BorderRadius.circular(2)),
                              child: const Text('Modify', style: TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
              ])),
          Container(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Order ID: ${data.signRecordId}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
              Text('Name: ${data.identityInfo.fullName}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
              Text('Approved Amount: ${data.approveAmount}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
              Row(children: [
                Text('Phone Number: ${data.clientTel}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
                InkWell(
                  onTap: () => callUpAction(data.clientTel),
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: BorderRadius.circular(3)),
                    child: const Text('Call up', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                  ),
                )
              ]),
              const SizedBox(height: 10),
              Row(children: [
                ElevatedButton(
                  onPressed: () => interviewAction(data),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Global.instance.themeColor,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    minimumSize: const Size(75, 25),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                  child: const Text('Interview', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => forbiddenAction(data.signRecordId),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Global.instance.themeColor,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    minimumSize: const Size(120, 25),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                  child: const Text('Unable to interview', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                ),
              ])
            ]),
          )
        ],
      ),
    );
  }
}
