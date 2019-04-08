import 'package:dio/dio.dart';

class Api {
  void fetchUrl(
      String url, Function success, Function error, Function empty) async {
    Response response = await Dio().get(url);
    int code = response.statusCode;
    if (code >= 200 && code <= 300) {
      Map<String, dynamic> data = response.data;
      if (data != null) {
        success(data);
        print(data);
      } else {
        empty();
      }
    } else {
      error("请求失败:$code");
    }
  }
}
