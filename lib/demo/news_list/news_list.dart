import 'package:flutter/material.dart';
import 'package:flutter_study/demo/news_list/api/common_service.dart';

main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  var _newsList = [];
  var _scrollController = ScrollController();
  var _pageCount = 0;
  var _isLoading = false;

  @override
  initState() {
    super.initState();
    _fetchData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchMoreData();
      }
    });
  }

  @override
  build(context) => Scaffold(
          body: RefreshIndicator(
        onRefresh: _fetchData,
        child: ListView.builder(
          itemCount: _newsList.length,
          controller: _scrollController,
          itemBuilder: (context, index) => Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${_newsList[index].title}'),
                    Text('${_newsList[index].link}'),
                    Text('${_newsList[index].cover}'),
                    Text('${_newsList[index].author}'),
                    Text('${_newsList[index].channel}')
                  ],
                ),
              ),
        ),
      ));

  @override
  bool get wantKeepAlive => true;

  Future<void> _fetchData() async {
    if (_isLoading) return null;
    _isLoading = true;
    _pageCount = 0;
    CommonService().fetchArticleList(
        ((_model) => setState(() => _newsList = _model.data.list)), _pageCount);
  }

  _fetchMoreData() async {
    _isLoading = false;
    _pageCount++;
    CommonService().fetchArticleList(
        ((_model) => setState(() => _newsList.addAll(_model.data.list))),
        _pageCount);
  }
}
