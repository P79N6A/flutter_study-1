class ArticleModel {
  var code;
  var msg;
  var data;
  factory ArticleModel(jsonStr) => ArticleModel.fromJson(jsonStr);
  ArticleModel.fromJson(jsonRes) {
    data = Data.fromJson(jsonRes['data']);
  }
}

class Data {
  var title;
  var list;
  Data.fromJson(jsonRes) {
    list = [];
    for (var item in jsonRes['list']) {
      list.add(Artical.fromJson(item));
    }
  }
}

class Artical {
  var title;
  var link;
  var cover;
  var author;
  var channel;
  Artical.fromJson(jsonRes) {
    title = jsonRes['title'];
    link = jsonRes['link'];
    cover = jsonRes['cover'];
    author = jsonRes['author'];
    channel = jsonRes['channel'];
  }
}
