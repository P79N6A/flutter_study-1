import 'package:flutter/material.dart';
import 'package:flutter_study/rxdart/api/api_provider.dart';
import 'package:flutter_study/rxdart/model/search_model.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _blocProvider = ApiProvider.instance();
  @override
  void initState() {
    super.initState();
    _blocProvider.fetchRankList();
  }

  @override
  void dispose() {
    _blocProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text('Business Logic Component')),
      body: _blocProvider.streamBuilder<SearchModel>(
          success: (data) => buildList(data),
          error: (msg) => Center(child: Text(msg)),
          empty: () => Center(child: Text('暂无数据')),
          loading: () => Center(child: CircularProgressIndicator()),
          finished: () {}));

  void buildList(SearchModel data) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: data.items.length,
        itemBuilder: (context, index) {
          ItemModel item = data.items[index];
          return Card(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('编号：${item.id}'),
                    Text('全名：${item.fullName}'),
                    Text('描述：${item.description}'),
                    Text('星数：${item.stargazersCount}'),
                    Text('分支：${item.forks}'),
                    Text('语言：${item.language}'),
                    Text('大小：${item.size}'),
                    Text('浏览：${item.watchers}'),
                    Text('私有：${item.private}'),
                    Text('散码：${item.hashCode}'),
                    Text('类型：${item.runtimeType}')
                  ]),
            ),
          );
        },
      );
}
