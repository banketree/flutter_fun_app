import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'GridPaper/demo.dart';
import 'GridTile/demo.dart';
import 'GridTileBar/demo.dart';
import 'GridView/demo.dart';
import 'SliverGrid/demo.dart';

class GridPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "GridPaper",
          callback: (it) {
            jumpTo(context,GridPaperDemo());
          }))
      ..add(FunItem(
          name: "GridTile",
          callback: (it) {
            jumpTo(context,GridTileDemo1());
          }))
      ..add(FunItem(
          name: "GridTileBar",
          callback: (it) {
            jumpTo(context,GridTileDemo2());
          }))
      ..add(FunItem(
          name: "GridView",
          callback: (it) {
            jumpTo(context,GridTileDemo3());
          }))
      ..add(FunItem(
          name: "SliverGrid",
          callback: (it) {
            jumpTo(context,SliverGridDemo());
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
