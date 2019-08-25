import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'Bar/index.dart';
import 'Card/index.dart';
import 'Chip2/index.dart';
import 'Dialog/index.dart';
import 'Grid/index.dart';
import 'List/index.dart';
import 'Menu/index.dart';
import 'Navigation/index.dart';
import 'Panel/index.dart';
import 'Pick/index.dart';
import 'Progress/index.dart';
import 'Scaffold/index.dart';
import 'Scroll/index.dart';
import 'Tab/index.dart';

class ComponentsPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "BarPage",
          callback: (it) {
            jumpTo(context,BarPage());
          }))
      ..add(FunItem(
          name: "CardPage",
          callback: (it) {
            jumpTo(context,CardPage());
          }))
      ..add(FunItem(
          name: "ChipPage",
          callback: (it) {
            jumpTo(context,ChipPage());
          }))
      ..add(FunItem(
          name: "DialogPage",
          callback: (it) {
            jumpTo(context,DialogPage());
          }))
      ..add(FunItem(
          name: "GridPage",
          callback: (it) {
            jumpTo(context,GridPage());
          }))
      ..add(FunItem(
          name: "ListPage",
          callback: (it) {
            jumpTo(context,ListPage());
          }))
      ..add(FunItem(
          name: "MenuPage",
          callback: (it) {
            jumpTo(context,MenuPage());
          }))
      ..add(FunItem(
          name: "NavigationPage",
          callback: (it) {
            jumpTo(context,NavigationPage());
          }))
      ..add(FunItem(
          name: "PanelPage",
          callback: (it) {
            jumpTo(context,PanelPage());
          }))
      ..add(FunItem(
          name: "PickPage",
          callback: (it) {
            jumpTo(context,PickPage());
          }))
      ..add(FunItem(
          name: "ProgressPage",
          callback: (it) {
            jumpTo(context,ProgressPage());
          }))
      ..add(FunItem(
          name: "ScaffoldPage",
          callback: (it) {
            jumpTo(context,ScaffoldPage());
          }))
      ..add(FunItem(
          name: "ScrollPage",
          callback: (it) {
            jumpTo(context,ScrollPage());
          }))
      ..add(FunItem(
          name: "TabPage",
          callback: (it) {
            jumpTo(context,TabPage());
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
