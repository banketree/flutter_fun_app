import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'Chip/demo.dart';
import 'ChipTheme/demo.dart';
import 'ChipThemeData2/demo.dart';
import 'ChoiceChip/demo.dart';
import 'FilterChip/demo.dart';
import 'InputChip/demo.dart';
import 'RawChip/demo.dart';

class ChipPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "Chip",
          callback: (it) {
            jumpTo(context,ChipDemo());
          }))
      ..add(FunItem(
          name: "ChipTheme",
          callback: (it) {
            jumpTo(context,ChipThemeDemo());
          }))
      ..add(FunItem(
          name: "ChipThemeData",
          callback: (it) {
            jumpTo(context,ChipThemeDemo2());
          }))
      ..add(FunItem(
          name: "ChoiceChip",
          callback: (it) {
            jumpTo(context,ChoiceChipDemo());
          }))
      ..add(FunItem(
          name: "FilterChip",
          callback: (it) {
            jumpTo(context,FilterChipDemo2());
          }))
      ..add(FunItem(
        name: "InputChip",
        callback: (it) {
          jumpTo(context,FilterChipDemo3());
        }))
      ..add(FunItem(
          name: "RawChip",
          callback: (it) {
            jumpTo(context,FilterChipDemo4());
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
