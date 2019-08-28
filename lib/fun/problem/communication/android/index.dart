import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class AndroidCommunicationDemo extends StatefulWidget {
  @override
  _AndroidCommunicationDemoState createState() => _AndroidCommunicationDemoState();
}

class _AndroidCommunicationDemoState extends State<AndroidCommunicationDemo> {

  static const counterPlugin = const EventChannel('com.jzhu.counter/plugin');

  StreamSubscription _subscription = null;

  var _count;

  @override
  void initState() {
    super.initState();
    //开启监听
    if(_subscription == null){
      _subscription =  counterPlugin.receiveBroadcastStream().listen(_onEvent,onError: _onError);
    }
  }

  @override
  void dispose() {
    super.dispose();
    //取消监听
    if(_subscription != null){
      _subscription.cancel();
    }
  }

  void _onEvent(Object event) {
    setState(() {
      _count = event;
      print("ChannelPage: $event");
    });
  }

  void _onError(Object error) {
    setState(() {
      _count = "计时器异常";
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
