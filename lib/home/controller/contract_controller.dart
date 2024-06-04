import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:investigators/router/index.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../environment/config.dart';

class ContractController extends GetxController {
  late Map<String, dynamic> params;
  late final WebViewController webViewController;

  @override
  void onInit() async {
    super.onInit();

    late final PlatformWebViewControllerCreationParams webParams;

    EasyLoading.showProgress(0.0);
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      webParams = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      webParams = const PlatformWebViewControllerCreationParams();
    }
    webViewController = WebViewController.fromPlatformCreationParams(webParams);

    params = Get.arguments['detail_params'];
    String pid = Get.arguments['pid'];
    String rid = Get.arguments['rid'];
    String money = Get.arguments['money'];
    String token = Get.arguments['token'];

    final env = Get.find<BuildEnvironment>();
    String url = '${env.apiBaseURL}/static/contract/loan_agreement?pid=$pid&rid=$rid&money=$money&token=$token';
    webViewController
      ..setNavigationDelegate(NavigationDelegate(onProgress: (progress) {
        EasyLoading.showProgress(progress.toDouble() / 100.0);
        if (progress == 100) {
          EasyLoading.dismiss();
        }
      }))
      ..loadRequest(Uri.parse(url));
  }

  void nextAction() {
    Get.toNamed(ApplicationRoutes.signature, arguments: params);
  }
}
