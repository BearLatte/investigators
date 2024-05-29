import 'package:investigators/generated/json/base/json_convert_content.dart';
import 'package:investigators/models/ali_oss_access_data.dart';

AliOssAccessData $AliOssAccessDataFromJson(Map<String, dynamic> json) {
  final AliOssAccessData aliOssAccessData = AliOssAccessData();
  final String? accessKeyId = jsonConvert.convert<String>(json['accessKeyId']);
  if (accessKeyId != null) {
    aliOssAccessData.accessKeyId = accessKeyId;
  }
  final String? accessKeySecret = jsonConvert.convert<String>(json['accessKeySecret']);
  if (accessKeySecret != null) {
    aliOssAccessData.accessKeySecret = accessKeySecret;
  }
  final String? securityToken = jsonConvert.convert<String>(json['securityToken']);
  if (securityToken != null) {
    aliOssAccessData.securityToken = securityToken;
  }
  final String? expiration = jsonConvert.convert<String>(json['expiration']);
  if (expiration != null) {
    aliOssAccessData.expiration = expiration;
  }
  final String? bucket = jsonConvert.convert<String>(json['bucket']);
  if (bucket != null) {
    aliOssAccessData.bucket = bucket;
  }
  final String? ossUrlPrefix = jsonConvert.convert<String>(json['oss_url_prefix']);
  if (ossUrlPrefix != null) {
    aliOssAccessData.ossUrlPrefix = ossUrlPrefix;
  }
  return aliOssAccessData;
}

Map<String, dynamic> $AliOssAccessDataToJson(AliOssAccessData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['accessKeyId'] = entity.accessKeyId;
  data['accessKeySecret'] = entity.accessKeySecret;
  data['securityToken'] = entity.securityToken;
  data['expiration'] = entity.expiration;
  data['bucket'] = entity.bucket;
  data['oss_url_prefix'] = entity.ossUrlPrefix;
  return data;
}

extension AliOssAccessDataExtension on AliOssAccessData {
  AliOssAccessData copyWith({
    String? accessKeyId,
    String? accessKeySecret,
    String? securityToken,
    String? expiration,
    String? bucket,
    String? ossUrlPrefix,
  }) {
    return AliOssAccessData()
      ..accessKeyId = accessKeyId ?? this.accessKeyId
      ..accessKeySecret = accessKeySecret ?? this.accessKeySecret
      ..securityToken = securityToken ?? this.securityToken
      ..expiration = expiration ?? this.expiration
      ..bucket = bucket ?? this.bucket
      ..ossUrlPrefix = ossUrlPrefix ?? this.ossUrlPrefix;
  }
}