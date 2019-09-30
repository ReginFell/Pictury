// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResource _$CategoryResourceFromJson(Map<String, dynamic> json) {
  return CategoryResource()
    ..name = json['name'] as String
    ..picture = json['picture'] as String
    ..query = json['query'] as String;
}

Map<String, dynamic> _$CategoryResourceToJson(CategoryResource instance) =>
    <String, dynamic>{
      'name': instance.name,
      'picture': instance.picture,
      'query': instance.query,
    };
