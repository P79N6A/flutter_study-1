import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Model  {
  var code;
  var msg;
  var data;
  isSuccess() => this.code == 0;
  isError() => !isSuccess();
  Model({this.code, this.msg, this.data});
  factory Model.fromJson(res) => _$ModelFromJson(res);
  toJson() => _$ModelToJson(this);
}

@JsonSerializable()
class Article {
  var title;
  Article({this.title});
  factory Article.fromJson(res) => _$ArticleFromJson(res);
  toJson() => _$ArticleToJson(this);
}
