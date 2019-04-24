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
  var playList = [];
  @override
  initState() {
    super.initState();
    _fetchData();
  }

  @override
  build(context) => Scaffold(
          body: RefreshIndicator(
        onRefresh: _fetchData,
        child: ListView.builder(
          itemCount: playList.length,
          itemBuilder: (context, index) => Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${playList[index].title}'),
                    Text('${playList[index].playUrl}'),
                  ],
                ),
              ),
        ),
      ));

  @override
  bool get wantKeepAlive => true;

  Future<void> _fetchData() async {
    CommonService().fetchVideoList(
        ((_model) => setState(() => playList = _model.data.playList)));
  }
}
