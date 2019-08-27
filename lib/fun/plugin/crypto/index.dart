import 'package:flutter/material.dart';
import 'box_create.dart';

class CryptoDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Container(
              child: RaisedButton(
                child: Text("A cut Box"),
                onPressed: (){
                  Navigator.push(context,new MaterialPageRoute(builder: (context) =>  MyBoxPage()));
                },

              ),width: double.infinity,
              height: 40,
              margin: EdgeInsets.only(top: 40,left: 20,right: 20),
            ),
          ],),
        )

    );
  }
}