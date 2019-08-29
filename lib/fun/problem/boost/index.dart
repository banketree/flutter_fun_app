import 'package:flutter/material.dart';


//void main (){
//  runApp(App());
//}

//class BoostDemoApp extends StatefulWidget{
//  @override
//  _BoostDemoAppState createState() => _BoostDemoAppState();
//
//}
//
//class _BoostDemoAppState extends State<BoostDemoApp>{
//
//  @override
//  void initState() {
//    super.initState();
//    ///register page widget builders,the key is pageName
//    FlutterBoost.singleton.registerPageBuilders({
//      'first': (pageName, params, _) => FirstRouteWidget(),
//      'second': (pageName, params, _) => SecondRouteWidget(),
//      'flutterFragment': (pageName, params, _) => FragmentRouteWidget(params),
//
//      ///可以在native层通过 getContainerParams 来传递参数
//      'flutterPage': (pageName, params, _) {
//        print("flutterPage params:$params");
//
//        return FlutterRouteWidget();
//      },
//    });
//
//    ///query current top page and load it
//    FlutterBoost.handleOnStartPage();
//  }
//
//  @override
//  Widget build(BuildContext context) =>MaterialApp(
//    title: "Flutter Boost demo",
//    builder: FlutterBoost.init(),
//    home: Container(),
//  );
//
//}