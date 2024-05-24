import 'package:flutter/material.dart';
import 'package:investigators/models/returned_list.dart';
import 'package:investigators/utils/global.dart';
import 'package:investigators/utils/hex_color.dart';

class ReturnedItemView extends StatelessWidget {
  final ReturnedListData data;
  final void Function(String phone) callUpAction;
  final void Function(ReturnedListData data) modifyAction;

  const ReturnedItemView({super.key, required this.data, required this.modifyAction, required this.callUpAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      margin: const EdgeInsets.only(left: 12, top: 12, right: 12),
      decoration: BoxDecoration(color: HexColor('#F5F6FF'), borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: BorderRadius.circular(3)),
            child: Text.rich(TextSpan(children: [
              const TextSpan(text: 'Return Reasons: ', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              TextSpan(text: data.cancelReason, style: const TextStyle(color: Colors.white, fontSize: 13)),
            ])),
          ),
          Text('Order ID: ${data.signRecordId}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
          Text('Name: ${data.identityInfo.fullName}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
          Text('Approved Amount: ${data.approveAmount} PHP', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
          Row(children: [
            Text('Phone Number: ${data.clientTel}', style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 13)),
            InkWell(
              onTap: () => callUpAction(data.clientTel),
              child: Container(
                margin:const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: BorderRadius.circular(3)),
                child: const Text('Call up', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),),
              ),
            )
          ]),
          const SizedBox(height: 20),
          InkWell(
            onTap: () => modifyAction(data),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: BorderRadius.circular(3)),
              child: const Text('Modify', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}
