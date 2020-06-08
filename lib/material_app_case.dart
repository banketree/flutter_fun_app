import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_case/theme_data_case.dart';

void main() {
  runApp(MyApp());
}

void showAlertDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (_) => new AlertDialog(
      title: new Text(title),
      content: new Text(content),
      actions: <Widget>[
        new FlatButton(
          child: new Text("CANCEL"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          child: new Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 设备用于为用户识别应用程序的单行描述
      title: 'Flutter case',
      // 应用程序小部件使用的颜色。
      theme: getLocalThemeData2(),
      // 应用程序默认路由的小部件,用来定义当前应用打开的时候，所显示的界面
      home: MyHomePage(title: 'Flutter Case'),
      // 在操作系统界面中应用程序使用的主色。
      color: Color(0xFF00ffff),
      // 应用程序的顶级路由表
      routes: <String, WidgetBuilder>{
        // 这里可以定义静态路由，不能传递参数
        '/second': (_) => MyHomePage(title: 'Flutter Case3'),
        '/home': (_) => MyHomePage(title: 'Flutter Case2'),
      },
      // 在构建导航器时使用的键。
      //navigatorKey:"",
      // 如果构建了导航器，则显示的第一个路由的名称
      initialRoute: '/home',
      // 应用程序导航到指定路由时使用的路由生成器回调
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/home':
            builder = (_) => MyHomePage(title: 'Flutter username');
            break;
          case '/second':
            builder = (_) => MyHomePage(title: 'Flutter password');
            break;
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
      // 当 onGenerateRoute 无法生成路由(initialRoute除外)时调用
      onUnknownRoute: (RouteSettings setting) {
        String name = setting.name;
        print("未匹配到路由:$name");
        showAlertDialog(context, "提示", "未匹配到路由:$name");
        return MaterialPageRoute(builder: (context) {
          return MyHomePage(title: 'Flutter error');
        });
      },
      // 为该应用程序创建的导航器的观察者列表
      navigatorObservers: [
        MyObserver(),
      ],
      // 用于在导航器上面插入小部件，但在由WidgetsApp小部件创建的其他小部件下面插入小部件，或用于完全替换导航器
      builder: (BuildContext context, Widget child) {
        //一般做字体大小，方向，主题颜色等配置
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            //字体大小
            textScaleFactor: 1.4,
          ),
          child: child,
        );
      },
      // 如果非空，则调用此回调函数来生成应用程序的标题字符串，否则使用标题。
      onGenerateTitle: (context) {
        //用于做本地化
        return 'Flutter demo case 6666';
      },
//      // 此应用程序本地化小部件的初始区域设置基于此值。
//      locale: Locale('yy', 'zh'),
//      // 这个应用程序本地化小部件的委托。
//      localizationsDelegates: [
//        // 准备在这里添加我们自己创建的代理
//        MyLocalizationsDelegates(),
//        GlobalMaterialLocalizations.delegate,
//        GlobalWidgetsLocalizations.delegate,
//      ],
//      // 这个回调负责在应用程序启动时以及用户更改设备的区域设置时选择应用程序的区域设置。
//      localeResolutionCallback: (local, support) {
//        if (support.contains(support)) {
//          print('support');
//          return local;
//        }
//        print('no_support');
//        return const Locale('yy', 'zh');
//      },
//      // 此应用程序已本地化的地区列表
//      supportedLocales: [
//        const Locale('yy'),
//        const Locale('zh'),
//      ],
      debugShowMaterialGrid: false,
      //打开绘制基线网格材质应用程序的网格纸覆盖
      showPerformanceOverlay: false,
      // 打开性能叠加
      checkerboardRasterCacheImages: false,
      // 打开栅格缓存图像的棋盘格
      checkerboardOffscreenLayers: false,
      // 打开渲染到屏幕外位图的图层的棋盘格
      showSemanticsDebugger: false,
      // 打开显示框架报告的可访问性信息的覆盖
      debugShowCheckedModeBanner: false, // 在选中模式下打开一个小的“DEBUG”横幅，表示应用程序处于选中模式
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second2');
//                Navigator.push(context, MaterialPageRoute(builder: (context) {
//                  return MyHomePage(title: '我是FirstPage带来的数据');
//                }));
              },
              child: Text("动态"),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}

//继承NavigatorObserver
class MyObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    // 当调用Navigator.push时回调
    super.didPush(route, previousRoute);
    //可通过route.settings获取路由相关内容
    //route.currentResult获取返回内容
    //....等等
    print(route.settings.name);
  }
}

class MyLocalizationsDelegates
    extends LocalizationsDelegate<MaterialLocalizations> {
  @override
  bool isSupported(Locale locale) {
//是否支持该locale，如果不支持会报异常
    if (locale == const Locale('zh', 'cn')) {
      return true;
    }
    return false;
  }

  @override //是否需要重载
  bool shouldReload(LocalizationsDelegate old) => false;

  @override
  Future<MaterialLocalizations> load(Locale locale) {
    //加载本地化
    return SynchronousFuture(MyLocalizations(locale));
  }
}

//本地化实现，继承DefaultMaterialLocalizations
class MyLocalizations extends DefaultMaterialLocalizations {
  final Locale locale;

  MyLocalizations(
    this.locale,
  );

  @override
  String get okButtonLabel {
    if (locale == const Locale('zh', 'cn')) {
      return '好的';
    } else {
      return super.okButtonLabel;
    }
  }

  @override
  String get backButtonTooltip {
    if (locale == const Locale('zh', 'cn')) {
      return '返回';
    } else {
      return super.okButtonLabel;
    }
  }
}
