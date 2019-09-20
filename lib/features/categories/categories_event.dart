import 'package:pictury/data/remote_config/models/category.dart';

import 'package:meta/meta.dart';

part 'categories_event.g.dart';

@sealed
abstract class CategoriesEvent with SealedCategoriesEvent {}

class InitLoadingEvent extends CategoriesEvent {}

class SelectCategoryEvent extends CategoriesEvent {
  final Category category;

  SelectCategoryEvent(this.category);
}

class ContinueEvent extends CategoriesEvent {}

class SearchQueryChangedEvent extends CategoriesEvent {
  final String query;

  SearchQueryChangedEvent(this.query);
}
