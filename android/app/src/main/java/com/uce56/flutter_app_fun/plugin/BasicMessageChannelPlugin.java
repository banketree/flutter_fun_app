package com.uce56.flutter_app_fun.plugin;

import android.app.Activity;

import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.StringCodec;
import io.flutter.view.FlutterView;

//这里支持的数据类型为String。
public class BasicMessageChannelPlugin implements BasicMessageChannel.MessageHandler<String> {
    private Activity activity;
    private BasicMessageChannel<String> messageChannel;
    static BasicMessageChannelPlugin registerWith(FlutterView flutterView) {
        return new BasicMessageChannelPlugin(flutterView);
    }
    private BasicMessageChannelPlugin(FlutterView flutterView) {
        this.activity = (Activity) flutterView.getContext();
        this.messageChannel = new BasicMessageChannel<String>(flutterView, "BasicMessageChannelPlugin", StringCodec.INSTANCE);
        messageChannel.setMessageHandler(this);
    }
    @Override
    public void onMessage(String s, BasicMessageChannel.Reply<String> reply) {
        reply.reply("BasicMessageChannelPlugin收到：" + s);
//        if (activity instanceof FlutterAppActivity) {
//            ((FlutterAppActivity) activity).showContent(s);
//        }
    }
    void send(String str, BasicMessageChannel.Reply<String> reply) {
        messageChannel.send(str, reply);
    }
}