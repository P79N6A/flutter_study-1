import 'package:flutter/material.dart';
import './example_two.dart';
import './example_one.dart';
import './home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Home(title: 'Nested lists'),
      routes: {
        'exampleOne': (context) => ExampleOne(title: 'Example One'),
        'exampleTwo': (context) => ExampleTwo(title: 'Example Two'),
      },
    );
  }
}
