import 'package:flutter/material.dart';

main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SliversPage()));

class SliversPage extends StatelessWidget {
  SliversPage({this.onLayoutToggle});
  final VoidCallback onLayoutToggle;

  @override
  build(context) => Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100.0,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 2.0,
                  childAspectRatio: 1.0),
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 8 + 1)],
                    child: Text('grid item $index')),
                childCount: 20,
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                        alignment: Alignment.center,
                        color: Colors.lightBlue[100 * (index % 8 + 1)],
                        child: Text('list item $index'),
                      ),
                  childCount: 20),
            ),
          ],
        ),
      );
}

