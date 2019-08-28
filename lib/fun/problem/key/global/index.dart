import 'package:flutter/material.dart';



class GlobalDemo extends StatefulWidget {
  @override
  _GlobalDemoState createState() => _GlobalDemoState();
}

class _GlobalDemoState extends State<GlobalDemo> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switch.adaptive(
            value: isActive,
            onChanged: (bool currentStatus) {
              isActive = currentStatus;
              setState(() {});
            }),
      ),
    );
  }

  changeState() {
    isActive = !isActive;
    setState(() {});
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final GlobalKey<_GlobalDemoState> key = GlobalKey<_GlobalDemoState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalDemo(
//        key: key,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        key.currentState.changeState();
      }),
    );
  }
}