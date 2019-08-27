import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';

Future<bool> isConnected() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult != ConnectivityResult.none;
}

void test() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
// 网络类型为移动网络
  } else if (connectivityResult == ConnectivityResult.wifi) {
// 网络类型为WIFI
  }
}


class ConnectWidget extends StatefulWidget {
  const ConnectWidget();
  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<ConnectWidget> {

  Stream<ConnectivityResult> connectChangeListener() async* {
    final Connectivity connectivity = Connectivity();
    await for (ConnectivityResult result
    in connectivity.onConnectivityChanged) {
      yield result;
    }
  }
  StreamSubscription<ConnectivityResult> connectivitySubscription;
  bool connected = false;

  @override
  void initState() {
    super.initState();
    connectivitySubscription = connectChangeListener().listen( (ConnectivityResult connectivityResult) {
      if (!mounted) {
        return;
      }
      setState(() {
        connected = connectivityResult != ConnectivityResult.none;
      });
    },
    );
  }
  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(connected?"有网络链接":"断网了"),),
    );
  }
}