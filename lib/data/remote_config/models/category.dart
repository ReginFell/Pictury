import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

class Category {
  String name;

  Category.named(this.name);

  Category();
}

@JsonSerializable()
class ApiCategory extends Category {
  String picture;
  String query;

  ApiCategory();

  ApiCategory.create({@required String name, this.picture, this.query})
      : super.named(name);

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

class LocalCategory extends Category {
  IconData iconData;

  LocalCategory(this.iconData);
}
