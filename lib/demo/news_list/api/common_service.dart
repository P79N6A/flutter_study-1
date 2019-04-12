import 'package:dio/dio.dart';
import 'package:flutter_study/demo/news_list/model/model.dart';

import 'dio_manager.dart';

const RECOMMENT_ARTICLE = 'https://www.cmtzz.cn/api/v1/recommends?page=';

class CommonService {
  fetchArticleList(callBack, _pageCount) async {
    DioManager.singleton.dio
        .get(RECOMMENT_ARTICLE + '$_pageCount')
        .then((Response response) => callBack(ArticleModel(response.data)));
  }

}
