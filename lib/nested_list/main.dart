import 'package:flutter/material.dart';
import 'package:flutter_study/nested_list/example_three.dart';
import './example_two.dart';
import './example_one.dart';
import './home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '嵌套列表',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(title: 'Nested lists'),
        routes: {
          'exampleOne': (context) => ExampleOne(title: '示例一'),
          'exampleTwo': (context) => ExampleTwo(title: '示例二'),
          'exampleThree': (context) => ExampleThree(),
        },
      );
}
