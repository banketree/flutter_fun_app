import 'package:flutter/material.dart';
import 'package:flutter_app_fun/bean/fun_item.dart';
import 'AssetImage/assetImage_demo.dart';
import 'DecorationImage/decorationImage_demo.dart';
import 'DecorationImagePainter/decoration_image_painter_demo.dart';
import 'ExactAssetImage/exact_asset_image_demo.dart';
import 'FadeInImage/fade_in_image_demo.dart';
import 'FileImage/file_image_demo.dart';
import 'Image/demo.dart';
import 'MemoryImage/memory_image_demo.dart';
import 'NetworkImage/network_image_demo.dart';
import 'paintImage/paint_image_demo.dart';
import 'precacheImage/precache_image_demo.dart';
import 'RawImage/raw_image_demo.dart';

class ImagePage extends StatelessWidget {
  final List<FunItem> funLists = [];

  initData(BuildContext context) {
    funLists
      ..add(FunItem(
          name: "AssetImageDemo",
          callback: (it) {
            jumpTo(context,AssetImageDemo());
          }))
      ..add(FunItem(
          name: "DecorationImageDemo",
          callback: (it) {
            jumpTo(context,DecorationImageDemo());
          }))
      ..add(FunItem(
          name: "DecorationImagePainterDemo",
          callback: (it) {
            jumpTo(context,DecorationImagePainterDemo());
          }))
      ..add(FunItem(
          name: "ExactAssetImageDemo",
          callback: (it) {
            jumpTo(context,ExactAssetImageDemo());
          }))
      ..add(FunItem(
          name: "FadeInImageDemo",
          callback: (it) {
            jumpTo(context,FadeInImageDemo());
          }))
      ..add(FunItem(
          name: "FileImageDemo",
          callback: (it) {
            jumpTo(context,FileImageDemo());
          }))
      ..add(FunItem(
          name: "ImageDemo",
          callback: (it) {
            jumpTo(context,ImageDemo());
          }))
      ..add(FunItem(
          name: "MemoryImageDemo",
          callback: (it) {
            jumpTo(context,MemoryImageDemo());
          }))
      ..add(FunItem(
          name: "NetworkImageDemo",
          callback: (it) {
            jumpTo(context,NetworkImageDemo());
          }))
      ..add(FunItem(
          name: "PaintImageDemo",
          callback: (it) {
            jumpTo(context,PaintImageDemo());
          }))
      ..add(FunItem(
          name: "PrecacheImageDemo",
          callback: (it) {
            jumpTo(context,PrecacheImageDemo());
          }))
      ..add(FunItem(
          name: "RawImageDemo",
          callback: (it) {
            jumpTo(context,RawImageDemo());
          }));
  }

  jumpTo(BuildContext context,Widget target) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => target));
  }

  @override
  Widget build(BuildContext context) {
    initData(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Bar Demo"),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _getItemUI(context, funLists[index]);
          },
          itemCount: funLists.length,
        ),
      ),
    );
  }

  Widget _getItemUI(BuildContext context, FunItem item) {
    return Card(
      margin: EdgeInsets.all(0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              item.name,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              item.callback(item);
            },
          )
        ],
      ),
    );
  }

  _showSnackBar(BuildContext context, FunItem item) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("${item.name} hahaha"),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
