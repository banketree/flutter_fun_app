import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'Align/index.dart';
import 'Box/index.dart';
import 'Expanded/index.dart';
import 'Layout/index.dart';
import 'Spacing/index.dart';
import 'Stack/index.dart';
import 'Table/index.dart';

class FormFramePage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "AlignPage",
          callback: (it) {
            jumpTo(context,AlignPage());
          }))
      ..add(FunItem(
          name: "BoxPage",
          callback: (it) {
            jumpTo(context,BoxPage());
          }))
      ..add(FunItem(
          name: "ExpandedPage",
          callback: (it) {
            jumpTo(context,ExpandedPage());
          }))
      ..add(FunItem(
          name: "LayoutPage",
          callback: (it) {
            jumpTo(context,LayoutPage());
          }))
      ..add(FunItem(
          name: "SpacePage",
          callback: (it) {
            jumpTo(context,SpacePage());
          }))
      ..add(FunItem(
          name: "StackPage",
          callback: (it) {
            jumpTo(context,StackPage());
          }))
      ..add(FunItem(
          name: "TablePage",
          callback: (it) {
            jumpTo(context,TablePage());
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
