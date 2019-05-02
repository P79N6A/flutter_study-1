import 'package:flutter/material.dart';
import 'main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/second':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => SecondPage(data: args));
        }
        return errorRoutes();
      default:
        return errorRoutes();
    }
  }

  static Route<dynamic> errorRoutes() => MaterialPageRoute(
      builder: (_) => Scaffold(body: Center(child: Text('跳转错误'))));
}
