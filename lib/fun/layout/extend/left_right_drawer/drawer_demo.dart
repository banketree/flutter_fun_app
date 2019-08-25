import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DrawerDemo"),
      ),
      body: Container(
          child: Center(
        child: Text('剧中'),
      )),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            Text("test"),
            Text("test2"),
          ],
        ),
      ),
      endDrawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            Text("test3"),
            Text("test4"),
          ],
        ),
      ),
    );
  }
}
