import 'package:flutter/material.dart';
import 'package:flutter_study/demo/load_more/base/loading_empty_indicator.dart';
import 'package:flutter_study/demo/load_more/base/loading_indicator.dart';
import 'package:flutter_study/demo/load_more/base/loading_more_base.dart';
import 'package:flutter_study/demo/load_more/bean/model.dart';
import 'package:flutter_study/demo/load_more/util/api.dart';

main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: LoaderMoreDemo()));

/// 上拉加载更多
class LoaderMoreDemo extends StatefulWidget {
  @override
  createState() => _LoaderMoreDemoState();
}

class _LoaderMoreDemoState extends State<LoaderMoreDemo>
    with AutomaticKeepAliveClientMixin {
  /// 数据加载类
  _DataLoader _loader;
  @override
  bool get wantKeepAlive => true;

  @override
  initState() {
    _loader = _DataLoader();
    _loader.obtainData(false);
    super.initState();
  }

  @override
  dispose() {
    _loader.dispose();
    super.dispose();
  }

  build(context) => Scaffold(
        backgroundColor: Colors.grey[200],
        body: StreamBuilder<DataLoadMoreBase<Article, Model>>(
            stream: _loader.stream,
            builder: (context, snapshot) {
              /// 监听滑动结束广播
              return NotificationListener<ScrollEndNotification>(
                  onNotification: (notification) {
                    if (notification.depth != 0) return false;
                    if (notification.metrics.axisDirection !=
                        AxisDirection.down) return false;
                    if (notification.metrics.pixels <
                        notification.metrics.maxScrollExtent) return false;

                    /// 如果没有更多, 服务返回错误信息, 网络异常,那么不允许上拉加载更多
                    if (snapshot.data == null ||
                        !snapshot.data.hasMore() ||
                        snapshot.data.hasError ||
                        snapshot.data.hasException) return false;
                    _loader.obtainData(false); // 加载更多
                    return false;
                  },

                  /// 下拉刷新
                  child: RefreshIndicator(
                    child: _buildList(snapshot.data),
                    onRefresh: () => _loader.obtainData(true),
                  ));
            }),
      );

  _buildList(DataLoadMoreBase<Article, Model> dataLoader) {
    /// 初始化时显示的View
    if (dataLoader == null) return Center(child: Text('欢迎光临...'));

    /// 没有数据时候显示的View构建
    if (!dataLoader.hasData)
      return LoadingEmptyIndicator(dataLoader: dataLoader);

    /// 渲染数据 ,这里数据+1 1表示最后一项,用于显示加载状态
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: 100.0,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) => Container(
                  height: 32.0,
                  width: 72.0,
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
                  margin: EdgeInsets.only(top: 32.0),
                  child: Center(child: Text(dataLoader[index].title)));
            }
          },
        ),
      ],
    );
  }
}

/// 数据业务逻辑处理
class _DataLoader extends DataLoadMoreBase<Article, Model> {
  bool _hasMore = true;
  @override
  Future<Model> getRequest(
      bool isRefresh, int currentPage, int pageSize) async {
    // 这里模拟网络请求
    var list = List();
    for (var i = 0; i < 20; i++) {
      var article = Article(title: "测试标题$i 页码:$currentPage");
      list.add(article);
    }
    await Future.delayed(Duration(seconds: 2));
    return Model(data: list, message: "加载成功", code: 0);
  }

  @override
  Future<bool> handlerData(Model model, bool isRefresh) async {
    // 1. 判断是否有业务错误,
    // 2. 将数据存入列表, 如果是刷新清空数据
    // 3. 判断是否有更多数据
    if (model == null || model.isError()) {
      return false;
    }

    if (isRefresh) clear();

    addAll((model.data as List<dynamic>).map((d) {
      return d as Article;
    }));

    _hasMore = length < 100;

    return true;
  }

  @override
  bool hasMore() => _hasMore;
}
