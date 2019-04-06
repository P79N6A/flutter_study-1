import 'package:dio/dio.dart';

class DioManager {
  Dio _dio;

  DioManager._internal() {
    _dio = Dio();
  }

  static DioManager singleton = DioManager._internal();
  factory DioManager() => singleton;

  get dio => _dio;
}
