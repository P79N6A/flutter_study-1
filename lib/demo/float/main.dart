import 'package:flutter/material.dart';

main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  build(context) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text('价值\n问道'),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: Colors.amberAccent,
            height: 60,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
}
