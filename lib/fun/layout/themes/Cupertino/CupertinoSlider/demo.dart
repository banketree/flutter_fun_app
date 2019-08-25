
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSliderDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<CupertinoSliderDemo> {
  double value = 0.0;
  @override
  Widget build(BuildContext context) {
    return  CupertinoSlider(
      value: value,//实际进度的位置
      min: 0.0,
      max: 100.0,
      divisions: 100,
      activeColor: Colors.blue,//进度中活动部分的颜色
      onChanged: (double){
        setState(() {
          value = double.roundToDouble();
        });
      },
    );
  }

}

