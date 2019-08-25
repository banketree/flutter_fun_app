import 'package:flutter/material.dart';
import 'loading_dialog.dart';
import 'dart:io';
import 'dart:async';

class LoadingDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoadingDemo> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  Function _callBackFunction;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextStyle _style =
      new TextStyle(letterSpacing: 2.0, fontSize: 17, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
      key: _scaffoldKey,
      body: new Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(
              size: 100,
            ),
            TextField(
              controller: userNameController,
              style: _style,
              decoration: InputDecoration(labelText: "userName"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
            ),
            TextField(
              controller: passwordController,
              style: _style,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "password",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _login(),
                  padding: const EdgeInsets.all(10),
                  child: new Text(
                    "登录",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
                RaisedButton(
                  onPressed: () => _register(),
                  color: Colors.red,
                  padding: const EdgeInsets.all(10),
                  child: new Text(
                    "注册",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  _login() {
    if (userNameController.value.text.length < 6) {
      showSnackBar("用户名不能小于6位!");
    } else if (passwordController.text.length == 0) {
      showSnackBar("密码不能为空!");
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return new NetLoadingDialog(
              dismissDialog: _disMissCallBack,
              outsideDismiss: false,
            );
          });

      Timer timer = new Timer(new Duration(seconds: 3), () {
        // 只在倒计时结束时回调
        Future.delayed(const Duration(milliseconds: 0),
            () => Navigator.of(context).pop(true));
      });
    }
  }

  //这个func 就是关闭Dialog的方法
  _disMissCallBack(Function func) {
    _callBackFunction = (value) {
//      UserEntity entity;
//      if (value is UserEntity)
//        entity = value;
//      if (entity != null && entity.username != null) {
//        showSnackBar("登录成功");
////        Utils.save(Strings.login_name_key, entity.username);
////        Utils.save(Strings.login_state_key, true);
//        new Future.delayed(const Duration(milliseconds: 1500), () =>
//            Navigator.of(context).pop(true));
//      } else {
//        showSnackBar("用户名或密码错误");
//      }
//      func();
    };
//    _loginViewModel.doLogin(
//        userNameController.text,
//        passwordController.text,
//        _callBackFunction);
  }

  _register() async {
//    String userName = await Navigator.of(context).push(
//        new MaterialPageRoute(builder: (context) => Register()));
//    setState(() {
//      userNameController.text = userName;
//      passwordController.text = "";
//    });
    sleep(Duration(seconds: 2));
  }

  showSnackBar(String msg) {
//    Utils.showSnackBar(msg, _scaffoldKey);
  }
}
