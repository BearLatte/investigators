import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_device_udid/flutter_device_udid.dart';
import 'package:flutter_nb_net/flutter_net.dart';
import 'package:investigators/utils/hex_color.dart';
import 'package:flutter/services.dart' show MethodChannel, rootBundle;
import 'package:investigators/utils/random_util.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'dart:ui';

class Global {
  static Global? _instance;

  Global._internal();

  static get instance {
    _instance ??= Global._internal();
    return _instance!;
  }

  // 主题颜色
  Color themeColor = HexColor('#008CE2');

  // 安卓设备信息
  late AndroidDeviceInfo androidDeviceInfo;

  // iOS 设备信息
  late IosDeviceInfo iosDeviceInfo;

  // 设备唯一标识
  late String deviceUUID;

  // 包信息
  late PackageInfo packageInfo;

  // 与原生通信的通道对象
  final MethodChannel methodChannel = const MethodChannel('com.oklik.investigators.method');

  void initGlobalInfo() async {

    packageInfo = await PackageInfo.fromPlatform();
    DeviceInfoPlugin allDeviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      deviceUUID = await FlutterDeviceUdid.udid;
    } else if (Platform.isIOS) {
      iosDeviceInfo = await allDeviceInfo.iosInfo;
      deviceUUID = iosDeviceInfo.identifierForVendor?.replaceAll('-', 'replace') ?? RandomUtil.generateRandomString(32);
    }
  }

  // 初始化网络库
  void initNetwork({required String baseUrl}) async {
    String signStr = await _generateRsaKey();
    NetOptions.instance
        .setBaseUrl(baseUrl)
        .addHeaders({'Inv-lang': 'en-us', 'Inv-sign': signStr})
        .setConnectTimeout(const Duration(milliseconds: 3000))
        .setReceiveTimeout(const Duration(milliseconds: 3000))
        .setSendTimeout(const Duration(milliseconds: 3000))
        .enableLogger(true)
        .create();
  }

  Future<String> _generateRsaKey() async {
    final publicKeyStr = await rootBundle.loadString('asset/data/public_key.pem');
    final publicKey = RSAKeyParser().parse(publicKeyStr) as RSAPublicKey;
    final encrypter = Encrypter(RSA(publicKey: publicKey, digest: RSADigest.SHA256));
    var encrypted = encrypter.encrypt(deviceUUID).base64;
    return base64Encode(utf8.encode(encrypted));
  }
}
