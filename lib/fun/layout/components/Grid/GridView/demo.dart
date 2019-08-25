
import 'package:flutter/material.dart';

class GridTileDemo3 extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<GridTileDemo3> {

  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Color(0xffc91b3a),
      child:   GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 4.0,
          padding: const EdgeInsets.all(4.0),
          childAspectRatio: 1.3,
        children: <Widget>[
          GridTile(
            header: GridTileBar(
              title: Text('title'),
              subtitle: Text('subtitle'),
              leading: Icon(Icons.add),
              trailing: Text("trailing"),
            ),
            child: Container(),

          ),
           Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
           Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
           Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
           Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
           Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
           Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
           Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
           Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
           Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
           Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
           Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
           Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
           Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
           Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
           Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
        ],
      )
    );
  }
}


class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Color(0xffc91b3a),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        ///列数
        crossAxisCount: 3,
        ///列间距
        mainAxisSpacing: 10.0,
        ///横轴距离
        crossAxisSpacing: 4.0,
        ///缩放比例
        childAspectRatio: 1.3,),
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
        children: <Widget>[
          Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
          Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
          Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
          Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
          Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
          Image.network('https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png', scale: 1, fit: BoxFit.cover),
        ],),
    );
  }

}