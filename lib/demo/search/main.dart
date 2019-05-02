import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  build(context) => Scaffold(
          appBar: AppBar(
        title: SearchWidget(
          performSearch: null,
        ),
      ));
}

class SearchWidget extends StatelessWidget {
  final performSearch;

  const SearchWidget({Key key, @required this.performSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: Icon(
                CupertinoIcons.search,
                color: Colors.black54,
              ),
              onTap: () {},
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Search..."),
                onSubmitted: (String place) {
                  if (place.isNotEmpty) {
                    performSearch(place);
                  }
                },
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: Icon(
                CupertinoIcons.delete_simple,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('第二页'),
    );
  }
}
