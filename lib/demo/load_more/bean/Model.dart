import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Model extends Object {
  int code;
  String msg;
  dynamic data;

  bool isSuccess() {
    return this.code == 0;
  }

  bool isError() {
    return !isSuccess();
  }

  Model({this.code, this.msg, this.data});

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

@JsonSerializable()
class Article {
  String title;

  Article({this.title});

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
