import 'package:flutter/material.dart';
import 'package:disk_lru_cache/disk_lru_cache.dart';
import 'dart:async';
import 'dart:io';

import 'dart:math' as Math;

class CacheDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CacheDemo"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        test1();
        test2();
        test3();
      }),
    );
  }
}

void test1() {
  final LruMap<String, int> map = new LruMap();

//  expect(map.values.toList().length, 0);
//
//  map['a'] = 1;
//  map['b'] = 2;
//  map['c'] = 3;
//
//  /// use the key 'a'
//  var f = map['a'];
//
//  /// We use the key 'a', so at this moment it is the last element.
//  alues = map.values;
//  expect(values.toList()[0], 2);
//  expect(values.toList()[1], 3);
//  expect(values.toList()[2], 1);
}

void test2() async {
  int maxSize = 10 * 1024 * 1024; // 10M

// Make sure it's writable
  Directory cacheDirectory =
      new Directory("${Directory.systemTemp.path}/cache");

  DiskLruCache cache = new DiskLruCache(
      maxSize: maxSize, directory: cacheDirectory, filesCount: 1);

  // write stream
  CacheEditor editor = await cache.edit('filekey');
  if (editor != null) {
    IOSink sink = await editor.newSink(0);
    sink.write('your value');
    await sink.close();
    await editor.commit();
  }

  // read stream
  CacheSnapshot snapshot = await cache.get('filekey');
  String str = await snapshot.getString(0);
  print(str);
}

void test3() async {
  int maxSize = 10 * 1024 * 1024; // 10M

// Make sure it's writable
  Directory cacheDirectory =
  new Directory("${Directory.systemTemp.path}/cache");

  DiskLruCache cache = new DiskLruCache(
      maxSize: maxSize, directory: cacheDirectory, filesCount: 1);

  // write bytes
  CacheEditor editor = await cache.edit('imagekey');
  if (editor != null) {
    HttpClient client = new HttpClient();
    HttpClientRequest request = await client.openUrl(
        "GET",
        Uri.parse(
            "https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1534075481&di=1a90bd266d62bc5edfe1ce84ac38330e&src=http://photocdn.sohu.com/20130517/Img376200804.jpg"));
    HttpClientResponse response = await request.close();
    Stream<List<int>> stream = await editor.copyStream(0, response);
    // The bytes has been written to disk at this point.
//    await new ByteStream(stream).toBytes();
//    await editor.commit();
//
//    // read stream
//    CacheSnapshot snapshot = await cache.get('imagekey');
//    Uint8List bytes = await snapshot.getBytes(0);
//    print(bytes);
  }
}
