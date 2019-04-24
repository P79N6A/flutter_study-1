import 'package:flutter/material.dart';
import './screen/SplashScreen.dart';
import './screen/HomeScreen.dart';
import './screen/PhotoContainerScreen.dart';
import './screen/VideoContainerScreen.dart';
import './screen/AlbumContainerScreen.dart';

main() {
  var splash_page = '/SplashScreen',
      home_page = '/HomeScreen',
      photo_page = '/PhotoContainerScreen',
      video_page = '/VideoContainerScreen',
      album_page = '/AlbumContainerScreen';
  runApp(new MaterialApp(
    title: 'FluterBottemNavigationView',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        accentColor: Colors.black,
        indicatorColor: Colors.black,
        highlightColor: Colors.black,
        bottomAppBarColor: Colors.black,
        primaryColor: Color(0xFFffffff),
        primaryColorDark: Color(0xffffff)),
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      home_page: (BuildContext context) => HomeScreen(),
      splash_page: (BuildContext context) => SplashScreen(),
      photo_page: (BuildContext context) => PhotoContainerScreen(),
      video_page: (BuildContext context) => VideoContainerScreen(),
      album_page: (BuildContext context) => AlbumContainerScreen()
    },
  ));
}
