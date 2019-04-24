import './AlbumContainerScreen.dart';
import './PhotoContainerScreen.dart';
import './VideoContainerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> viewContainer = [
    PhotoContainerScreen(),
    VideoContainerScreen(),
    AlbumContainerScreen()
  ];

  @override
  Widget build(BuildContext context) {

    void onTabTapped(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.more_vert), onPressed: () {})
        ],
      ),
     body: viewContainer[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
                  onTap: onTabTapped, //
          currentIndex: currentIndex,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
          icon:new Icon(Icons.photo),
          title: Text("Photo"),
        ),
        BottomNavigationBarItem(
          icon:new Icon(Icons.video_library),
          title: Text("Video"),
        ),
        BottomNavigationBarItem(
            icon:new Icon(Icons.photo_library),
          title: Text("Album"),
        )
      ]),
    );
    // TODO: implement build


  }
}



