import 'package:floor/floor.dart';
import 'package:pictury/domain/category/models/category_view_model.dart';

@Entity(tableName: "Category")
class CategoryEntity {
  @primaryKey
  final String name;
  final String image;
  final String query;

  final bool isSelected;

  CategoryEntity(this.name, this.image, this.query, this.isSelected);

  CategoryViewModel asViewModel({name, image, query, isSelected}) =>
      CategoryViewModel(
        name ?? this.name,
        image ?? this.image,
        query ?? this.query,
        isSelected ?? this.isSelected,
      );
}
