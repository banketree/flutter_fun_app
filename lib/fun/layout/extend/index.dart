import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'load_dialog/index.dart';
import 'left_right_drawer/drawer_demo.dart';
import 'fresh/index.dart';
import 'drag/index.dart';
import 'float_window/index.dart';

class ExtendPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "LoadingDemo",
          callback: (it) {
            jumpTo(context, LoadingDemo());
          }))
      ..add(FunItem(
          name: "DrawerDemo",
          callback: (it) {
            jumpTo(context, DrawerDemo());
          }))
      ..add(FunItem(
          name: "RefreshDemo",
          callback: (it) {
            jumpTo(context, RefreshDemoPage());
          }))
      ..add(FunItem(
          name: "DraggableGridViewDemo",
          callback: (it) {
            jumpTo(context, DraggableGridViewDemo());
          }))
      ..add(FunItem(
          name: "FloatWindowDemo",
          callback: (it) {
            jumpTo(context, FloatWindowDemo());
          }));
  }

  jumpTo(BuildContext context, Widget target) {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => target));
  }

  @override
  Widget build(BuildContext context) {
    initData(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Bar Demo"),
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
