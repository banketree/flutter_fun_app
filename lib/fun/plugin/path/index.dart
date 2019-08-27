import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void test() async{
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;

  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
}


class PathDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
