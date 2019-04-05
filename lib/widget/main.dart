import 'package:flutter/material.dart';

main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PositionApp()));

class PositionApp extends StatefulWidget {
  @override
  createState() => _PositionAppState();
}

class _PositionAppState extends State<PositionApp> {
  @override
  build(context) => Scaffold(
      appBar: AppBar(
        title: Text('Flutter布局案例'),
      ),
      body: Container(
        color: Colors.black12,
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(16.0),
                color: Colors.blueAccent,
                width: double.infinity,
                height: 100.0,
              ),
            ),
            Expanded(
              child: Container(
                child: Container(
                  margin: EdgeInsets.only(
                      bottom: 64.0, top: 16.0, right: 16.0, left: 16.0),
                  color: Colors.cyanAccent,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.all(16.0),
                          color: Colors.greenAccent,
                          width: 100.0,
                          height: 100.0,
                          child: Center(child: FlutterLogo(size: 32.0)),
                        ),
                      ),
                      Positioned(
                        left: 115.0,
                        child: Container(
                          margin: EdgeInsets.all(16.0),
                          color: Colors.greenAccent,
                          width: 100.0,
                          height: 100.0,
                          child: Center(child: Text('Flutter定位微件')),
                        ),
                      ),
                      Positioned(
                        right: 0.0,
                        child: Container(
                          margin: EdgeInsets.all(16.0),
                          color: Colors.greenAccent,
                          width: 100.0,
                          height: 100.0,
                          child: Center(child: Icon(Icons.backspace)),
                        ),
                      ),
                    ],
                  ),
                ),
                margin: EdgeInsets.all(16.0),
                color: Colors.redAccent,
                width: double.infinity,
                height: 100.0,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(16.0),
                color: Colors.greenAccent,
                width: double.infinity,
                height: 100.0,
              ),
            ),
          ],
        ),
      ));
}
