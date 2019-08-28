package com.uce56.flutter_app_fun;

import android.os.Bundle;

import com.uce56.flutter_app_fun.plugin.EventChannelPlugin;
import com.uce56.flutter_app_fun.plugin.MethodChannelPlugin;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.view.FlutterView;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
  }

  private void init(){
    FlutterView flutterView = new FlutterView(this);
    EventChannelPlugin eventChannelPlugin = EventChannelPlugin.registerWith(flutterView);
    MethodChannelPlugin methodChannelPlugin =MethodChannelPlugin.registerWith(flutterView);

    FlutterPluginJumpToAct.registerWith(registrarFor(FlutterPluginJumpToAct.CHANNEL));
//    FlutterPluginCounter.registerWith(registrarFor(FlutterPluginCounter.CHANNEL));
  }
}