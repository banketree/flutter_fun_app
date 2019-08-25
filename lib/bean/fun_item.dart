import 'package:flutter/material.dart';


typedef void MyCallback(result);

class FunItem {
  final String name;
  //callback
  final MyCallback callback;

  FunItem({this.name,@required this.callback});

}

