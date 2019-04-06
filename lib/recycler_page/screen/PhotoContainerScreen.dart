import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoContainerScreen extends StatelessWidget {
  PhotoContainerScreen();

  @override
  Widget build(BuildContext context) {
    List<Container> widgetList = [
      Container(
        child: Card(
          elevation: 1.0,
          margin: EdgeInsets.all(5.0),
          child: Image.asset(
            "assets/image/scene1.png",
          ),
        ),
      ),
      Container(
        child: Card(
          elevation: 1.0,
          margin: EdgeInsets.all(5.0),
          child: Image.asset(
            "assets/image/scene2.png",
          ),
        ),
      ),
      Container(
        child: Card(
          elevation: 1.0,
          margin: EdgeInsets.all(5.0),
          child: Image.asset(
            "assets/image/scene3.png",
          ),
        ),
      ),
      Container(
        child: Card(
          elevation: 1.0,
          margin: EdgeInsets.all(5.0),
          child: Image.asset(
            "assets/image/scene4.png",
          ),
        ),
      ),
      Container(
        child: Card(
          elevation: 1.0,
          margin: EdgeInsets.all(5.0),
          child: Image.asset(
            "assets/image/scene5.png",
          ),
        ),
      ),
      Container(
        child: Card(
          elevation: 1.0,
          margin: EdgeInsets.all(5.0),
          child: Image.asset(
            "assets/image/scene6.png",
          ),
        ),
      ),
      Container(
        child: Card(
          elevation: 1.0,
          margin: EdgeInsets.all(5.0),
          child: Image.asset(
            "assets/image/scene1.png",
          ),
        ),
      ),
      Container(
        child: Card(
          elevation: 1.0,
          margin: EdgeInsets.all(5.0),
          child: Image.asset(
            "assets/image/scene2.png",
          ),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xFFeaeaea),
      body: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 0.0,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: List<Container>.generate(
              8, (int index) => Container(child: widgetList[index]))),
    );
  }
}
