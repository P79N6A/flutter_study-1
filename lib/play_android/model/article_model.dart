class ArticleModel {
  var errorCode;
  var errorMsg;
  var data;
  factory ArticleModel(jsonStr) => ArticleModel.fromJson(jsonStr);

  ArticleModel.fromJson(jsonRes) {
    errorCode = jsonRes['errorCode'];
    errorMsg = jsonRes['errorMsg'];
    data = Data.fromJson(jsonRes['data']);
  }
}

class Data {
  var curPage;
  var offset;
  var pageCount;
  var size;
  var total;
  var over;
  var datas;
  Data.fromJson(jsonRes) {
    curPage = jsonRes['curPage'];
    offset = jsonRes['offset'];
    pageCount = jsonRes['pageCount'];
    size = jsonRes['size'];
    total = jsonRes['total'];
    over = jsonRes['over'];
    datas = [];
    for (var datasItem in jsonRes['datas']) {
      datas.add(Article.fromJson(datasItem));
    }
  }
}

class Article {
  var chapterId;
  var courseId;
  var id;
  var publishTime;
  var superChapterId;
  var type;
  var userId;
  var visible;
  var zan;
  var collect;
  var fresh;
  var apkLink;
  var author;
  var chapterName;
  var desc;
  var envelopePic;
  var link;
  var niceDate;
  var origin;
  var projectLink;
  var superChapterName;
  var title;
  Article.fromJson(jsonRes) {
    chapterId = jsonRes['chapterId'];
    courseId = jsonRes['courseId'];
    id = jsonRes['id'];
    publishTime = jsonRes['publishTime'];
    superChapterId = jsonRes['superChapterId'];
    type = jsonRes['type'];
    userId = jsonRes['userId'];
    visible = jsonRes['visible'];
    zan = jsonRes['zan'];
    collect = jsonRes['collect'];
    fresh = jsonRes['fresh'];
    apkLink = jsonRes['apkLink'];
    author = jsonRes['author'];
    chapterName = jsonRes['chapterName'];
    desc = jsonRes['desc'];
    envelopePic = jsonRes['envelopePic'];
    link = jsonRes['link'];
    niceDate = jsonRes['niceDate'];
    origin = jsonRes['origin'];
    projectLink = jsonRes['projectLink'];
    superChapterName = jsonRes['superChapterName'];
    title = jsonRes['title'];
  }
}
