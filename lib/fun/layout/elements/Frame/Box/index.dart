import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'ConstrainedBox/demo.dart';
import 'DecoratedBox/demo.dart';
import 'FittedBox/demo.dart';
import 'LimitedBox/demo.dart';
import 'OverflowBox/demo.dart';
import 'RotatedBox/demo.dart';
import 'SizeBox/demo.dart';
import 'SizedOverflowBox/demo.dart';
import 'UnconstrainedBox/demo.dart';

class BoxPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "ConstrainedBoxCreate",
          callback: (it) {
            jumpTo(context,ConstrainedBoxCreate());
          }))
      ..add(FunItem(
          name: "DecoratedBoxCreate",
          callback: (it) {
            jumpTo(context,DecoratedBoxCreate());
          }))
      ..add(FunItem(
          name: "FittedBoxDefault",
          callback: (it) {
            jumpTo(context,FittedBoxDefault());
          }))
      ..add(FunItem(
          name: "LimitedBoxDemo",
          callback: (it) {
            jumpTo(context,LimitedBoxDemo());
          }))
      ..add(FunItem(
          name: "OverflowBoxDefault",
          callback: (it) {
            jumpTo(context,OverflowBoxDefault());
          }))
      ..add(FunItem(
          name: "RotatedDemo",
          callback: (it) {
            jumpTo(context,RotatedDemo());
          }))
      ..add(FunItem(
          name: "SizeBoxDefault",
          callback: (it) {
            jumpTo(context,SizeBoxDefault2());
          }))
      ..add(FunItem(
          name: "SizeOverflowBoxDefault",
          callback: (it) {
            jumpTo(context,SizeOverflowBoxDefault());
          }))
      ..add(FunItem(
          name: "UnconstrainedBoxDemo",
          callback: (it) {
            jumpTo(context,UnconstrainedBoxDemo());
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
