import 'CacheObject.dart';
import 'package:quiver/cache.dart';

class CacheManger {
  static final CacheManger _singleton = CacheManger._internal();

  CacheDataProvider _cacheDataProvider;

  MapCache<String, String> _cacheMap = MapCache();

  bool _avaiable = false;

  factory CacheManger() {
    return _singleton;
  }

  CacheManger._internal() {
    _cacheDataProvider = CacheDataProvider();
    _initMemoryCache();
  }

  Future<String> get(String key) async {
    if (!_avaiable) {
      await _initMemoryCache();
    }
    return _cacheMap.get(key);
  }

  Future set(String key, String value) async {
    _cacheMap.set(key, value); //写到内存
    //写到磁盘
    return _cacheDataProvider.set(CacheObject(key: key, value: value));
  }

  ///哈哈，假装在lru，偷懒实现
  Future lru() async {
    await _cacheDataProvider.lru();
    _initMemoryCache();
  }

  ///整个清理
  Future clear() async {
//    await _cacheDataProvider.clear();
//    _initMemoryCache();
  }

  ///将磁盘缓存load到内存中来
  ///
  Future _initMemoryCache() async {
    List<CacheObject> cacheObjects = await _cacheDataProvider.getAll();
    for (var value in cacheObjects) {
      _cacheMap.set(value.key, value.value);
    }
    _avaiable = true;
  }
}