import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _haveStart3Times = '';

  @override
  initState() {
    super.initState();
    _incrementStartUpNum();
  }

  @override
  build(context) => Scaffold(
        body: Center(
            child: Text(_haveStart3Times, style: TextStyle(fontSize: 32.0))),
      );

  /// 将共享偏好中获取启动次数如果为空,将返回0
  Future<int> _getIntFromSharedPref() async {
    final pref = await SharedPreferences.getInstance();
    final startUpNum = pref.getInt('startUpNum');
    if (startUpNum == null) return 0;
    return startUpNum;
  }

  // 将共享偏好中的计数器重置为0
  Future<void> _resetSharedPref() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setInt('startUpNum', 0);
  }

  // 判断是否要增加启动数并将其存储,然后使用setState()在界面中显示
  Future<void> _incrementStartUpNum() async {
    final pref = await SharedPreferences.getInstance();
    int lastStartUpNum = await _getIntFromSharedPref();
    int currentStartUpNum = ++lastStartUpNum;
    await pref.setInt('startUpNum', currentStartUpNum);
    if (currentStartUpNum == 3) {
      setState(() => _haveStart3Times = '$currentStartUpNum 次启动已完成');
      // 只在你想要重置时执行
      await _resetSharedPref();
    } else {
      setState(() {
        return _haveStart3Times = '$currentStartUpNum 次启动应用程序';
      });
    }
  }
}
