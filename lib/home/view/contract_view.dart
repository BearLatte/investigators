import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/common/base_title_view.dart';
import 'package:investigators/home/controller/contract_controller.dart';
import 'package:investigators/utils/global.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContractView extends StatelessWidget {
  const ContractView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseTitleView(
      title: 'Contract Particulars',
      body: GetBuilder<ContractController>(
        init: ContractController(),
        builder: (ContractController controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: WebViewWidget(controller: controller.webViewController)),
            Container(
              color: Colors.white,
              padding:const EdgeInsets.all(8),
              child: TextButton(
                onPressed: controller.nextAction,
                child: Container(
                  height: 35,
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Global.instance.themeColor, borderRadius: BorderRadius.circular(8)),
                  child: const Text('Next', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
