import 'package:rxdart/rxdart.dart';

import '../model/search_model.dart';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';

const SEARCH_URL = 'https://api.github.com/search/repositories?q=flutter';

class ApiProvider {
  final _fetcher = PublishSubject<SearchModel>();

  void fetchRankList() async => _fetchUrl(
      SEARCH_URL,
      (map) => _fetcher.sink.add(SearchModel.fromJson(map)),
      (errorMsg) => _fetcher.sink.addError(errorMsg, null),
      () => _fetcher.sink.addError('_empty_'));

  /// [initalData] 初始化数据
  /// [success] 请求成功函数
  /// [error] 请求错误函数
  /// [empty] 请求为空函数
  /// [loading] 请求加载函数
  /// [finished] 请求完成函数

  Widget streamBuilder<T>({
    T initalData,
    Function success,
    Function error,
    Function empty,
    Function loading,
    Function finished,
  }) =>
      StreamBuilder(
          stream: stream,
          initialData: initalData,
          builder: (context, snapshot) {
            finished();
            if (snapshot.hasData) {
              return success(snapshot.data);
            } else if (snapshot.hasError) {
              if (snapshot.error == '_empty_') {
                return empty();
              } else {
                return error(snapshot.error);
              }
            } else {
              return loading();
            }
          });
  void _fetchUrl(
      String url, Function success, Function error, Function empty) async {
    Response response = await Dio().get(url);
    int code = response.statusCode;
    if (code >= 200 && code <= 300) {
      Map<String, dynamic> data = response.data;
      if (data != null) {
        success(data);
      } else {
        empty();
      }
    } else {
      error("请求失败:$code");
    }
  }

  static ApiProvider instance() => ApiProvider();
  get stream => _fetcher.stream;
  void dispose() => _fetcher.close();
}
