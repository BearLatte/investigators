import 'package:investigators/generated/json/base/json_field.dart';
import 'dart:convert';

import '../generated/json/ali_oss_access_data.g.dart';

@JsonSerializable()
class AliOssAccessData {
	late String accessKeyId;
	late String accessKeySecret;
	late String securityToken;
	late String expiration;
	late String bucket;
	@JSONField(name: "oss_url_prefix")
	late String ossUrlPrefix;

	AliOssAccessData();

	factory AliOssAccessData.fromJson(Map<String, dynamic> json) => $AliOssAccessDataFromJson(json);

	Map<String, dynamic> toJson() => $AliOssAccessDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}