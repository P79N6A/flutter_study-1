import 'package:flutter/material.dart';
import './widget/BottomNavigationBarDemo.dart';
import './ui/HomePageUI.dart';
import './ui/SystemTreeUI.dart';
import './ui/WxArticlePageUI.dart';
import './ui/ProjectTreePageUI.dart';
import './ui/NaviPageUI.dart';
import './ui/DrawerWidgetUI.dart';
import 'GlobalConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'event/theme_change_event.dart';
import 'common/application.dart';
import './ui/SearchPageUI.dart';
import 'package:event_bus/event_bus.dart';
import './common/user.dart';

main() async {
  bool themeIndex = await getTheme();
  getLoginInfo();
  runApp(MyApp(themeIndex));
}

Future<bool> getTheme() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  bool themeIndex = sp.getBool("themeIndex");
  if (themeIndex == null) {
    themeIndex = false;
  }
  GlobalConfig.dark = themeIndex;
  return themeIndex;
}

Future<Null> getLoginInfo() async {
  User.singleton.getUserInfo();
}

class MyApp extends StatefulWidget {
  final bool themeIndex;
  MyApp(this.themeIndex);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  ThemeData themeData;

  @override
  initState() {
    super.initState();
    Application.eventBus = EventBus();
    themeData = GlobalConfig.getThemeData(widget.themeIndex);
    this.registerThemeEvent();
  }

  registerThemeEvent() {
    Application.eventBus
        .on<ThemeChangeEvent>()
        .listen((ThemeChangeEvent onData) => this.changeTheme(onData));
  }

  changeTheme(ThemeChangeEvent onData) {
    setState(() {
      themeData = GlobalConfig.getThemeData(onData.dark);
    });
  }

  @override
  build(context) => MaterialApp(
        title: "玩Android",
        debugShowCheckedModeBanner: false,
        home: Home(),
        theme: themeData,
      );

  @override
  dispose() {
    super.dispose();
    Application.eventBus.destroy();
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  int _index = 0;
  var _pageList;
  var _titleList = [
    "首页",
    "知识体系",
    "公众号",
    "导航",
    "项目",
  ];

  bool _showAppbar = true;
  bool _showDrawer = true;

  @override
  initState() {
    super.initState();
    _pageList = [
      HomePageUI(),
      SystemTreeUI(),
      WxArticlePageUI(),
      NaviPageUI(),
      ProjectTreePageUI(),
    ];
  }

  _handleTabChanged(value) {
    setState(() {
      _index = value;
      if (_index == 0 || _index == 1 || _index == 3) {
        _showAppbar = true;
      } else {
        _showAppbar = false;
      }

      if (_index == 0) {
        _showDrawer = true;
      } else {
        _showDrawer = false;
      }
    });
  }

  _appBarWidget(context) => AppBar(
        title: Text(_titleList[_index]),
        elevation: 0.4,
        actions: _actionsWidget());

  List<Widget> _actionsWidget() {
    if (_showDrawer) {
      return [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              onSearchClick();
            })
      ];
    } else {
      return null;
    }
  }

  @override
  build(context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: _showAppbar ? _appBarWidget(context) : null,
            drawer: _showDrawer ? DrawerDemo() : null,
            body: IndexedStack(
              index: _index,
              children: _pageList,
            ),
            bottomNavigationBar: BottomNavigationBarDemo(
              index: _index,
              onChanged: _handleTabChanged,
            ),
          )),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('提示'),
                content: Text('确定退出应用吗？'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('再看一会'),
                  ),
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text('退出'),
                  ),
                ],
              ),
        ) ??
        false;
  }

  onSearchClick() async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SearchPageUI(null);
    }));
  }

  @override
  bool get wantKeepAlive => true;
}
