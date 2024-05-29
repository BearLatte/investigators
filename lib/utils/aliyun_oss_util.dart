import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_oss_aliyun/flutter_oss_aliyun.dart';
import 'package:investigators/common/common_snack_bar.dart';
import 'package:investigators/models/ali_oss_access_data.dart';
import 'package:investigators/network_service/index.dart';
import 'package:investigators/utils/random_util.dart';

class AliyunOssUtil {
  static AliyunOssUtil? _instance;

  AliyunOssUtil._internal();

  static get instance {
    _instance ??= AliyunOssUtil._internal();
    return _instance!;
  }

  AliOssAccessData? accessData;

  Future<String?> uploadImage(String filePath) async {
    if (accessData == null) {
      AliOssAccessData? data = await _fetchAccessData();
      if (data == null) {
        return null;
      }
      accessData = data;
    }

    EasyLoading.show(status: 'uploading...', maskType: EasyLoadingMaskType.black);
    Client client = Client.init(
      ossEndpoint: 'oss-ap-southeast-6.aliyuncs.com',
      bucketName: accessData!.bucket,
      stsUrl: accessData!.ossUrlPrefix,
      dio: Dio(BaseOptions(connectTimeout: const Duration(milliseconds: 9000))),
      authGetter: () => Auth(
        accessKey: accessData!.accessKeyId,
        accessSecret: accessData!.accessKeySecret,
        secureToken: accessData!.securityToken,
        expire: accessData!.expiration,
      ),
    );

    // 从文件中读取
    final fileData = (await File(filePath).readAsBytes());
    String fileName = '${RandomUtil.generateRandomString(64)}.jpg';
    final result = await client.putObject(fileData, fileName);
    if (result.statusCode != 200) {
      EasyLoading.dismiss();
      CommonSnackBar.showSnackBar(result.statusMessage, type: SnackType.error);
      return null;
    }
    EasyLoading.dismiss();
    return '${accessData!.ossUrlPrefix}/$fileName';
  }

  Future<AliOssAccessData?> _fetchAccessData() async {
    return await NetworkService.fetchOSSAccessData();
  }
}
