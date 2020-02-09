package com.pagina_de_marcas

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.BuildConfig
import io.flutter.plugin.common.MethodChannel



class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    MethodChannel(this.flutterView, "getAppName").setMethodCallHandler { methodCall, result -> result.success(application.resources.getString(R.string.app_name)) }
  }
}
