import 'package:pictury/data/remote_config/models/category.dart';

abstract class HomeEvent {}

class CategoriesLoadedEvent extends HomeEvent {
  final List<Category> categories;

  CategoriesLoadedEvent(this.categories);
}
