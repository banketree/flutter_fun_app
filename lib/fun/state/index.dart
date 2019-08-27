import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'blocs/index.dart';
import 'scoped/index.dart';

class StateDemoPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "Blocs",
          callback: (it) {
            jumpTo(context,BlocsDemo());
          }))
      ..add(FunItem(
          name: "ScopedDemo",
          callback: (it) {
            jumpTo(context,ScopedDemo());
          }))
//      ..add(FunItem(
//          name: "Themes",
//          callback: (it) {
//            jumpTo(context,ThemesPage());
//          }))
//      ..add(FunItem(
//          name: "extend",
//          callback: (it) {
//            jumpTo(context,ExtendPage());
//          }))
    ;
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
