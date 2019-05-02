import 'package:flutter/material.dart';
import 'package:flutter_study/route/route_generate.dart';

main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    ));

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  build(context) => Scaffold(
          body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('第一页', style: TextStyle(fontSize: 50.0)),
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/second', arguments: '来自第一页的数据');
              },
              child: Text('下一页'),
            )
          ],
        ),
      ));
}

class SecondPage extends StatefulWidget {
  final data;
  SecondPage({@required this.data});
  @override
  createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  build(context) => Scaffold(
          body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('第二页', style: TextStyle(fontSize: 50.0)),
            Text('${widget.data}'),
          ],
        ),
      ));
}
