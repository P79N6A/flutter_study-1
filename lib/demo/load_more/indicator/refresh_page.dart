import 'package:flutter/material.dart';
import 'package:flutter_study/demo/load_more/indicator/loading_more_base.dart';

/// 构造内容
typedef RefreshPageContentBuilder = Function(
    BuildContext context, DataLoadBase status);

/// 构造欢迎页面,也就是没有动作之前的页面
typedef WelcomeBuilder = Function(BuildContext context);

/// 类似网页 打开的时候加载内容显示(加载中), 加载失败了(显示加载失败)可以点击再次加载
class RefreshPage extends StatelessWidget {
  final DataLoadBase _dataLoader;
  final RefreshPageContentBuilder _contentBuilder;
  final WelcomeBuilder welcomeBuilder;
  RefreshPage(this._dataLoader, this._contentBuilder, {this.welcomeBuilder});
  @override
  build(context) => StreamBuilder<DataLoadBase>(
      stream: _dataLoader.stream,
      builder: (context, snapshot) {
        var data = snapshot.data;
        if (data == null) {
          if (welcomeBuilder != null) return welcomeBuilder(context);
          return _buildWelcome(context);
        }
        // 数据为空
        if (!data.hasData) {
          if (data.isLoading) return Center(child: Text('加载中...')); // 加载中
          if (data.hasError) return _buildError(); // 业务逻辑错误
          if (data.hasException) return _buildException(); // 网络异常
          return _buildEmpty(); // 没有数据
        }
        // 有数据构建内容区域
        return _contentBuilder(context, snapshot.data);
      });

  _buildEmpty() => GestureDetector(
        onTap: () => _dataLoader.obtainData(false),
        child: Center(child: Text('暂无数据...')),
      );

  _buildError() => GestureDetector(
        onTap: () => _dataLoader.obtainData(false),
        child: Center(child: Text('暂无数据...')),
      );

  _buildException() => GestureDetector(
        onTap: () => _dataLoader.obtainData(false),
        child: Center(child: Text('网络异常...')),
      );

  _buildWelcome(context) => Center(child: Text('欢迎...'));
}
