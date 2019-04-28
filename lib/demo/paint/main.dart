import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Painter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Painter Demo'),
      ),
      body: BarChart(),
    );
  }
}

class BarChart extends StatefulWidget {
  @override
  createState() => BarChartState();
}

class BarChartState extends State<BarChart> {
  var barHeights = <int>[];

  @override
  initState() {
    super.initState();
    _fetchBarHeights();
  }

  /// Load bar chart data from a json asset file
  _fetchBarHeights() async {
    final heights = await rootBundle
        .loadStructuredData<List<int>>('assets/data/barchart.json', (jsonStr) async {
      final jsonList = json.decode(jsonStr);
      return (jsonList as List).map((i) => (i as int)).toList();
    });
    setState(() => barHeights = heights);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomPaint(
      painter: BarChartPainter(barHeights),
    ));
  }
}

/// Paints a simple bar chart from an array of integers
class BarChartPainter extends CustomPainter {
  BarChartPainter(this.barHeights);
  final List<int> barHeights;

  @override
  paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    var pos = 0.0;
    barHeights.forEach((barHeight) {
      canvas.drawRect(
        Rect.fromLTWH(pos, 10.0, 10.0, -barHeight.toDouble()),
        paint, 
      );
      pos += 12;
    });
  }

  @override
  bool shouldRepaint(BarChartPainter old) =>
      !(ListEquality().equals(old.barHeights, barHeights));
}