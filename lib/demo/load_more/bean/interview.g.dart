// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterViewModel _$InterViewModelFromJson(Map<String, dynamic> json) {
  return InterViewModel(data: json['data']);
}

Map<String, dynamic> _$InterViewModelToJson(InterViewModel instance) =>
    <String, dynamic>{'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      interviewList: json['interviewList'] as List,
      topArticle: json['topArticle']);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'interviewList': instance.interviewList,
      'topArticle': instance.topArticle
    };

InterView _$InterViewFromJson(Map<String, dynamic> json) {
  return InterView(
      cover: json['cover'],
      title: json['title'],
      author: json['author'],
      date: json['date'],
      link: json['link'],
      likeCount: json['likeCount'],
      commentCount: json['commentCount']);
}

Map<String, dynamic> _$InterViewToJson(InterView instance) => <String, dynamic>{
      'cover': instance.cover,
      'title': instance.title,
      'author': instance.author,
      'date': instance.date,
      'link': instance.link,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount
    };

TopArticle _$TopArticleFromJson(Map<String, dynamic> json) {
  return TopArticle(
      title: json['title'],
      cover: json['cover'],
      commentCount: json['commentCount'],
      link: json['link']);
}

Map<String, dynamic> _$TopArticleToJson(TopArticle instance) =>
    <String, dynamic>{
      'title': instance.title,
      'cover': instance.cover,
      'commentCount': instance.commentCount,
      'link': instance.link
    };
