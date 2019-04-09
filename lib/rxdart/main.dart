import 'package:flutter/material.dart';
import 'package:flutter_study/rxdart/model/search_model.dart';
import './generator/bloc_provider.dart';

main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _blocProvider = BlocProvider.instance();
  @override
  initState() {
    super.initState();
    _blocProvider.fetchQueryList();
  }

  @override
  dispose() {
    _blocProvider.dispose();
    super.dispose();
  }

  @override
  build(context) => Scaffold(
      appBar: AppBar(title: Text('Business Logic Compounent')),
      body: _blocProvider.streamBuilder<SearchModel>(
          success: (data) => buildList(data),
          error: (msg) => Center(child: Text(msg)),
          empty: () => Center(child: Text("暂无数据")),
          loading: () => Center(child: CircularProgressIndicator()),
          finished: () {}));

  buildList(data) => ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: data.items.length,
        itemBuilder: (context, index) {
          var item = data.items[index];
          return Card(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('编号：${item.id}'),
                    Text('全名：${item.fullName}'),
                    Text('描述：${item.description}'),
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
