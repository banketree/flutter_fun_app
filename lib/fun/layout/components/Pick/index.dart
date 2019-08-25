import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'CityPIcker/demo.dart';
import 'DayPicker/demo.dart';
import 'MonthPicker/demo.dart';
import 'ShowdatePicker/demo.dart';
import 'YearPicker/demo.dart';

class PickPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "CityPickerDemo",
          callback: (it) {
            jumpTo(context,CityPickerDemo());
          }))
      ..add(FunItem(
          name: "DayPickerDemo",
          callback: (it) {
            jumpTo(context,DayPickerDemo());
          }))
      ..add(FunItem(
          name: "MothPickerDemo",
          callback: (it) {
            jumpTo(context,MothPickerDemo());
          }))
      ..add(FunItem(
          name: "ShowDatePickerDemo",
          callback: (it) {
            jumpTo(context,ShowDatePickerDemo());
          }))
      ..add(FunItem(
          name: "YearPickerDemo",
          callback: (it) {
            jumpTo(context,YearPickerDemo());
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
