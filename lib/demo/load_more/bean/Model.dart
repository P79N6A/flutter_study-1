import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Model {
  int code;
  String msg;
  Data data;
  isSuccess() => this.code == 0;
  isError() => !isSuccess();
  Model({this.code, this.msg, this.data});
  factory Model.fromJson(json) => _$ModelFromJson(json);
  toJson() => _$ModelToJson(this);
}

@JsonSerializable()
class Data {
  TopArticle topArticle;
  List<Article> list;
  Data({this.list, this.topArticle});
  factory Data.fromJson(json) => _$DataFromJson(json);
  toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Article {
  String title;
  String desc;
  String cover;
  String date;
  Article({this.title, this.desc, this.cover, this.date});
  factory Article.fromJson(json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable()
class TopArticle {
  String title;
  String cover;
  String commentCount;
  String link;
  TopArticle({this.title, this.cover, this.commentCount, this.link});
  factory TopArticle.fromJson(json) => _$TopArticleFromJson(json);
  Map<String, dynamic> toJson() => _$TopArticleToJson(this);
}
