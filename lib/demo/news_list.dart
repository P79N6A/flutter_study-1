import 'package:flutter/material.dart';

main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  
  @override
  build(context) => Scaffold(
        body: Container(),
      );

  @override
  bool get wantKeepAlive => true;
}
