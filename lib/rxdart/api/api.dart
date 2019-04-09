import 'package:dio/dio.dart';

const SEARCH_URL = 'https://api.github.com/search/repositories?q=flutter';

class Api {
  fetchUrl(url, success, error, empty) async {
    var response = await Dio().get(url);
    var code = response.statusCode;
    if (code >= 200 && code <= 300) {
      var data = response.data;
      if (data != null) {
        success(data);
      } else {
        empty();
      }
    } else {
      error("请求失败:$code");
    }
  }
}
