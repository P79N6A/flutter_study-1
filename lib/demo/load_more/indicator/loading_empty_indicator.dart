import 'package:flutter/material.dart';
import '../indicator/loading_more_base.dart';

// 没有数据时的当前加载状态指示器
class LoadingEmptyIndicator extends StatelessWidget {
  final DataLoadMoreBase dataLoader;
  LoadingEmptyIndicator({this.dataLoader});

  @override
  Widget build(BuildContext context) {
    if (dataLoader != null && !dataLoader.hasData) {
      if (dataLoader.pageState == PageState.Loading) {
        return Center(child: Text('正在加载中...'));
      }

      if (dataLoader.pageState == PageState.LoadingException) {
        return GestureDetector(
          onTap: () => dataLoader.obtainData(false),
          child: Center(child: Text('网络异常...')),
        );
      }

      if (dataLoader.pageState == PageState.LoadingError) {
        return GestureDetector(
          onTap: () => dataLoader.obtainData(false),
          child: Center(child: Text('业务逻辑错误...')),
        );
      }

      return GestureDetector(
        onTap: () => dataLoader.obtainData(false),
        child: Center(child: Text('暂无数据...')),
      );
    }
    return Center(child: Text('欢迎光临...'));
  }
}
