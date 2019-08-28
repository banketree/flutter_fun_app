import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';


class EventChannelDemo extends StatefulWidget {
  @override
  _EventChannelDemoState createState() => _EventChannelDemoState();
}

class _EventChannelDemoState extends State<EventChannelDemo> {
  EventChannel _eventChannelPlugin = EventChannel("EventChannelPlugin");
  StreamSubscription _streamSubscription;
  @override
  void initState() {
    _streamSubscription = _eventChannelPlugin
    //["abc", 123, "你好"]对应着Android端onListen方法的第一个参数，可不传值
        .receiveBroadcastStream(["abc", 123, "你好"])
        .listen(_onToDart, onError: _onToDartError, onDone: _onDone);
    super.initState();
  }
  @override
  void dispose() {
    if (_streamSubscription != null) {
      _streamSubscription.cancel();
      _streamSubscription = null;
    }
    super.dispose();
  }
  //native端发送正常数据
  void _onToDart(message) {
    print(message);
  }
  //当native出错时，发送的数据
  void _onToDartError(error) {
    print(error);
  }
  //当native发送数据完成时调用的方法，每一次发送完成就会调用
  void _onDone() {
    print("消息传递完毕");
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}