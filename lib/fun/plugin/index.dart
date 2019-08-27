import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'cache/index.dart';
import 'crypto/index.dart';
import 'database/index.dart';
import 'file/index.dart';
import 'https/index.dart';
import 'img/index.dart';
import 'list/index.dart';
import 'permission/index.dart';
import 'rxdart/index.dart';
import 'sharedpreference/index.dart';

class PluginDemoPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "Cache",
          callback: (it) {
            jumpTo(context,CacheDemo());
          }))
      ..add(FunItem(
          name: "CryptoDemo",
          callback: (it) {
            jumpTo(context,CryptoDemo());
          }))
      ..add(FunItem(
          name: "SqliteDemo",
          callback: (it) {
            jumpTo(context,SqliteDemo());
          }))
      ..add(FunItem(
          name: "FileDemo",
          callback: (it) {
            jumpTo(context,FileDemo());
          }))
      ..add(FunItem(
          name: "HttpsDemo",
          callback: (it) {
            jumpTo(context,HttpsDemo());
          }))
      ..add(FunItem(
          name: "SelectImage",
          callback: (it) {
            jumpTo(context,SelectImage());
          }))
      ..add(FunItem(
          name: "ListDemo",
          callback: (it) {
            jumpTo(context,ListDemo());
          }))
      ..add(FunItem(
          name: "PermissionPage",
          callback: (it) {
            jumpTo(context,PermissionPage());
          }))
      ..add(FunItem(
          name: "RxDartDemo",
          callback: (it) {
            jumpTo(context,RxDartDemo());
          }))
      ..add(FunItem(
          name: "SharedPreferenceDemo",
          callback: (it) {
            jumpTo(context,SharedPreferenceDemo());
          }));
  }

  jumpTo(BuildContext context,Widget target) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => target));
  }

  @override
  Widget build(BuildContext context) {
    initData(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Plugin Demo"),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _getItemUI(context, funLists[index]);
          },
          itemCount: funLists.length,
        ),
      ),
    );
  }

  Widget _getItemUI(BuildContext context, FunItem item) {
    return Card(
      margin: EdgeInsets.all(0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              item.name,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              item.callback(item);
            },
          )
        ],
      ),
    );
  }
}
