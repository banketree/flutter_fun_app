import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'AboutDialog/demo.dart';
import 'AlertDialog/demo.dart';
import 'Dialog/demo.dart';
import 'SimpleDialog/demo.dart';

class DialogPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "AboutDialog",
          callback: (it) {
            jumpTo(context,AboutDialogDemo());
          }))
      ..add(FunItem(
          name: "AlertDialog",
          callback: (it) {
            jumpTo(context,AlertDialogDemo());
          }))
      ..add(FunItem(
          name: "DialogDemo",
          callback: (it) {
            jumpTo(context,DialogDemo());
          }))
      ..add(FunItem(
          name: "SimpleDialogDemo",
          callback: (it) {
            jumpTo(context,SimpleDialogDemo());
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
