import 'package:flutter_study/rxdart_test/api/Api.dart';
import 'package:flutter_study/rxdart_test/model/search_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/widgets.dart';

class BlocProvider {
  final _api = Api();
  final _empty = '_empty_';
  final _fetcher = PublishSubject<SearchModel>();
  stream() => _fetcher.stream;
  dispose() => _fetcher.close();

  fetchQueryList() async =>
      fetchUrl(SEARCH_URL, (map) => SearchModel.fromJson(map));

  fetchUrl(url, handleData) async {
    _api.fetchUrl(
        url,
        (map) => _fetcher.sink.add(handleData(map)),
        (errorMsg) => _fetcher.sink.addError(errorMsg, null),
        () => _fetcher.sink.addError(_empty));
  }

  streamBuilder<T>({T initialData, success, error, empty, loading, finished}) =>
      StreamBuilder(
          stream: stream(),
          initialData: initialData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return success(snapshot.data);
            } else if (snapshot.hasError) {
              if (snapshot.error == _empty) {
                return empty();
              } else {
                return error();
              }
            } else {
              return loading();
            }
          });
  static instance() => BlocProvider();
}
