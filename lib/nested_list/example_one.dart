import 'package:flutter/material.dart';

class ExampleOne extends StatefulWidget {
  final String title;
  ExampleOne({Key key, this.title}) : super(key: key);

  @override
  _ExampleOneState createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    Text(
                      'Header for list $index',
                      style: Theme.of(context).textTheme.body2,
                    ),
                    ListView.builder(
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Text(
                              'Nested list item $index',
                              style: Theme.of(context).textTheme.body1,
                            ),
                          ),
                      itemCount: 4,
                      shrinkWrap:
                          true, // todo comment this out and check the result
                      physics:
                          BouncingScrollPhysics(), // todo comment this out and check the result
                    ),
                  ],
                ),
              ),
          itemCount: 9,
        ),
      );
}
