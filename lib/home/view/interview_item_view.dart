import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:investigators/models/interview_pending_list.dart';
import 'package:investigators/utils/string_extension.dart';

import '../../utils/global.dart';
import '../../utils/hex_color.dart';

class InterviewItemView extends StatefulWidget {
  final InterviewPendingListData data;
  final void Function(String itemId) modifyAction;
  final Function(InterviewPendingListData interview) modifyAddressAction;
  final void Function(InterviewPendingListData interview) interviewAction;
  final void Function(String itemId) forbiddenAction;

  const InterviewItemView({
    super.key,
    required this.data,
    required this.modifyAction,
    required this.modifyAddressAction,
    required this.interviewAction,
    required this.forbiddenAction,
  });

  @override
  State<InterviewItemView> createState() => _InterviewItemViewState();
}

class _InterviewItemViewState extends State<InterviewItemView> {
  late int _remindTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _remindTime = int.parse(widget.data.remainTime);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remindTime > 0) {
        setState(() {
          _remindTime--;
        });
      } else {
        setState(() {
          _remindTime = 0;
        });
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    String hours = (_remindTime ~/ 3600).toString().padZero;
    String minutes = (_remindTime % 3600 ~/ 60).toString().padZero;
    String seconds = (_remindTime % 60).toString().padZero;
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
                Text('$hours : $minutes : $seconds', style: TextStyle(color: HexColor('#FF3254'), fontSize: 13, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Reservation Time:', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 15, fontWeight: FontWeight.bold)),
                Row(children: [
                  Text(widget.data.bookingTime, style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
                  InkWell(
                      onTap: () => widget.modifyAction(widget.data.signRecordId),
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
                      text: widget.data.addressInfo.type == '1'
                          ? 'Personal Address: ${widget.data.addressInfo.fullAddress}'
                          : 'Company Address: ${widget.data.addressInfo.fullAddress}',
                      style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13),
                    ),
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: InkWell(
                            onTap: () => widget.modifyAddressAction(widget.data),
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
              Text('Order ID: ${widget.data.signRecordId}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
              Text('Name: ${widget.data.identityInfo.fullName}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
              Text('Approved Amount: ${widget.data.approveAmount}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
              Text('Phone Number: ${widget.data.clientTel}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
              const SizedBox(height: 10),
              Row(children: [
                ElevatedButton(
                  onPressed: () => widget.interviewAction(widget.data),
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
                  onPressed: () => widget.forbiddenAction(widget.data.signRecordId),
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
