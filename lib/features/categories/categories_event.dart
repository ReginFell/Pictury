import 'package:pictury/data/category/models/category.dart';

import 'package:meta/meta.dart';
import 'package:pictury/domain/category/models/category_view_model.dart';

part 'categories_event.g.dart';

@sealed
abstract class CategoriesEvent with SealedCategoriesEvent {}

class InitEvent extends CategoriesEvent {}

class LoadCategoriesEvent extends CategoriesEvent {
  final List<CategoryEntity> entities;

  LoadCategoriesEvent(this.entities);
}

class SelectCategoryEvent extends CategoriesEvent {
  final CategoryViewModel categoryViewModel;

  SelectCategoryEvent(this.categoryViewModel);
}

class ContinueEvent extends CategoriesEvent {}

class SearchQueryChangedEvent extends CategoriesEvent {
  final String query;

  SearchQueryChangedEvent(this.query);
}
