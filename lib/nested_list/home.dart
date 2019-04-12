import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String title;

  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() =>  _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: RaisedButton(
              child: Text('示例一'),
              onPressed: () {
                Navigator.of(context).pushNamed('exampleOne');
              },
            ),
          ),
          SizedBox(height: 16.0,),
          Align(
            alignment: Alignment.center,
            child: RaisedButton(
              child: Text('示例二'),
              onPressed: () {
                Navigator.of(context).pushNamed('exampleTwo');
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: RaisedButton(
              child: Text('纵向嵌套横向'),
              onPressed: () => Navigator.of(context).pushNamed('exampleThree'),
            ),
          ),
        ],
      ),
    );
  }
}
