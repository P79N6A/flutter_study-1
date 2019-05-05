// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) {
  return Model(
      code: json['code'] as int,
      msg: json['msg'] as String,
      data: json['data']);
}

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data
    };

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(title: json['title']);
}

Map<String, dynamic> _$ArticleToJson(Article instance) =>
    <String, dynamic>{'title': instance.title};
