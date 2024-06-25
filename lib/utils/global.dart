import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/io.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_device_udid/flutter_device_udid.dart';
import 'package:flutter_nb_net/flutter_net.dart';
import 'package:investigators/utils/dio_interceptor.dart';
import 'package:investigators/utils/hex_color.dart';
import 'package:flutter/services.dart' show MethodChannel, rootBundle;
import 'package:investigators/utils/random_util.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

class Global {
  static Global? _instance;

  Global._internal();

  static get instance {
    _instance ??= Global._internal();
    return _instance!;
  }

  static const String ACCESS_TOKEN_KEY = 'kAccessToken';
  static const String LOG_IN_BADGE_KEY = 'kIsLogin';
  static const String CURRENT_PHONE_NUMBER = 'kCurrentPhoneNumber';

  // 主题颜色
  Color themeColor = HexColor('#008CE2');

  // 主要文字颜色
  Color textPrimaryColor = HexColor('#74839C');

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

  // SharedPreferences 对象，用于存取全局需要的常量
  late SharedPreferences prefs;

  // token
  String get accessToken {
    return prefs.getString(ACCESS_TOKEN_KEY) ?? '';
  }

  bool get isLogin {
    return prefs.getBool(LOG_IN_BADGE_KEY) ?? false;
  }

  void initGlobalInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
    prefs = await SharedPreferences.getInstance();
    DeviceInfoPlugin allDeviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      deviceUUID = await FlutterDeviceUdid.udid;
    } else if (Platform.isIOS) {
      iosDeviceInfo = await allDeviceInfo.iosInfo;
      deviceUUID = iosDeviceInfo.identifierForVendor?.replaceAll('-', 'replace') ?? RandomUtil.generateRandomString(32);
    }
  }

  // 清除登录信息
  void clearLoginInfo() {
    prefs.remove(ACCESS_TOKEN_KEY);
    prefs.remove(LOG_IN_BADGE_KEY);
  }

  // 初始化网络库
  void initNetwork({required String baseUrl}) {
    NetOptions.instance
        .setBaseUrl(baseUrl)
        // .setHttpClientAdapter(IOHttpClientAdapter()
        //   ..onHttpClientCreate = (client) {
        //     client.findProxy = (uri) {
        //       return 'PROXY 192.168.0.26:8888';
        //     };
        //     client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        //     return client;
        //   })
        .addInterceptor(DioInterceptor())
        .setConnectTimeout(const Duration(milliseconds: 3000))
        .setReceiveTimeout(const Duration(milliseconds: 3000))
        .setSendTimeout(const Duration(milliseconds: 3000))
        .enableLogger(true)
        .create();
  }

  Future<String> generateRsaKey() async {
    final publicKeyStr = await rootBundle.loadString('asset/data/public_key.pem');
    final publicKey = RSAKeyParser().parse(publicKeyStr) as RSAPublicKey;
    final encrypter = Encrypter(RSA(publicKey: publicKey, digest: RSADigest.SHA256));
    var encrypted = encrypter.encrypt(deviceUUID).base64;
    return base64Encode(utf8.encode(encrypted));
  }
}
