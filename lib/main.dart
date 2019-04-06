import 'package:flutter/material.dart';

main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  @override
  build(context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter案例',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage(title: 'Flutter案例主页'),
      );
}

class HomePage extends StatefulWidget {
  final title;
  HomePage({this.title});
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  _incrementCounter() => setState(() => _counter++);

  @override
  build(context) => Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('您已多次按下此按钮：'),
              Text('$_counter', style: Theme.of(context).textTheme.display1),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: '自增',
          child: Icon(Icons.add),
        ),
      );
}
