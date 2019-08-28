import 'package:flutter/material.dart';


class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  Future<int> future;

  @override
  void initState() {
    future = Future.value(42);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        // create some layout here
        return Container();
      },
    );
  }


//  @override
//  Widget build(BuildContext context) {
//    return const DecoratedBox(
//      decoration: BoxDecoration(),
//      child: Text("Hello World"),
//    );
//  }


//  @override
//  Widget build(BuildContext context) {
//    final subtree = MyWidget(
//        child: Text("Hello World")
//    );
//
//    return StreamBuilder<String>(
//      stream: stream,
//      initialData: "Foo",
//      builder: (context, snapshot) {
//        return Column(
//          children: <Widget>[
//            Text(snapshot.data),
//            subtree,
//          ],
//        );
//      },
//    );
//  }
}