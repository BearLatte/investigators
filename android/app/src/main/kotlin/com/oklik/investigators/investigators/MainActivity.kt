package com.oklik.investigators.investigators

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity() : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        val aesPlugin = AesChannelPlugin();
        flutterEngine.plugins.add(aesPlugin)
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
