import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';


class PermissionPage extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return new Scaffold(

      appBar: new AppBar(

        title: new Text('Welcome to Flutter'),

      ),

      body: new Center(

        child: new RaisedButton(

          onPressed: () {

            requestPermission();

          },

          child: Text("hello"),

        ),

      ),

    );

  }

}

Future requestPermission() async {
  // 申请权限

  Map<PermissionGroup, PermissionStatus> permissions =
  await PermissionHandler().requestPermissions([PermissionGroup.storage]);

  // 申请结果

  PermissionStatus permission =

  await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);

  if (permission == PermissionStatus.granted) {
    debugPrint("权限申请通过");
  } else {
    debugPrint("权限申请被拒绝");
  }

}