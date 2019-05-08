import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const disclaimerText1 =
    '\r\r\r\r\r\r本APP属于个人的非赢利性开源项目，以供开源社区使用，凡本APP转载的所有的文章 、图片、音频、视频文件等资料的版权归版权所有人所有，本APP采用的非本站原创文章及图片等内容无法一一和版权者联系，如果本网所选内容的文章作者及编辑认为其作品不宜上网供大家浏览，或不应无偿使用请及时用电子邮件或电话通知我们，以迅速采取适当措施，避免给双方造成不必要的经济损失。';
const disclaimerText2 =
    '\n\r\r\r\r\r\r对于已经授权本APP独家使用并提供给本站资料的版权所有人的文章、图片等资料，如需转载使用，需取得本站和版权所有人的同意。本APP所刊发、转载的文章，其版权均归原作者所有，如其他媒体、网站或个人从本网下载使用，请在转载有关文章时务必尊重该文章的著作权，保留本网注明的“稿件来源”，并自负版权等法律责任。';

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
        return AlertDialog(
          //title: Text('免责声明'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('免责声明',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                SizedBox(height: 20),
                Text(disclaimerText1),
                Text(disclaimerText2),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0)), // 圆角
          actions: <Widget>[
            new Container(
              width: 250,
              child: _create(),
            )
          ],
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
