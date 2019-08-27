import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDemo extends StatelessWidget {
  TextEditingController accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SharedPreferenceDemo"),),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: accountController,
              decoration: InputDecoration(
                helperText: '请输入账号',
              ),
            ),
            RaisedButton(
              child: Text('存储'),
              onPressed: _onClick,
            ),
            RaisedButton(
              child: Text('读取'),
              onPressed: _readShared,
            ),
            RaisedButton(
              child: Text('删除'),
              onPressed: _removeShared,
            )
          ],
        ),
      ),
    );
  }

  /*
   * 存储数据
   */
  Future _onClick() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String account = accountController.text;
    preferences.setString('account', account);
    print('存储acount为:$account');
  }

  /*
   * 读取数据
   */
  Future _readShared() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String account = preferences.get('account');
    print('读取到acount为:$account');
    accountController.text = account;
  }

  /*
   * 删除数据
   */
  Future _removeShared() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('account');
    print('删除acount成功');
  }
}