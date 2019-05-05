import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Model extends Object {
  int code;
  String message;
  dynamic data;
  bool isSuccess() => this.code == 0;
  bool isError() => !isSuccess();
  Model({this.code, this.message, this.data});
  factory Model.fromJson(json) => _$ModelFromJson(json);
  toJson() => _$ModelToJson(this);
}

@JsonSerializable()
class Article {
  String title;
  Article({this.title});
  factory Article.fromJson(json) => _$ArticleFromJson(json);
  toJson() => _$ArticleToJson(this);
}
