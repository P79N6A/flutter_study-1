import 'package:flutter/material.dart';

main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SliversPage()));

class SliversPage extends StatelessWidget {
  SliversPage({this.onLayoutToggle});
  final VoidCallback onLayoutToggle;

  @override
  build(context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 120.0,
              flexibleSpace: FlexibleSpaceBar(title: Text('裂片')),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                      alignment: Alignment.center,
                      color: Colors.teal[100 * (index % 9)],
                      child: Text('grid item $index'),
                    ),
                childCount: 20,
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                      alignment: Alignment.center,
                      color: Colors.lightBlue[100 * (index % 9)],
                      child: Text('list item $index'),
                    ),
              ),
            ),
          ],
        ),
      );
}
