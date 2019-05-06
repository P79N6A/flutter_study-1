import 'package:flutter/material.dart';
export 'loading_empty_indicator.dart';
export 'loading_more_base.dart';

// 加载更多 列表的最后一项, 用于显示当前的状态
class LoadingIndicator extends StatelessWidget {
  /// [dataLoader]is[DataLoadMoreBase]
  final dataLoader;
  const LoadingIndicator({this.dataLoader});
  @override
  build(context) {
    var _indicator;
    if (dataLoader.isLoading) {
      _indicator = Text("正在加载中...");
    } else if (dataLoader.hasException) {
      _indicator = Text("网络异常...");
    } else if (dataLoader.hasError) {
      _indicator = Text("出错了...");
    } else if (!dataLoader.hasMore()) {
      _indicator = Text("没有更多...");
    } else if (dataLoader.hasMore()) {
      _indicator = Text("还有更多...");
    } else {
      _indicator = Text("...");
    }
    return Center(child: _indicator);
  }
}
