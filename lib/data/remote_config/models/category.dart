import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  String name;
  String query;
  String picture;

  Category({
    this.name,
    this.query,
    this.picture,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          query == other.query &&
          picture == other.picture;

  @override
  int get hashCode => name.hashCode ^ query.hashCode ^ picture.hashCode;
}
