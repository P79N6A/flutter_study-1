class ArticleModel {
  var data;
  var errorCode;
  var errorMsg;
  factory ArticleModel(jsonStr) => ArticleModel.fromJson(jsonStr);
  ArticleModel.fromJson(jsonRes) {
    data = Data.fromJson(jsonRes['data']);
    errorCode = jsonRes['errorCode'];
    errorMsg = jsonRes['errorMsg'];
  }
}

class Data {
  var curPage;
  var datas;
  var offset;
  var over;
  var pageCount;
  var size;
  var total;
  Data.fromJson(jsonRes) {
    curPage = jsonRes['curPage'];
    datas = jsonRes['datas'];
    offset = jsonRes['offset'];
    over = jsonRes['over'];
    pageCount = jsonRes['pageCount'];
    size = jsonRes['size'];
    total = jsonRes['total'];
    for (var dataItem in datas == null ? [] : jsonRes['datas']) {

    }
  }
}

class Artical {
  var apkLink;
  var author;
  var chapterId;
  var chapterName;
  var collect;
  var courseId;
  var desc;
  var envelopePic;
  var fresh;
  var id;
  var link;
  var niceDate;
  var origin;
  var prefix;
  var projectLink;
  var publishTime;
  var superChapterId;
  var superChapterName;
  var tags;
  var title;
  var type;
  var userId;
  var visible;
  var zan;
}
