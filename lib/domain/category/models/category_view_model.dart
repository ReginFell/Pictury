import 'package:built_value/built_value.dart';
import 'package:flutter/cupertino.dart';
import 'package:pictury/data/category/models/category.dart';

class CategoryViewModel {
  final String name;
  final String image;

  @nullable
  final String query;
  @nullable
  final IconData iconData;

  final bool isSelected;

  CategoryViewModel({
    @required this.name,
    this.image,
    this.query,
    this.iconData,
    @required this.isSelected,
  });

  CategoryEntity asEntity(
          {String name, String image, String query, bool isSelected}) =>
      CategoryEntity(
        name ?? this.name,
        image ?? this.image,
        query ?? this.query,
        isSelected ?? this.isSelected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryViewModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          image == other.image &&
          query == other.query &&
          isSelected == other.isSelected;

  @override
  int get hashCode =>
      name.hashCode ^ image.hashCode ^ query.hashCode ^ isSelected.hashCode;

  @override
  String toString() {
    return 'CategoryViewModel{name: $name, image: $image, query: $query, isSelected: $isSelected}';
  }
}
