import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class BasicMessageChannelDemo extends StatefulWidget {
  @override
  _BasicMessageChannelDemoState createState() => _BasicMessageChannelDemoState();
}

class _BasicMessageChannelDemoState extends State<BasicMessageChannelDemo> {
  //StringCodec()为编码格式
  BasicMessageChannel<String> _basicMessageChannel =
  BasicMessageChannel("BasicMessageChannelPlugin", StringCodec());
  TextEditingController _controller;
  @override
  void initState() {
    _basicMessageChannel.setMessageHandler((message) => Future<String>(() {
      print(message);
      //message为native传递的数据
      setState(() {
//        _content = message;
      });
      //给Android端的返回值
      return "收到Native消息：" + message;
    }));
    _controller = TextEditingController();
    super.initState();
  }
  //向native发送消息
  String _resultContent = "";
//  String _content = "";
  void _sendToNative() {
    Future<String> future = _basicMessageChannel.send(_controller.text);
    future.then((message) {
      _resultContent = "返回值：" + message;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}