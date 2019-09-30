import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class CategoryResource {
  String name;
  String picture;
  String query;

  CategoryResource();

  CategoryResource.create({@required this.name, this.picture, this.query});

  factory CategoryResource.fromJson(Map<String, dynamic> json) =>
      _$CategoryResourceFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResourceToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryResource &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          query == other.query &&
          picture == other.picture;

  @override
  int get hashCode => name.hashCode ^ query.hashCode ^ picture.hashCode;
}
