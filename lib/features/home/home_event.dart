import 'package:pictury/domain/category/models/category_view_model.dart';

abstract class HomeEvent {}

class CategoriesLoadedEvent extends HomeEvent {
  final List<CategoryViewModel> categories;

  CategoriesLoadedEvent(this.categories);
}
