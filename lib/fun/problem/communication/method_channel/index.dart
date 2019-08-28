import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MethodChannelDemo extends StatefulWidget {
  @override
  _MethodChannelDemoState createState() => _MethodChannelDemoState();
}

class _MethodChannelDemoState extends State<MethodChannelDemo> {
  MethodChannel _methodChannel = MethodChannel("MethodChannelPlugin");
  @override
  void initState() {
    _methodChannel.setMethodCallHandler((handler) => Future<String>(() {
//      print("_methodChannel：${handler}");
      //监听native发送的方法名及参数
      switch (handler.method) {
        case "send":
          _send(handler.arguments);//handler.arguments表示native传递的方法参数
          break;
      }

      return "";
    }));
    super.initState();
  }
  //native调用的flutter方法
  void _send(arg) {
    setState(() {
//      _content = arg;
    });
  }
  String _resultContent = "";
  //flutter调用native的相应方法
  void _sendToNative() {
    Future<String> future =
    _methodChannel.invokeMethod("send", "test");
    future.then((message) {
      setState(() {
        //message是native返回的数据
        _resultContent = "返回值：" + message;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Text('$_resultContent');
  }
}