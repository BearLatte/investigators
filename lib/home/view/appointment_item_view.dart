import 'dart:async';

import 'package:flutter/material.dart';
import 'package:investigators/models/appointment_pending_list.dart';
import 'package:investigators/utils/global.dart';
import 'package:investigators/utils/string_extension.dart';

import '../../utils/hex_color.dart';

class AppointmentItemView extends StatefulWidget {
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
  State<AppointmentItemView> createState() => _AppointmentItemViewState();
}

class _AppointmentItemViewState extends State<AppointmentItemView> {
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
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 8, bottom: 5),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: HexColor('#0370BA')))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Contact the Client', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13, fontWeight: FontWeight.bold)),
                Text('$hours : $minutes : $seconds', style: TextStyle(color: HexColor('#FF3254'), fontSize: 13, fontWeight: FontWeight.bold))
              ])),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Order ID: ${widget.data.signRecordId}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
                Text('Name: ${widget.data.identityInfo.fullName}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
                Text('Approved Amount: ${widget.data.approveAmount}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
                Row(
                  children: [
                    Text('Phone Number: ${widget.data.clientTel}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () => widget.callUpAction(widget.data.clientTel),
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
                    onPressed: () => widget.subscribeAction!(widget.data),
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
                      if (widget.forbiddenAction != null) widget.forbiddenAction!(widget.data.signRecordId);
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
