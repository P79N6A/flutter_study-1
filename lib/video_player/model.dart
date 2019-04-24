// 接口请求集合
import 'package:dio/dio.dart';

class CommonService {
  // 最新推荐
  fetchRecommend(callBack) async => DioManager.singleton.dio
      .get('https://raw.githubusercontent.com/Mr-Cai/Util-Res/master/api/news.json')
      .then((response) => callBack(RecommendModel(response.data)));
}

class API {
}

class DioManager {
  Dio _dio;
  DioManager._internal() {
    _dio = Dio();
  }
  static DioManager singleton = DioManager._internal();
  factory DioManager() => singleton;
  get dio => _dio;
}

class RecommendModel {
  var data;
  factory RecommendModel(res) => RecommendModel.fromJson(res);
  RecommendModel.fromJson(res) {
    data = Data.fromJson(res['data']);
  }
}

class Data {
  var title;
  var list = [];
  Data.fromJson(res) {
    res['list'].forEach((item) => list.add(Recommend.fromJson(item)));
  }
}

class Recommend {
  var title;
  var link;
  var cover;
  var author;
  var channel;
  Recommend.fromJson(res) {
    title = res['title'];
    link = res['link'];
    cover = res['cover'];
    author = res['author'];
    channel = res['channel'];
  }
}
