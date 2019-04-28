import 'package:flutter/material.dart';
import 'package:flutter_study/video_player/full_demo/widget/video_widget.dart';

main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  build(context) => Scaffold(
          body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => VideoItem(
              video:
                  'https://cdn.cmtzz.cn/files/large-files/190215-jibin-2m.mp4',
              image: 'https://cdn.pixabay.com/photo/2017/02/17/23/15/duiker-island-2076042__340.jpg',
            ),
      ));
}
