import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_study/carousel/story_model.dart';
import 'package:http/http.dart';

typedef void OnTapCarouselBannerItem(StoryModel story);
main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<StoryModel> carouselSet = [];
  @override
  initState() {
    super.initState();
    _loadData();
  }

  @override
  build(context) =>
      Scaffold(body: CarouselBanner(storyModels: carouselSet, onTap: null));

  Future<Null> _loadData() async {
    var url = 'https://news-at.zhihu.com/api/4/news/latest';
    try {
      var response = await get(url);
      print(response);
      if (response.statusCode == 200) {
        Map<String, dynamic> result = json.decode(response.body);
        if (result['top_stories'] != null) {
          carouselSet.clear();
          result['top_stories'].forEach(
            (item) => carouselSet.add(StoryModel.formJson(item)),
          );
        }
      }
    } catch (e) {}
  }
}

class CarouselBanner extends StatefulWidget {
  final List<StoryModel> storyModels;
  final OnTapCarouselBannerItem onTap;
  CarouselBanner({this.storyModels, this.onTap});
  @override
  createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  var _$0 = 0;
  var _$1 = 1;
  PageController _pageController;
  Timer _timer;
  @override
  initState() {
    super.initState();
    _pageController = PageController(initialPage: _$1);
    _timer = Timer.periodic(Duration(seconds: 5), (_timer) {
      _pageController.animateToPage(_$1 + 1,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    });
  }

  @override
  dispose() {
    super.dispose();
    _pageController.dispose();
    _timer.cancel();
  }

  @override
  build(context) => Container(
        height: 250.0,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: _buidItems,
            ),
            _buildIndicator(),
          ],
        ),
      );
  _onPageChanged(index) {
    _$1 = index;
    var count = widget.storyModels.length;
    if (index == 0) {
      _$0 = count - 1;
      _pageController.jumpToPage(count);
    } else if (index == count + 1) {
      _$0 = 0;
      _pageController.jumpToPage(1);
    } else {
      _$0 = index - 1;
    }
    setState(() {});
  }

  get _buidItems {
    List<Widget> items = [];
    if (widget.storyModels.length > 0) {
      items.add(_buildItem(widget.storyModels[widget.storyModels.length - 1]));
    }
  }

  _buildItem(StoryModel pics) => GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap(pics);
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(pics.image, fit: BoxFit.cover),
            _buildItemTitle(pics.title),
          ],
        ),
      );

  _buildItemTitle(title) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: const Alignment(0.0, -0.8),
              colors: [const Color(0xa0000000), Colors.transparent]),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 22.0, horizontal: 16.0),
          child: Text(title,
              style: TextStyle(color: Colors.white, fontSize: 22.0)),
        ),
      );

  _buildIndicator() {
    var indicators = [];
    for (var i = 0; i < widget.storyModels.length; i++) {
      indicators.add(Container(
        width: 6.0,
        height: 6.0,
        margin: EdgeInsets.symmetric(horizontal: 1.5, vertical: 10.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == _$0 ? Colors.white : Colors.grey),
      ));
      return Row(
          mainAxisAlignment: MainAxisAlignment.center, children: indicators);
    }
  }
}
