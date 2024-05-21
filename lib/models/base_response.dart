import 'dart:convert';

import '../generated/json/base/json_convert_content.dart';

class BaseResponse<T> {
  late int code;
  late String msg;
  late String tag;
  T? data;

  BaseResponse({required this.code, required this.msg, required this.tag, this.data});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null && json['data'] != 'null') {
      data = JsonConvert.fromJsonAsT<T>(json['data']);
    }

    code = json['code'];
    msg = json['msg'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data;
    }

    data['code'] = this.code;
    data['tag'] = this.tag;
    data['msg'] = this.msg;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
