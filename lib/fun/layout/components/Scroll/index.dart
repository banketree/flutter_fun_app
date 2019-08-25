import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'BoxScrollView/demo.dart';
import 'CustomScrollView/demo.dart';
import 'NestedScrollView/demo.dart';
import 'Scrollable/demo.dart';
import 'ScrollbarPainter/demo.dart';
import 'ScrollMetrics/demo.dart';
import 'ScrollPhysics/demo.dart';
import 'ScrollView/demo.dart';

class ScrollPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "BoxScrollViewDemo",
          callback: (it) {
            jumpTo(context,BoxScrollViewDemo());
          }))
      ..add(FunItem(
          name: "CustomScrollViewDemo",
          callback: (it) {
            jumpTo(context,CustomScrollViewDemo());
          }))
      ..add(FunItem(
          name: "NestedScrollViewDemo",
          callback: (it) {
            jumpTo(context,NestedScrollViewDemo());
          }))
      ..add(FunItem(
          name: "ScrollableDemo",
          callback: (it) {
            jumpTo(context,ScrollableDemo());
          }))
      ..add(FunItem(
          name: "PaintDemo",
          callback: (it) {
            jumpTo(context,PaintDemo());
          }))
      ..add(FunItem(
          name: "ScrollMetricsDemo",
          callback: (it) {
            jumpTo(context,ScrollMetricsDemo());
          }))
      ..add(FunItem(
          name: "ScrollPhysicsDemo",
          callback: (it) {
            jumpTo(context,ScrollPhysicsDemo());
          }))
      ..add(FunItem(
          name: "ScrollViewDemo",
          callback: (it) {
            jumpTo(context,ScrollViewDemo());
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
