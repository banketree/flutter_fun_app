import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'CheckedPopupMenuItem/demo.dart';
import 'DropdownMenuItem/demo.dart';
import 'PopupMenuButton/demo.dart';
import 'PopupMenuDivider/demo.dart';

class MenuPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "CheckedPopupMenuItemDemo",
          callback: (it) {
            jumpTo(context,CheckedPopupMenuItemDemo());
          }))
      ..add(FunItem(
          name: "DropdownMenuItemDemo",
          callback: (it) {
            jumpTo(context,DropdownMenuItemDemo());
          }))
      ..add(FunItem(
          name: "PopupMenuButtonDemo",
          callback: (it) {
            jumpTo(context,PopupMenuButtonDemo());
          }))
      ..add(FunItem(
          name: "PopupMenuDividerDemo",
          callback: (it) {
            jumpTo(context,PopupMenuDividerDemo());
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
