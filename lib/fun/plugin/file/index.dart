import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

localPath() async {
  try {
    var tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    var appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    print('临时目录: ' + tempPath);
    print('文档目录: ' + appDocPath);
  }
  catch(err) {
    print(err);
  }
}

// 临时目录: /data/user/0/com.example.myapp/cache
// 文档目录: /data/user/0/com.example.myapp/app_flutter

localFile(path) async {
  return new File('$path/counter.json');
}

// 读取 json 数据
readJSON() async {
  try {
    final file = await localFile(await localPath());
    String str = await file.readAsString();
    return json.decode(str);
  }
  catch (err) {
    print(err);
  }
}

// 写入 json 数据
writeJSON(obj) async{
//  try {
//    final file = await localFile(await localPath());
//  return file.writeAsString(encode(obj));
//  }
//  catch (err) {
//  print(err);
//  }
}

class FileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FileDemo"),),
      body: Container(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        localPath();
      }),
    );
  }
}


