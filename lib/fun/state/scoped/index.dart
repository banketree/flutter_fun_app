import 'package:flutter/material.dart';
import 'count_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedDemo extends StatefulWidget {
  @override
  _ScopedDemoState createState() => _ScopedDemoState();
}

class _ScopedDemoState extends State<ScopedDemo> {
//创建顶层状态
  CountModel countModel = CountModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CountModel>(
      model: countModel,
      child: new MaterialApp(
        home: TopScreen(),
      ),
    );
  }
}

class TopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CountModel>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text(
              model.count.toString(),
              style: TextStyle(fontSize: 48.0),
            ),
          ),
          floatingActionButton: new FloatingActionButton(
            onPressed: () => jumpTo(context,SubScreen()),
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class SubScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CountModel>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text(
              model.count.toString(),
              style: TextStyle(fontSize: 48.0),
            ),
          ),
          floatingActionButton: new FloatingActionButton(
            onPressed: () => model.increment(),
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          ),
        );
      },
    );
  }
}

jumpTo(BuildContext context,Widget target) {
  Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => target));
}
