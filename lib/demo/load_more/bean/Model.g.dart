// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      code: json['code'] as int,
      msg: json['msg'] as String,
      data: json['data'] == null ? null : Data.fromJson(json['data']));

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      list: (json['list'] as List)
          ?.map((e) => e == null ? null : Article.fromJson(e))
          ?.toList(),
      topArticle: json['topArticle'] == null
          ? null
          : TopArticle.fromJson(json['topArticle'] as Map<String, dynamic>));

Map<String, dynamic> _$DataToJson(Data instance) =>
    <String, dynamic>{'topArticle': instance.topArticle, 'list': instance.list};

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      title: json['title'] as String,
      desc: json['desc'] as String,
      cover: json['cover'] as String,
      date: json['date'] as String);

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'title': instance.title,
      'desc': instance.desc,
      'cover': instance.cover,
      'date': instance.date
    };

TopArticle _$TopArticleFromJson(Map<String, dynamic> json) => TopArticle(
      title: json['title'] as String,
      cover: json['cover'] as String,
      commentCount: json['commentCount'] as String,
      link: json['link'] as String);

Map<String, dynamic> _$TopArticleToJson(TopArticle instance) =>
    <String, dynamic>{
      'title': instance.title,
      'cover': instance.cover,
      'commentCount': instance.commentCount,
      'link': instance.link
    };
