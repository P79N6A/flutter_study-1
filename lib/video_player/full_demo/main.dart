import 'package:flutter_study/video_player/full_demo/widget/video_widget.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'VideoPlayer';
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: appTitle,
        theme: ThemeData(
            primaryColor: Colors.red,
            textTheme: TextTheme(headline: TextStyle(fontSize: 42.0))),
        home: MainPage(
          appTitle: appTitle,
        ),
      );
}

class MainPage extends StatelessWidget {
  final String appTitle;

  const MainPage({this.appTitle});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: VideoItem(video: 'https://cdn.cmtzz.cn/files/large-files/190215-jibin-2m.mp4',),
      );
}
