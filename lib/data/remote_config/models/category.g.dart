// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiCategory _$ApiCategoryFromJson(Map<String, dynamic> json) {
  return ApiCategory()
    ..name = json['name'] as String
    ..picture = json['picture'] as String
    ..query = json['query'] as String;
}

Map<String, dynamic> _$ApiCategoryToJson(ApiCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'picture': instance.picture,
      'query': instance.query,
    };
