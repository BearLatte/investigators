
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:investigators/utils/global.dart';
import 'package:get/get.dart' as router;
import 'package:investigators/router/index.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Inv-lang'] = 'en-us';
    options.headers['Inv-sign'] = await Global.instance.generateRsaKey();
    options.headers['Authorization'] = Global.instance.accessToken;

    debugPrint('DEBUG: header = ${jsonEncode(options.headers)}, data = ${jsonEncode(options.data)}');

    super.onRequest(options, handler);
  }
}
