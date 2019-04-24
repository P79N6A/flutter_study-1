import 'dart:async';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../constants/pages.dart';
import '../widgets/animatedLogo.dart';

class PageSplash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }
}

class _PageState extends State<PageSplash> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  bool showLogoAnimation = false;
  bool showBackgroundImage = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    Animation curve = CurvedAnimation(
        parent: controller, curve: Curves.easeOut);
    animation = Tween(begin: 84.0, end: 0.0).animate(curve)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            showLogoAnimation = true;
          });
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff17181a),
        child: Column(
          children: <Widget>[
            Expanded(child: _buildBackgroundImage()),
            Container(
              height: 84.0,
              child: _buildLogoAndSlogan(context),
            )
          ],
        ),
      ),);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _buildBackgroundImage() {
    if (showBackgroundImage) {
      return FadeInImage(
          width: 360.0,
          placeholder: MemoryImage(kTransparentImage),
          image: AssetImage('asset/image/splash.png'),
          fit: BoxFit.fill,
          fadeInDuration: Duration(milliseconds: 400));
    } else {
      return Container();
    }
  }

  Widget _buildLogoAndSlogan(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: animation.value),
      child: Row(
        children: <Widget>[
          _buildLogo(context),
          _buildSlogan()
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Container(
      width: 45.0,
      height: 45.0,
      margin: EdgeInsets.only(left: 25.5, right: 12.5),
      child: AnimatedLogo(
          showAnimation: showLogoAnimation,
          callback: (status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                showBackgroundImage = true;
              });
              Future.delayed(Duration(milliseconds: 2400), () {
                _openHomePage(context);
              });
            }
          }),
    );
  }

  Widget _buildSlogan() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '知乎日报',
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xffced2d9),
          ),
        ),
        Text(
          '每天三次，每次七分钟',
          style: TextStyle(
            fontSize: 14.0,
            color: Color(0xff85888c),
          ),
        )
      ],
    );
  }

  _openHomePage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Pages.HOME);
  }
}