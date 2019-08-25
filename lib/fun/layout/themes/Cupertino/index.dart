import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'CupertinoApp/demo.dart';
import 'CupertinoButton/demo.dart';
import 'CupertinoColors/demo.dart';
import 'CupertinoIcons/demo.dart';
import 'CupertinoNavigationBar/demo.dart';
import 'CupertinoPageRoute/demo.dart';
import 'CupertinoPageScaffold/demo.dart';
import 'CupertinoPicker/demo.dart';
import 'CupertinoPopupSurface/demo.dart';
import 'CupertinoScrollbar/demo.dart';
import 'CupertinoSegmentedControl/demo.dart';
import 'CupertinoSlider/demo.dart';
import 'CupertinoSliverNavigationBar/demo.dart';
import 'CupertinoSwitch/demo.dart';
import 'CupertinoTabBar/demo.dart';
import 'CupertinoTabScaffold/demo.dart';
import 'CupertinoTabView/demo.dart';
import 'CupertinoTimerPicker/demo.dart';

class CupertinoPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "CupertinoAppFullDefault",
          callback: (it) {
            jumpTo(context,CupertinoAppFullDefault());
          }))
      ..add(FunItem(
          name: "CupertinoButtonFullDefault",
          callback: (it) {
            jumpTo(context,CupertinoButtonFullDefault());
          }))
      ..add(FunItem(
          name: "CupertinoColorsFullDefault",
          callback: (it) {
            jumpTo(context,CupertinoColorsFullDefault());
          }))
      ..add(FunItem(
          name: "CupertinoIconsFullDefault",
          callback: (it) {
            jumpTo(context,CupertinoIconsFullDefault());
          }))
      ..add(FunItem(
          name: "CupertinoNavigationBarFullDefault",
          callback: (it) {
            jumpTo(context,CupertinoNavigationBarFullDefault());
          }))
      ..add(FunItem(
          name: "CupertinoPageRouteFullDefault",
          callback: (it) {
            jumpTo(context,CupertinoPageRouteFullDefault());
          }))
      ..add(FunItem(
          name: "CupertinoPageScaffoldFullDefault",
          callback: (it) {
            jumpTo(context,CupertinoPageScaffoldFullDefault());
          }))
      ..add(FunItem(
          name: "CupertinoPickerDemo",
          callback: (it) {
            jumpTo(context,CupertinoPickerDemo());
          }))
      ..add(FunItem(
          name: "CupertinoPopupSurfaceFullDefault",
          callback: (it) {
            jumpTo(context,CupertinoPopupSurfaceFullDefault());
          }))
      ..add(FunItem(
          name: "CupertinoScrollbarDemo",
          callback: (it) {
            jumpTo(context,CupertinoScrollbarDemo());
          }))
      ..add(FunItem(
          name: "CupertinoSegmentedControlDemo",
          callback: (it) {
            jumpTo(context,CupertinoSegmentedControlDemo());
          }))
      ..add(FunItem(
          name: "CupertinoSliderDemo",
          callback: (it) {
            jumpTo(context,CupertinoSliderDemo());
          }))
      ..add(FunItem(
          name: "CupertinoSliverNavigationBarDemo",
          callback: (it) {
            jumpTo(context,CupertinoSliverNavigationBarDemo());
          }))
      ..add(FunItem(
          name: "CupertinoSwitchDemo",
          callback: (it) {
            jumpTo(context,CupertinoSwitchDemo());
          }))
      ..add(FunItem(
          name: "CupertinoTabBarDemo",
          callback: (it) {
            jumpTo(context,CupertinoTabBarDemo());
          }))
      ..add(FunItem(
          name: "CupertinoTabScaffoldDemo",
          callback: (it) {
            jumpTo(context,CupertinoTabScaffoldDemo());
          }))
      ..add(FunItem(
          name: "CupertinoTabScaffoldDemo",
          callback: (it) {
            jumpTo(context,CupertinoTabScaffoldDemo2());
          }))
      ..add(FunItem(
          name: "CupertinoTimerPickerDemo",
          callback: (it) {
            jumpTo(context,CupertinoTimerPickerDemo());
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
