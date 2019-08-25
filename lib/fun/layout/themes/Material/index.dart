import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'MaterialApp/demo.dart';
import 'MaterialButton/demo.dart';
import 'MaterialColor/demo.dart';
import 'MaterialPageRoute/demo.dart';
import 'MergeableMaterialItem/demo.dart';

class MaterialPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "MaterialButtonDemo",
          callback: (it) {
            jumpTo(context,MaterialButtonDemo());
          }))
      ..add(FunItem(
          name: "ColorDemo",
          callback: (it) {
            jumpTo(context,ColorDemo());
          }))
      ..add(FunItem(
          name: "MaterialPageRoute",
          callback: (it) {
            jumpTo(context,FirstPage());
          }))
      ..add(FunItem(
          name: "MergeableMaterialItemDemo",
          callback: (it) {
            jumpTo(context,MergeableMaterialItemDemo());
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
