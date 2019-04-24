import 'package:dio/dio.dart';
import 'package:flutter_study/demo/news_list/model/model.dart';
import 'package:flutter_study/demo/news_list/model/video.dart';

import 'dio_manager.dart';

const RECOMMENT_ARTICLE = 'https://www.cmtzz.cn/api/v1/recommends?page=';
const VIDEO_LIST = 'https://raw.githubusercontent.com/Mr-Cai/Util-Res/master/api/video_list.json';

class CommonService {
  fetchArticleList(callBack, _pageCount) async {
    DioManager.singleton.dio
        .get(RECOMMENT_ARTICLE + '$_pageCount')
        .then((Response response) => callBack(ArticleModel(response.data)));
  }

  fetchVideoList(callBack, {pageCount}) async {
    DioManager.singleton.dio
        .get(VIDEO_LIST,)
        .then((Response response) => callBack(VideoUrlModel(response.data)));
  }
}
