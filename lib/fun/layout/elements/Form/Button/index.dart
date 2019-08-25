import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'DropdownButton/demo.dart';
import 'FlatButton/demo.dart';
import 'FloatingActionButton/demo.dart';
import 'IconButton/demo.dart';
import 'OutlineButton/demo.dart';
import 'PopupMenuButton/demo.dart';
import 'RaisedButton/demo.dart';
import 'RawMaterialButton/demo.dart';

class ButtonPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "DropdownButtonDefault",
          callback: (it) {
            jumpTo(context,DropdownButtonDefault());
          }))
      ..add(FunItem(
          name: "FlatButtonDefault",
          callback: (it) {
            jumpTo(context,FlatButtonDefault());
          }))
      ..add(FunItem(
          name: "FloatingActionButtonDefault",
          callback: (it) {
            jumpTo(context,FloatingActionButtonDefault());
          }))
      ..add(FunItem(
          name: "IconButtonDefault",
          callback: (it) {
            jumpTo(context,IconButtonDefault());
          }))
      ..add(FunItem(
          name: "OutlineButtonDefault",
          callback: (it) {
            jumpTo(context,OutlineButtonDefault());
          }))
      ..add(FunItem(
          name: "PopupMenuButtonDefault",
          callback: (it) {
            jumpTo(context,PopupMenuButtonDefault());
          }))
      ..add(FunItem(
          name: "RaisedButtonDefault",
          callback: (it) {
            jumpTo(context,RaisedButtonDefault());
          }))
      ..add(FunItem(
          name: "RawMaterialButtonDefault",
          callback: (it) {
            jumpTo(context,RawMaterialButtonDefault());
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
