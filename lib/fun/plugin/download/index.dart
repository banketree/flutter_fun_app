import 'package:flutter/material.dart';
import 'dart:io';
//import 'package:flutter_downloader/flutter_downloader.dart';


class DownloadManager extends StatelessWidget {

//  // 申请权限
//  Future<bool> _checkPermission() async {
//    // 先对所在平台进行判断
//    if (Theme.of(context).platform == TargetPlatform.android) {
//      PermissionStatus permission = await PermissionHandler()
//          .checkPermissionStatus(PermissionGroup.storage);
//      if (permission != PermissionStatus.granted) {
//        Map<PermissionGroup, PermissionStatus> permissions =
//        await PermissionHandler()
//            .requestPermissions([PermissionGroup.storage]);
//        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
//          return true;
//        }
//      } else {
//        return true;
//      }
//    } else {
//      return true;
//    }
//    return false;
//  }
//
//  // 获取存储路径
//  Future<String> _findLocalPath() async {
//    // 因为Apple没有外置存储，所以第一步我们需要先对所在平台进行判断
//    // 如果是android，使用getExternalStorageDirectory
//    // 如果是iOS，使用getApplicationSupportDirectory
//    final directory = Theme.of(context).platform == TargetPlatform.android
//        ? await getExternalStorageDirectory()
//        : await getApplicationSupportDirectory();
//    return directory.path;
//  }

//  void init() async{
//    // 获取存储路径
//    var _localPath = (await _findLocalPath()) + '/Download';
//
//    final savedDir = Directory(_localPath);
//// 判断下载路径是否存在
//    bool hasExisted = await savedDir.exists();
//// 不存在就新建路径
//    if (!hasExisted) {
//    savedDir.create();
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DownloadBar"),),
      body: Container(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // 执行下载操作
        _doDownloadOperation();
      }),
    );
  }

  _doDownloadOperation(){
    _downloadFile("", "");
  }

  // 根据 downloadUrl 和 savePath 下载文件
  _downloadFile(downloadUrl, savePath) async {
//    await FlutterDownloader.enqueue(
//      url: downloadUrl,
//      savedDir: savePath,
//      showNotification: true,
//      // show download progress in status bar (for Android)
//      openFileFromNotification:
//      true, // click on notification to open downloaded file (for Android)
//    );
  }
}
