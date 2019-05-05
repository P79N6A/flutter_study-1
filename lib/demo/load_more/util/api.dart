import 'package:dio/dio.dart';
import 'package:flutter_study/demo/load_more/bean/interview.dart';

class DioManager {
  Dio _dio;
  DioManager._internal() {
    _dio = Dio();
  }
  static DioManager singleton = DioManager._internal();
  factory DioManager() => singleton;
  get dio => _dio;
}

class CommonService {
  // 聪投访谈
  fetchInterView(callBack, _pageCount) async => DioManager.singleton.dio
      .get('https://www.cmtzz.cn/api/v1/interviews?page=$_pageCount')
      .then((response) => callBack(InterViewModel(data: response.data)));
}
