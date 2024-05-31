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

  Future<String?> uploadImage(String filePath) async {
    AliOssAccessData? data = await _fetchAccessData();
    if (data == null) {
      return null;
    }

    Client client = Client.init(
      ossEndpoint: 'oss-ap-southeast-6.aliyuncs.com',
      bucketName: data.bucket,
      stsUrl: data.ossUrlPrefix,
      dio: Dio(BaseOptions(connectTimeout: const Duration(milliseconds: 9000))),
      authGetter: () => Auth(
        accessKey: data.accessKeyId,
        accessSecret: data.accessKeySecret,
        secureToken: data.securityToken,
        expire: data.expiration,
      ),
    );

    EasyLoading.show(status: 'uploading...', maskType: EasyLoadingMaskType.black);
    // 从文件中读取
    final fileData = (await File(filePath).readAsBytes());
    String fileName = 'sign_${DateTime.now().millisecondsSinceEpoch ~/ 1000}_${RandomUtil.generateRandomNumber(5)}.png';
    final result = await client!.putObject(fileData, fileName);
    if (result.statusCode != 200) {
      EasyLoading.dismiss();
      CommonSnackBar.showSnackBar(result.statusMessage, type: SnackType.error);
      return null;
    }
    EasyLoading.dismiss();
    return '${data.ossUrlPrefix}/$fileName';
  }

  Future<AliOssAccessData?> _fetchAccessData() async {
    return await NetworkService.fetchOSSAccessData();
  }
}
