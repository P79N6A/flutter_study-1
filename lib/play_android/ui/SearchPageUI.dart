import 'package:flutter/material.dart';
import 'SearchHotPageUI.dart';
import 'SearchResultPageUI.dart';

class SearchPageUI extends StatefulWidget {
  String searchStr;

  SearchPageUI(this.searchStr);

  @override
  State<StatefulWidget> createState() {
    return SearchPageState(searchStr);
  }
}

class SearchPageState extends State<SearchPageUI> {
  TextEditingController _searchController = TextEditingController();
  FocusNode focusNode1 = FocusNode();

  SearchResultPageUI _searchListPage;
  String searchStr;
  SearchPageState(this.searchStr);

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController(text: searchStr);
    changeContent();
  }

  void changeContent() {
    focusNode1.unfocus();
    setState(() {
      _searchListPage =
          SearchResultPageUI(new ValueKey(_searchController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    TextField searchField = TextField(
      autofocus: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: '搜索关键词',
      ),
      focusNode: focusNode1,
      controller: _searchController,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        title: searchField,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                changeContent();
              }),
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _searchController.clear();
                });
              }),
        ],
      ),
      body: (_searchController.text == null || _searchController.text.isEmpty)
          ? Center(
              child: SearchHotPageUI(),
            )
          : _searchListPage,
//    body: Center(
//      child: SearchHotPageUI(),
//    ),
    );
  }
}
