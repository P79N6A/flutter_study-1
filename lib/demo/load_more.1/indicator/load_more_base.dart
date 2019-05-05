// 数据加载逻辑组件

import 'dart:collection';
import 'package:rxdart/rxdart.dart';

enum PageState {
  None, // 现在什么也不做(网络请求前,网络请求完成)
  Loading, // 加载中
  LoadingError, // 加载失败(业务逻辑错误)
  LoadingException // 网络异常
}

/// [DATA] 列表中数据的类型
/// [MODEL] 模型类的类型
abstract class DataLoadMoreBase<DATA, MODEL> extends ListBase<DATA> {
  final _streamController = BehaviorSubject<DataLoadMoreBase<DATA, MODEL>>();
  Stream<DataLoadMoreBase<DATA, MODEL>> get stream => _streamController.stream;
  onStateChanged(DataLoadMoreBase<DATA, MODEL> source) {
    if (!_streamController.isClosed) _streamController.add(source);
  }

  dispose() => _streamController.close();
  final _data = <DATA>[];
  DATA operator [](index) => _data[index];
  operator []=(index, DATA value) => _data[index] = value;
  get length => _data.length;
  set length(newLen) => _data.length = newLen;
  final _pageSize = 20;
  var _currentPage = 0;
  var _pageState = PageState.None; // 当前页面状态
  get hasData => this.length > 0; // 是否有数据
  get hasError => _pageState == PageState.LoadingError; // 是否有业务逻辑错误
  get hasException => _pageState == PageState.LoadingException; // 是否有网络异常
  get isLoading => _pageState == PageState.Loading; // 是否正在加载
  get pageState => _pageState; // 获取当前页面状态
   obtainData([isRefresh = false]) async {
    if (!isLoading) return true;
    _pageState = PageState.Loading;
    onStateChanged(this);
    var success = false;
    try {
      success = await _loadData(isRefresh);
    } catch (e) {}
  }

  _loadData([isRefresh = false]) async {
    var currentPage = isRefresh ? 0 : _currentPage + 1;
    
  }
}

class _DataLoadBloc<T> {
  // 使用行为主体 BehaviorSubject 会保留最后一次的值, 监听会被回调
  final _streamController = BehaviorSubject<T>();
  Stream<T> get stream => _streamController.stream;
  onStateChanged(T source) {
    if (!_streamController.isClosed) _streamController.add(source);
  }

  dispose() => _streamController.close();
}
