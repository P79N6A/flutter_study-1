import 'package:flutter/material.dart';

var colors = [
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.red,
  Colors.orange
];

class ExampleThree extends StatefulWidget {
  @override
  createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  @override
  build(context) => Scaffold(
        body: Container(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 8,
              itemBuilder: (content, index) =>
                  _buildHorizontalList(parentIndex: index)),
        ),
      );
  _buildHorizontalList({@required parentIndex}) => SizedBox(
        height: 136.0,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (content, index) => _buildItem(
                index: index + 1,
                color: colors[(parentIndex + index) % colors.length])),
      );

  Widget _buildItem({index, color}) => Container(
        margin: EdgeInsets.all(8.0),
        height: 136.0,
        width: 136.0,
        alignment: AlignmentDirectional.center,
        color: color,
        child: Text(
          '$index',
          style: TextStyle(fontSize: 72.0, color: Colors.white),
        ),
      );
}
