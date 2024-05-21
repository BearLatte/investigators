package com.oklik.investigators.investigators

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel

class AesChannelPlugin : FlutterPlugin {

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        // 获取 android 的 application 级别的 context
        var applicationContext = binding.applicationContext;

        // 创建一个 MethodChannel 并指定其名称，它用于 flutter 和 android 插件之间的通信（在 flutter 中通过名称获取此 channel 后就可以通信了）
        // binding.binaryMessenger 的意思是这个 MethodChannel 用于传输二进制数据
        val methodChannel = MethodChannel(binding.binaryMessenger, "com.oklik.investigators.method")

        methodChannel.setMethodCallHandler { call, result ->
            val method = call.method
            if (method == "cryptoAES") {
                val params = call.arguments as Map<String, String>;
                val  key = params["secretKey"]
                val  plainText = params["plainText"]
                val encryptedText = EncryptAES(key, 256).encrypt(plainText?:"") ?: ""
                result.success(mapOf("aesText" to encryptedText))
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    }

}