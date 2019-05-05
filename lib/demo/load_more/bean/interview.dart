import 'package:json_annotation/json_annotation.dart';

part 'interview.g.dart';

@JsonSerializable()
class InterViewModel extends Object {
  var data; // 数据集
  InterViewModel({this.data});
  factory InterViewModel.fromJson(res) => _$InterViewModelFromJson(res);
  toJson() => _$InterViewModelToJson(this);
}

@JsonSerializable()
class Data {
  var interviewList = [];
  final topArticle;

  Data({this.interviewList, this.topArticle});
  factory Data.fromJson(res) => _$DataFromJson(res);
  toJson() => _$DataToJson(this);
}

@JsonSerializable()
class InterView {
  final cover;
  final title;
  final author;
  final date;
  final link;
  final likeCount;
  final commentCount;
  InterView(
      {this.cover,
      this.title,
      this.author,
      this.date,
      this.link,
      this.likeCount,
      this.commentCount});
  factory InterView.fromJson(res) => _$InterViewFromJson(res);
  toJson() => _$InterViewToJson(this);
}

@JsonSerializable()
class TopArticle {
  final title;
  final cover;
  final commentCount;
  final link;
  TopArticle({this.title, this.cover, this.commentCount, this.link});
  factory TopArticle.fromJson(res) => _$TopArticleFromJson(res);
  toJson() => _$TopArticleToJson(this);
}
