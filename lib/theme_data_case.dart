import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Brightness brightness
ThemeData getLocalThemeData2() {
  return ThemeData(
    //深色或者浅色主题。dark主题时，背景为深色，需要浅色文字；light主题时，背景为浅色，需要深色文字
    //默认为Brightness.light
    primarySwatch: Colors.green,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData getLocalThemeData() {
  return ThemeData(
    backgroundColor: Colors.green,
    //深色或者浅色主题。dark主题时，背景为深色，需要浅色文字；light主题时，背景为浅色，需要深色文字
    //默认为Brightness.light
    primarySwatch: Colors.green,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    //主题颜色样本，类似调色板。为主题色的一个样本色，通过样本色可以定义主题色。
    //有10个等级的渐变色。如果没有指定primaryColor，并且当前主题不是深色主题，那么primaryColor就会默认为primarySwatch指定的颜色
    //默认为Colors.blue
    primaryColor: Colors.green,
    //主题色。primarySwatch 和 primaryColor 同事设置，系统主题会根据 primaryColor 进行设置。决定导航栏颜色。
//如果是 Brightness.dark状态，为 Colors.grey[500]，否则为默认色 primarySwatch[100]。
//    primaryColorBrightness:Brightness()
    //主要是配合暗色背景增加对比度，感觉用处不大，需要配合次要颜色才能使用。用于确定文本颜色，悬浮按钮等。
    primaryColorLight: Colors.green,
    //为空 主题是否是暗色。如果是暗色，颜色为 Colors.grey[500]，否则primarySwatch[100]
    //不为空 为设置颜色
    primaryColorDark: Colors.green,
    //为空 主题是否为暗色。如果是暗色，颜色为黑色，否则为primarySwatch[700]
    accentColor: Colors.green,
    //次要颜色。如果有指定会影响 accentColorBrightness 。
    //如果为空 主题是暗色，颜色为Colors.tealAccent[200] 否则为 primarySwatch[500]
//    accentColorBrightness:Brightness()
    //用于确定文本颜色，悬浮按钮等。类似于primaryColorBrightness
    canvasColor: Colors.green,
    //MaterialType.canvas 类型的默认颜色 为Material.
    //如为空 暗色主题为 Colors.grey[850] 否则为 Colors.grey[50]
    scaffoldBackgroundColor: Colors.green,
    //scaffold 背景色
    //如为空，颜色等同于canvasColor
    bottomAppBarColor: Colors.green,
    //可以覆盖 BottomAppBar.color 颜色
    //如为空，主题为暗色则为 Colors.grey[800] 否则为 Colors.white
    cardColor: Colors.green,
    //Material 使用卡片的颜色 使用需要 Card包裹，用的不多
    //暗色主题为 Colors.grey[800] 否则为 Colors.white
    dividerColor: Colors.green,
    //Divider 颜色，但是貌似这个高度无法设置，感觉用处不大
    //如为空， 暗色主题 Color(0x1FFFFFFF) 否则Color(0x1F000000)
    focusColor: Colors.green,
    //用于输入框 focus颜色
    //如为空 暗色主题 Colors.white.withOpacity(0.12) 亮色主题 Colors.black.withOpacity(0.12)
    hoverColor: Colors.green,
    //指示器悬停颜色，不知道咋用的。可能是web端使用？
    //如为空 暗色主题 Colors.white.withOpacity(0.04) 亮色主题 Colors.black.withOpacity(0.04)
    highlightColor: Colors.green,
    //选中颜色
    //如为空，暗色主题为 Color(0x40CCCCCC) 亮色主题为 Color(0x66BCBCBC)
    //可自定义，设置buttonThme可覆盖，同时按钮可不主动设置
    splashColor: Colors.green,
    //水波纹颜色
    //如为空，暗色主题为 Color(0x40CCCCCC) 亮色主题为 Color(0x66C8C8C8)
    //可自定义，设置buttonThme可覆盖，同时按钮可不主动设置
    //如取消水波纹颜色，最简单的方式 Colors.transparent
    //貌似
//    splashFactory:InteractiveInkFeatureFactory(),
    //自定义水波纹样式
    //暂时不用，没具体研究
    selectedRowColor: Colors.green,
    //选中row颜色，默认 Colors.grey[100]
    unselectedWidgetColor: Colors.green,
    //如为空，暗色主题为 Colors.white70 亮色主题为 Colors.black54
    //通常用在非活动，但可用的状态。例如 checkbox，未选中桩状态
    disabledColor: Colors.green,
    //不工作控件的颜色，不管其状态如何。例如禁用状态的Checkbox，或者FlatButton
    //如为空，暗色主题为 Colors.white30 亮色主题为 Colors.black38
    //貌似需要在FlatButton手动设置disabled才会生效？Checkbox 会生效
    buttonColor: Colors.green,
    //如为空 暗色主题为 primarySwatch[600] 亮色主题为 Colors.grey[300]
    //填充背景色按钮最好手动设置，否则容易被覆盖
    buttonTheme: ButtonThemeData(),
    //按钮统一可以设置主题，覆盖单个设置
    //PS:最好在这里设置，不会影响其他设置
    secondaryHeaderColor: Colors.green,
    //如为空，暗色主题为 Colors.grey[700] 否则 primarySwatch[50]
    //好像是个表格形式的，QING App上貌似用不到，没研究
    textSelectionColor: Colors.green,
    //文字选中颜色，例如 TextField
    //如为空 暗色主题为 accentColor 否则 primarySwatch[200]
    cursorColor: Colors.green,
    //如为空 Color.fromRGBO(66, 133, 244, 1.0)
    //光标颜色
    textSelectionHandleColor: Colors.green,
    //例如用在 progress，用来跟 primaryColor进行对比色
    //如为空 暗色主题 Colors.grey[700] 亮色主题 primarySwatch[200]
    dialogBackgroundColor: Colors.green,
    //如为空 暗色主题：Colors.grey[800] 亮色主题 Colors.white
    //弹框 dialog背景色
    indicatorColor: Colors.green,
    //标签栏中选中颜色 指示器颜色
    //当为空时 如 accentColor == primaryColor 颜色为 白色，否则为 accentColor
    hintColor: Colors.green,
    //用于占位符文字颜色，多用于 TextField
    //如为空 暗色主题 Color(0x80FFFFFF) 否则 const Color(0x8A000000)
    errorColor: Colors.green,
    //错误文字提示颜色
    toggleableActiveColor: Colors.green,
    //用于可切换控件的高亮颜色，例如 Switch,Radio,Checkbox
    //??= isDark ? Colors.tealAccent[200] : (accentColor ?? primarySwatch[600])
    //如为空 暗色主题 Colors.tealAccent[200] 亮色主题如果有 accentColor则为此颜色，如为空则为 primarySwatch[600]
    fontFamily: "",
    //字体
    textTheme: TextTheme(),
    //默认是Android峰哥，如果是暗色主题，则为白色，如果是亮色则为黑色
    //文字的一些颜色 title，subhead，body，button，subtitle，overline等
    primaryTextTheme: TextTheme(),
    //类似 primary color
    accentTextTheme: TextTheme(),
    //类似 accent color
    inputDecorationTheme: InputDecorationTheme(),
    //TextField使用
    iconTheme: IconThemeData(),
    //icon图片配置
    //如为空 暗色主题 IconThemeData(color: Colors.white) 亮色主题 IconThemeData(color: Colors.black87);
    //无需显示设置
    primaryIconTheme: IconThemeData(),
    //参照 primary color 设置 iconTheme就可以了
    accentIconTheme: IconThemeData(),
    //参照 accent color 同样会被覆盖
    sliderTheme: SliderThemeData(),
    //用于 Slider控件，可通过 SliderTheme.of获取
    tabBarTheme: TabBarTheme(),
    ////可自定义size，shape，color等tabbar 指示器
    cardTheme: CardTheme(),
    //Chip 标签控件
    chipTheme: ChipThemeData(),
    platform: TargetPlatform.android,
    //默认为Android峰哥，可设置为iOS风格
//    materialTapTargetSize: MaterialTapTargetSize(),
    //可配置点击大小。不会用
    pageTransitionsTheme: PageTransitionsTheme(),
    bottomAppBarTheme: BottomAppBarTheme(),
    //界面跳转。
    appBarTheme: AppBarTheme(),
    //bottomAppBar 主题
    colorScheme: ColorScheme(),
    //设置很多颜色，cardColor，ButtonColor等，现有组件逐渐迁移到此，会向后兼容
    //可直接设置主题，无需使用此
    dialogTheme: DialogTheme(),
    //弹出控件主题
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    //悬浮按钮主题
    typography: Typography(),
    //配置TextTheme，默认是Android风格
    cupertinoOverrideTheme: CupertinoThemeData(),
    //Snack 主题，类似Toast
    snackBarTheme: SnackBarThemeData(),
    //bottom sheet 主题
    bottomSheetTheme: BottomSheetThemeData(),
  );
}
