import 'package:flutter/material.dart';
import './generator/bloc_provider.dart';
import './model/search_model.dart';

main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _blocProvider = BlocProvider.instance();
  @override
  initState() {
    super.initState();
    _blocProvider.fetchQueryList();
  }

  @override
  void dispose() {
    _blocProvider.dispose();
    super.dispose();
  }

  @override
  build(context) => Scaffold(
        body: _blocProvider.streamBuilder<SearchModel>(
            success: (data) => _buildList(data),
            error: (msg) => Text(msg),
            empty: () => Text('暂无数据'),
            loading: () => CircularProgressIndicator(),
            finished: () {}),
      );

  _buildList(SearchModel data) => ListView.builder(
        itemCount: data.items.length,
        itemBuilder: (context, index) {
          ItemModel itemModel = data.items[index];
          return InkWell(
            child: Card(
              margin: EdgeInsets.all(16.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(itemModel.name),
                  Text(itemModel.description),
                  Text('${itemModel.size}'),
                  Text('${itemModel.forks}'),
                  Text(itemModel.language),
                ],
              ),
            ),
          );
        },
      );
}
