import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'Button/index.dart';
import 'CheckBox/index.dart';
import 'Input/index.dart';
import 'Radio/index.dart';
import 'Slider/index.dart';
import 'Switch/index.dart';
import 'Text/index.dart';

class FormFunPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "Button",
          callback: (it) {
            jumpTo(context,ButtonPage());
          }))
      ..add(FunItem(
          name: "CheckBoxPage",
          callback: (it) {
            jumpTo(context,CheckBoxPage());
          }))
      ..add(FunItem(
          name: "InputPage",
          callback: (it) {
            jumpTo(context,InputPage());
          }))
      ..add(FunItem(
          name: "RadioPage",
          callback: (it) {
            jumpTo(context,RadioPage());
          }))
      ..add(FunItem(
          name: "SliderPage",
          callback: (it) {
            jumpTo(context,SliderPage());
          }))
      ..add(FunItem(
          name: "SwitchPage",
          callback: (it) {
            jumpTo(context,SwitchPage());
          }))
      ..add(FunItem(
          name: "TextPage",
          callback: (it) {
            jumpTo(context,TextPage());
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
