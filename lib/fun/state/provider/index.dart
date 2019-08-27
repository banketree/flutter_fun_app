import 'package:flutter/material.dart';
import 'counter.dart';
import 'package:provide/provide.dart';

//void main() {
//  var counter = Counter();
//  var providers = Providers();
//
//  providers..provide(Provider<Counter>.value(counter));
//
//  runApp(ProviderNode(
//    child: OnePage(),
//    providers: providers,
//  ));
//}

class ProviderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counter = Counter();
    var providers = Providers();

    providers..provide(Provider<Counter>.value(counter));

    return ProviderNode(
      child: OnePage(),
      providers: providers,
    );
  }
}

class OnePage extends StatefulWidget {
  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("provide"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Provide<Counter>(
            builder: (context, child, counter) {
              return Text(
                '${counter.value}',
                style: TextStyle(fontSize: 30.0),
              );
            },
          ),
          SizedBox(
            height: 100,
          ),
          FlatButton(
              onPressed: () {
                Provide.value<Counter>(context).increment();
              },
              child: Text("下一页"))
        ],
      )),
    );
  }
}
