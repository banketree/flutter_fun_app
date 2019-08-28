package com.uce56.flutter_app_fun.plugin;

import android.app.Activity;
import android.util.Log;
import android.widget.Toast;

import io.flutter.plugin.common.EventChannel;
import io.flutter.view.FlutterView;

public class EventChannelPlugin implements EventChannel.StreamHandler {
    private static final String TAG = EventChannelPlugin.class.getSimpleName();
    private EventChannel.EventSink eventSink;
    private Activity activity;
    public static EventChannelPlugin registerWith(FlutterView flutterView) {
        EventChannelPlugin plugin = new EventChannelPlugin(flutterView);
        new EventChannel(flutterView, "EventChannelPlugin").setStreamHandler(plugin);
        return plugin;
    }
    private EventChannelPlugin(FlutterView flutterView) {
        this.activity = (Activity) flutterView.getContext();
    }
    void send(Object params) {
        if (eventSink != null) {
            eventSink.success(params);
        }
    }
    void sendError(String str1, String str2, Object params) {
        if (eventSink != null) {
            eventSink.error(str1, str2, params);
        }
    }
    void cancel() {
        if (eventSink != null) {
            eventSink.endOfStream();
        }
    }
    //第一个参数为flutter初始化EventChannel时返回的值，仅此一次
    @Override
    public void onListen(Object o, EventChannel.EventSink eventSink) {
        this.eventSink = eventSink;
        Log.i(TAG, "eventSink：" + eventSink);
        Log.i(TAG, "Object：" + o.toString());
        Toast.makeText(activity, "onListen——obj：" + o, Toast.LENGTH_SHORT).show();
    }
    @Override
    public void onCancel(Object o) {
        Log.i(TAG, "onCancel：" + o.toString());
        Toast.makeText(activity, "onCancel——obj：" + o, Toast.LENGTH_SHORT).show();
        this.eventSink = null;
    }
}