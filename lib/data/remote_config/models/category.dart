import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class ApiCategory {
  String name;
  String picture;
  String query;

  ApiCategory();

  ApiCategory.create({@required this.name, this.picture, this.query});

  factory ApiCategory.fromJson(Map<String, dynamic> json) =>
      _$ApiCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ApiCategoryToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiCategory &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          query == other.query &&
          picture == other.picture;

  @override
  int get hashCode => name.hashCode ^ query.hashCode ^ picture.hashCode;
}
