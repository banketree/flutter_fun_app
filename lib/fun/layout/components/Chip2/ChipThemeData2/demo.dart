import 'package:flutter/material.dart';

class ChipThemeDemo2 extends StatefulWidget {
  _ChipThemeDemoState2 createState() => _ChipThemeDemoState2();
}

class _ChipThemeDemoState2 extends State<ChipThemeDemo2> {
  Color _color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return ChipTheme(
      data: ChipThemeData.fromDefaults(
        // brightness: Brightness.dark,
      labelStyle: TextStyle(fontSize: 15.0), 
      primaryColor: Colors.red,secondaryColor: Colors.red.shade800),
      child: ChoiceChip(
        padding: EdgeInsets.only(left: 100.0,right: 100.0,top: 10.0,bottom: 10.0),
        label: Text('down'),
        onSelected: (bool value) {
          setState(() {
            _color = value ? Colors.black : Colors.red;
          });
        },
        selected: _color == Colors.black,
      ),
    );
  }
}


  
