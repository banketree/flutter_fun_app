import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'AppBar/demo.dart';
import 'BottomAppBar/demo.dart';
import 'ButtonBar/demo.dart';
import 'FlexibleSpaceBar/demo.dart';
import 'SliverAppBar/demo.dart';
import 'SnackBar/demo.dart';
import 'SnackBarAction/demo.dart';
import 'TabBar/demo.dart';

class BarPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "AppBar",
          callback: (it) {
            jumpTo(context,AppBarLessDefaultComplex());
          }))
      ..add(FunItem(
          name: "BottomAppBar",
          callback: (it) {
            jumpTo(context,AppBarLessDefaultSimple1());
          }))
      ..add(FunItem(
          name: "FlexibleSpaceBar",
          callback: (it) {
            jumpTo(context,FlexibleSpaceBarLessDefault());
          }))
      ..add(FunItem(
        name: "ButtonBar",
        callback: (it) {
          jumpTo(context,ButtonBarFullDefault());
        }))
      ..add(FunItem(
          name: "SliverAppBar",
          callback: (it) {
            jumpTo(context,SliverAppBarLessDefault());
          }))
      ..add(FunItem(
          name: "SnackBar",
          callback: (it) {
            jumpTo(context,SnackBarLessDefault());
          }))
      ..add(FunItem(
          name: "SnackBarAction",
          callback: (it) {
            jumpTo(context,SnackBarActionDemo());
          }))
      ..add(FunItem(
          name: "TabBar",
          callback: (it) {
            jumpTo(context,TabBarDemo());
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

  _showSnackBar(BuildContext context, FunItem item) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("${item.name} hahaha"),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
