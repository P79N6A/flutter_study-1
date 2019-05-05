import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Model  {
  int code;
  String msg;
  dynamic data;
  bool isSuccess() => this.data == 0;
  bool isError() => !isSuccess();
  Model({this.code, this.msg, this.data});
  factory Model.fromJson(res) => _$ModelFromJson(res); // 简谱转字段
  toJson() => _$ModelToJson(this); // 字段转简谱
}

@JsonSerializable()
class Article {
  var title;
  Article({this.title});
  factory Article.formJson(res) => _$ArticleFromJson(res);
  toJson() => _$ArticleToJson(this);
}
