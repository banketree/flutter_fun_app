import 'package:flutter/material.dart';
import 'dart:ui';

//首先来看Android代码。
////第三个参数可以换成我们想要字符串。
//FlutterView flutterView = Flutter.createView(this, getLifecycle(), "route");
//
//
//在flutter中，我们只需要通过下面代码来获取值即可。
void main() => runApp(MyApp(
initParams: window.defaultRouteName,
));


class MyApp extends StatelessWidget {
  final String initParams;//既是前面传递的值——route

  MyApp({Key key, @required this.initParams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}