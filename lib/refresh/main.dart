import 'package:flutter/material.dart';
import './demo/animation.dart';
import './demo/load_more.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
   build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.grey[200]),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  void _push(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('加载更多示例')),
      body: ListView(
        padding: EdgeInsets.all(8),
        children:[
          RaisedButton(
              child: Text("加载更多"),
              onPressed: () => _push(context, LoaderMoreDemo(1))),
          RaisedButton(
              child: Text("动画"),
              onPressed: () => _push(context, AnimationPage())),
        ],
      ),
    );
  }
}
