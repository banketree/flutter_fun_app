
import 'package:flutter/material.dart';

class MaterialButtonDemo extends StatelessWidget {
  final TextStyle txtStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              print('click MaterialButton');
            },
            child: Text(
              'MaterialButton',
              style: txtStyle,
            ),
            color: Theme.of(context).primaryColor,
          ),
          FlatButton.icon(
            icon: Icon(
              Icons.bubble_chart,
              color: Colors.white,
            ),
            label: Text(
              'FlatButton',
              style: txtStyle,
            ),
            onPressed: () {
              print('click FlatButton');
            },
            color: Theme.of(context).primaryColor,
          ),
          RaisedButton(
            onPressed: () {
              print('click RaisedButton');
            },
            child: Text('RaisedButton'),
          )
        ],
      ),
    );
  }
}
