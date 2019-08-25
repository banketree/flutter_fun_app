import 'package:flutter/material.dart';
import 'base.dart';

class DraggableGridViewDemo extends StatelessWidget {
  final List<String> channelItems = List<String>();

  @override
  Widget build(BuildContext context) {
    for (int x = 0; x < 20; x++) {
      channelItems.add("x = $x");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("drag Demo"),
      ),
      body: SortableGridView(
        channelItems,
        childAspectRatio: 3.0, //宽高3比1
        crossAxisCount: 3, //3列
        scrollDirection: Axis.vertical, //竖向滑动
        canAccept: (oldIndex, newIndex) {
          return true;
        },
        itemBuilder: (context, data) {
          return Card(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Center(
              child: Text(data),
            ),
          ));
        },
      ),
    );
  }
}
