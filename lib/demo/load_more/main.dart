import 'package:flutter/material.dart';
import '../load_more/bean/model.dart';
import 'indicator/loading_indicator.dart';

main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: LoaderMoreDemo()));

// 上拉加载更多
class LoaderMoreDemo extends StatefulWidget {
  @override
  createState() => _LoaderMoreDemoState();
}

class _LoaderMoreDemoState extends State<LoaderMoreDemo>
    with AutomaticKeepAliveClientMixin {
  _DataLoader _loader;
  @override
  get wantKeepAlive => true;

  @override
  void initState() {
    _loader = _DataLoader();
    _loader.obtainData(false);
    super.initState();
  }

  @override
  void dispose() {
    _loader.dispose();
    super.dispose();
  }

  build(context) => Scaffold(
        body: StreamBuilder<DataLoadMoreBase<Article, Model>>(
            stream: _loader.stream,
            builder: (context, snapshot) => // 监听滑动结束广播
                NotificationListener<ScrollEndNotification>(
                    onNotification: (notification) {
                      if (notification.depth != 0) return false;
                      if (notification.metrics.axisDirection !=
                          AxisDirection.down) return false;
                      if (notification.metrics.pixels <
                          notification.metrics.maxScrollExtent) return false;
                      // 如果没有更多, 服务返回错误信息, 网络异常,那么不允许上拉加载更多
                      if (snapshot.data == null ||
                          !snapshot.data.hasMore() ||
                          snapshot.data.hasError ||
                          snapshot.data.hasException) return false;
                      _loader.obtainData(false); // 加载更多
                      return false;
                    },
                    child: RefreshIndicator(
                      child: _buildList(snapshot.data), // 下拉刷新
                      onRefresh: () => _loader.obtainData(true),
                    ))),
      );

  _buildList(_DataLoader dataLoader) {
    // 初始化时显示的View
    if (dataLoader == null) return Center(child: Text('欢迎光临...'));
    // 没有数据时候显示的View构建
    if (!dataLoader.hasData)
      return LoadingEmptyIndicator(dataLoader: dataLoader);
    // 渲染数据 ,这里数据+1 1表示最后一项,用于显示加载状态
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: 100.0,
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.all(8.0),
                  height: 32.0,
                  width: 72.0,
                  child: Center(
                      child: Text('$index',
                          style:
                              TextStyle(color: Colors.white, fontSize: 32.0))),
                  decoration: BoxDecoration(
                      color: Colors.teal[100 * (index % 9 + 1)],
                      shape: BoxShape.circle),
                ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: dataLoader.length + 1,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == dataLoader.length) {
              return LoadingIndicator(dataLoader: dataLoader);
            } else {
              return Container(
                  margin: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(dataLoader[index].title),
                    ],
                  ));
            }
          },
        ),
      ],
    );
  }
}

// 数据业务逻辑处理
class _DataLoader extends DataLoadMoreBase<Article, Model> {
  var _hasMore = true;
  @override
  getRequest(isRefresh, currentPage, pageSize) async {
    // 这里模拟网络请求
    List<Article> list = List<Article>();
    list.forEach((item) => Article(title: 'title$item'));
    return Model(data: list, code: 0, msg: 'safsfda');
  }

  handlerData(model, isRefresh) {
    if (model == null || model.isError()) return false;
    if (isRefresh) clear();
    addAll((model.data as List<Article>).map((e) => e));
    _hasMore = length < 100;
    return true;
  }

  @override
  hasMore() => _hasMore;
}
