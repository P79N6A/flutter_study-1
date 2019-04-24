import 'package:flutter/material.dart';

class ExampleThree extends StatefulWidget {
  @override
  createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  @override
  build(context) => Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 136.0,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (content, index) =>
                    _buildItem(index: index + 1, color: Colors.cyanAccent),
              ),
            ),
            SizedBox(
              height: 136.0,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (content, index) =>
                    _buildItem(index: index + 1, color: Colors.cyanAccent),
              ),
            ),
          ],
        ),
      );

  _buildItem({index, color}) => Container(
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
