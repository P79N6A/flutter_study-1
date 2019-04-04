import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  @override
  build(context) =>
      MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
}

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageCode = 1;
  var titles = [];
  bool loading = false;
  
  @override
  build(context) {
    var length = titles?.length ?? 0;
    return Scaffold(body: Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == length) {
            _load();
            return Center(child: RefreshProgressIndicator());
          } else if (index > length) {
            return null;
          }
          return Text(titles[index]);
        },
      ),
    ));
  }

  _load() async {
    if (loading) {
      return null;
    }
    loading = true;
    try {
      var resp = await http
          .get('https://www.cmtzz.cn/api/v1/interviews?page=$_pageCode');
      var newsList = json.decode(resp.body)['data']['list'];
      setState(() {
        print(_pageCode);
        _pageCode++;
        newsList.forEach((dynamic e) => titles.add(e['title']));
        loading = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
