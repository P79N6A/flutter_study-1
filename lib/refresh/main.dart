import 'dart:async';
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

  List<String> issues;

  bool loading = false;

  @override
  build(context) {
    var length = issues?.length ?? 0;
    return Scaffold(body: Container(
      child: ListView.builder(
        itemBuilder: (context, int index) {
          if (index == length) {
            _load();
            return Center(
              child: Container(
                margin: const EdgeInsets.only(top: 8.0),
                width: 32.0,
                height: 32.0,
                child: const CircularProgressIndicator(),
              ),
            );
          } else if (index > length) {
            return null;
          }
          var title = issues[index];
          return Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey.shade300))),
            child: ListTile(key: ValueKey<String>(title), title: Text(title)),
          );
        },
      ),
    ));
  }

  Future<void> _load() async {
    if (loading) {
      return null;
    }
    loading = true;
    try {
      var resp = await http.get('https://www.cmtzz.cn/api/v1/interviews?page=$_pageCode');
      var newsList = json.decode(resp.body)['data']['list'];
      setState(() {
        _pageCode += 1;
        if (newsList is List) {
          if (issues == null) {
            issues = <String>[];
          }
          newsList.forEach((dynamic e) {
            if (e is Map) {
              issues.add(e['title'] as String);
            }
          });
        }
      });
    } finally {
      loading = false;
    }
  }
}
