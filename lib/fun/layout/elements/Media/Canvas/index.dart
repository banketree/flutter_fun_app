import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'Canvas/demo.dart';
import 'CircleProgressBarPainter/demo.dart';
import 'PainterPath/demo.dart';
import 'PainterSketch/demo.dart';

class CanvasPage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "CustomViewPage",
          callback: (it) {
            jumpTo(context,CustomViewPage2());
          }))
      ..add(FunItem(
          name: "CircleProgressBarPainter",
          callback: (it) {
            jumpTo(context,CustomViewPage3());
          }))
      ..add(FunItem(
          name: "PainterPath",
          callback: (it) {
            jumpTo(context,CustomViewPage4());
          }))
      ..add(FunItem(
          name: "PainterSketchDome",
          callback: (it) {
            jumpTo(context,PainterSketchDome());
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
