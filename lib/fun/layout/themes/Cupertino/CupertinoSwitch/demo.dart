
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSwitchDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<CupertinoSwitchDemo> {
  bool _lights = false;
  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: ListTile(
        title: Text('CupertinoSwitch'),
        trailing: CupertinoSwitch(
          activeColor: Colors.yellow,
          value: _lights,
          onChanged: (bool value) { setState(() { _lights = value; }); },
        ),
        onTap: () { setState(() { _lights = !_lights; }); },
      ),
    );
  }

}

