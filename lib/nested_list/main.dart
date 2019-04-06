import 'package:flutter/material.dart';
import './example_two.dart';
import './example_one.dart';
import './home.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      theme:  ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Home(title: 'Nested lists'),
      routes: {
        'exampleOne': (context) => ExampleOne(title: 'Example One'),
        'exampleTwo': (context) => ExampleTwo(title: 'Example Two'),
      },
    );
  }
}
