import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'Center/demo.dart';
import 'Column/demo.dart';
import 'Container/demo.dart';
import 'Row/demo.dart';

class LayoutPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "CenterDemo",
          callback: (it) {
            jumpTo(context,CenterDemo());
          }))
      ..add(FunItem(
          name: "ColumnDefault",
          callback: (it) {
            jumpTo(context,ColumnDefault());
          }))
      ..add(FunItem(
          name: "ContainerDefault",
          callback: (it) {
            jumpTo(context,ContainerDefault());
          }))
      ..add(FunItem(
          name: "RowMainAxisAlignment",
          callback: (it) {
            jumpTo(context,RowMainAxisAlignment());
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
