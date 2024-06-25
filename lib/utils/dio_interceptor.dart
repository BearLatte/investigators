import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:investigators/utils/global.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Inv-lang'] = 'en-us';
    options.headers['Inv-sign'] = await Global.instance.generateRsaKey();
    options.headers['Authorization'] = Global.instance.accessToken;

    // String data = jsonEncode(options.data);
    // String params = jsonEncode(options.queryParameters);
    // String header = jsonEncode(options.headers);
    // print('DEBUG: header = $header, data = $data, params = $params');

    super.onRequest(options, handler);
  }
}
