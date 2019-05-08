import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

enum PageState {
  None, // 现在什么也没做(网络请求前,网络请求完成)
  Loading, // 加载中
  LoadingError, // 加载失败(业务逻辑错误)
  LoadingException, // 网络异常
}

/// [DATA] 列表中的数据的数据类型
/// [MODEL] 服务返回的数据结构对应的数据类
abstract class DataLoadBase<DATA, MODEL>
    extends _DataLoadBloc<DataLoadBase<DATA, MODEL>> {
  var _data;
  var _pageState = PageState.None; // 页面状态
  get hasError => _pageState == PageState.LoadingError; // 是否有业务逻辑错误
  get hasException => _pageState == PageState.LoadingException; // 是否有网络异常
  get isLoading => _pageState == PageState.Loading; // 是否正在加载
  get pageState => _pageState; // 获取当前页面状态
  get hasData {
    if (_data == null) return false;
    if (_data is List) return (_data as List).length > 0;
    return true;
  }

  obtainData([isRefresh = false]) async {
    if (isLoading) return true;
    _pageState = PageState.Loading;
    onStateChanged(this);
    var success = false;
    try {
      success = await _loadData(isRefresh);
      if (success) {
        _pageState = PageState.None; // 加载数据成功
      } else {
        _pageState = PageState.LoadingError; // 加载数据业务逻辑错误
      }
    } catch (e) {
      _pageState = PageState.LoadingException; // 网络异常
    }
    onStateChanged(this);
    return success;
  }

  // 加载数据
  _loadData([isRefresh = false]) async {
    var model = await getRequest(isRefresh);
    var success = await handleData(model, isRefresh);
    return success;
  }

  getRequest(isRefresh);

  /// 重载这个方法,必须在这个方法将数据添加到列表中
  /// [model] 本次请求回来的数据
  /// [isRefresh] 是否清空原来的数据
  handleData(model, isRefresh);
}

/// [DATA] 列表中数据的类型
/// [MODEL] 服务返回的数据结构对应的数据类
abstract class DataLoadMoreBase<DATA, MODEL> extends ListBase<DATA> {
  // 使用 BehaviorSubject 会保留最后一次的值,所有监听都被回调
  final _streamController = BehaviorSubject<DataLoadMoreBase<DATA, MODEL>>();

  // 页面通过监听stream变化更新界面
  get stream => _streamController.stream;

  onStateChanged(source) {
    if (!_streamController.isClosed) _streamController.add(source);
  }

  dispose() => _streamController.close();
  final _data = [];
  operator [](index) => _data[index];
  operator []=(index, value) => _data[index] = value;
  get length => _data.length;
  set length(newLen) => _data.length = newLen;
  final _pageSize = 20;
  var _currentPage = 0;
  var _pageState = PageState.None; // 当前页面状态
  get hasData => this.length > 0; // 是否有数据
  get hasError => _pageState == PageState.LoadingError; // 是否有业务逻辑错误
  get hasException => _pageState == PageState.LoadingException; //是否有网络异常
  get isLoading => _pageState == PageState.Loading; // 是否加载中
  get pageState => _pageState; // 获取当前页面状态
  ///拉取数据, [isRefresh] 判断是否清空原来的数据
  obtainData([isRefresh = false]) async {
    if (isLoading) return true;
    _pageState = PageState.Loading;
    onStateChanged(this);
    var success = false;
    try {
      success = await _loadData(isRefresh);
      if (success) {
        _pageState = PageState.None; // 加载数据成功
      } else {
        _pageState = PageState.LoadingError; // 加载数据业务逻辑错误
      }
    } catch (e) {
      _pageState = PageState.LoadingException; // 网络异常
    }
    onStateChanged(this);
    return success;
  }

  /// 加载数据[isRefresh] 判断是否刷新并清空原来的数据
  _loadData([isRefresh = false]) async {
    var currentPage = isRefresh ? 0 : _currentPage + 1;
    var model = await getRequest(isRefresh, currentPage, _pageSize);
    var success = await handlerData(model, isRefresh);
    if (success) _currentPage = currentPage;
    return success;
  }

  hasMore(); // 是否还有更多数据

  /// 构造请求
  /// [isRefresh] 是否刷新并清空原来的数据
  /// [currentPage] 将要请求的页码
  /// [pageSize] 每页多少数据
  getRequest(isRefresh, currentPage, pageSize);

  /// 1.判断是否有业务错误
  /// 2.将数据存入列表,如果是刷新则清空数据
  /// 3.判断是否有更多数据
  /// 重载这个方法,必须在这个方法的数据添加到列表中
  /// [model] 本次请求回来的数据
  /// [isRefresh] 是否刷新并清空原来的数据

  handlerData( model,  isRefresh);
}

// 数据加载Bloc
class _DataLoadBloc<T> {
  // 使用 BehaviorSubject 会保留最后一次的值,监听会被回调
  final _streamController = BehaviorSubject<T>();
  Stream<T> get stream => _streamController.stream;
  onStateChanged(T source) {
    if (!_streamController.isClosed) _streamController.add(source);
  }

  dispose() => _streamController.close();
}
