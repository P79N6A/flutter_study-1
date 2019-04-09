import 'package:flutter/widgets.dart';
import '../api/api.dart';
import '../model/search_model.dart';
import 'package:rxdart/rxdart.dart';

class BlocProvider {
  final _api = Api();
  final _empty = "_empty_";
  final _fetcher = PublishSubject<SearchModel>(); // 实体类获取器
  stream() => _fetcher.stream;
  dispose() => _fetcher.close();
  fetchQueryList() async =>
      fetchUrl(SEARCH_URL, (map) => SearchModel.fromJson(map));
  fetchUrl(url, handleData) async {
    _api.fetchUrl(
        url,
        (map) => _fetcher.sink.add(handleData(map)), // 获取深层字段值
        (errorMsg) => _fetcher.sink.addError(errorMsg, null), // 报错
        () => _fetcher.sink.addError(_empty));
  }

  /// [initalData] 初始化数据
  /// [success] 请求成功函数
  /// [error] 请求错误函数
  /// [empty] 请求为空函数
  /// [loading] 请求加载函数
  /// [finished] 请求完成函数
  streamBuilder<T>({T initalData, success, error, empty, loading, finished}) =>
      StreamBuilder(
          stream: stream(),
          initialData: initalData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return success(snapshot.data);
            } else if (snapshot.hasError) {
              if (snapshot.error == _empty) {
                return empty();
              } else {
                return error(snapshot.error);
              }
            } else {
              return loading();
            }
          });
  static instance() => BlocProvider();
}
