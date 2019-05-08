import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisclaimerMsg extends StatefulWidget {
  final State pWidget;

  DisclaimerMsg({Key key, this.pWidget}) : super(key: key);

  DisclaimerMsgState createState() => DisclaimerMsgState();
}

class DisclaimerMsgState extends State<DisclaimerMsg> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool> _unKnow;
  var _valBool = false;
  var _readed = false;

  //SharedPreferences 存储结果
  void refs(bool value) async {
    final SharedPreferences prefs = await _prefs;
    final bool unKnow = value;
    if (mounted) {
      setState(() {
        _unKnow =
            prefs.setBool("disclaimer::Boolean", unKnow).then((bool success) {
          return unKnow;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //获取SharedPreferences 存储结果
    _unKnow = _prefs.then((SharedPreferences prefs) {
      return (prefs.getBool('disclaimer::Boolean') ?? false);
    });
    _unKnow.then((bool value) {
      _valBool = value;
      _readed = value;
    });
  }

  void showAlertDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (BuildContext context) {
                    return WebviewScaffold(
                        url: 'https://www.cmtzz.cn/live/23071?ft=slider');
                  }));
                },
                child: Image.network(
                  'https://cdn.cmtzz.cn/sites/default/files/2019-05/%E7%82%B9%E5%87%BB%E5%9B%9E%E7%9C%8B.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    refs(_valBool);
                    return Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Row _create() {
    //已读
    if (_readed) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('已阅读知晓',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            //可点击
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            width: 10.0,
          )
        ],
      );
    }

    //第一次读取
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        //crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                  activeColor: Theme.of(context).primaryColor,
                  tristate: false,
                  value: _valBool,
                  onChanged: (bool bol) {
                    if (mounted) {
                      setState(() {
                        _valBool = bol;
                      });
                    }
                    Navigator.of(context)
                        .pop(); // here I pop to avoid multiple Dialogs
                    showAlertDialog(context); //here i call the same function
                  }),
              Text('不再自动提示', style: TextStyle(fontSize: 14)),
            ],
          ),
          FlatButton(
            child: Text('知道了',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            //可点击
            color: _valBool
                ? Theme.of(context).primaryColor
                : Theme.of(context).primaryColor.withAlpha(800),
            onPressed: () {
              // if (_valBool) {
              refs(_valBool);
              Navigator.of(context).pop();
              // }
            },
          ),
        ]);
  }

  Widget build(BuildContext context) => Container();
}
