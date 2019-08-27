import 'package:flutter/material.dart';
import 'bean/fun_item.dart';
import 'fun/layout/index.dart';
import 'fun/state/index.dart';
import 'fun/plugin/index.dart';
import 'dart:io';



Future main() async {
  var dir = new Directory('/tmp');

  try {
    var dirList = dir.list();
    await for (FileSystemEntity f in dirList) {
      if (f is File) {
        print('Found file ${f.path}');
      } else if (f is Directory) {
        print('Found dir ${f.path}');
      }
    }

    runApp(MyApp());
  } catch (e) {
    print(e.toString());
  }
}


//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "优速flutter",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "布局以及控件",
          callback: (it) {
            jumpTo(context,LayoutDemoPage());
          }))
      ..add(FunItem(
          name: "4种状态管理",
          callback: (it) {
            jumpTo(context,StateDemoPage());
          }))
      ..add(FunItem(
          name: "插件管理",
          callback: (it) {
            jumpTo(context,PluginDemoPage());
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
        title: Text("优速flutter"),
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
