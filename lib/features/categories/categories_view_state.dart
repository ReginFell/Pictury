import 'package:meta/meta.dart';
import 'package:pictury/data/remote_config/models/category.dart';

class CategoriesViewState {
  final List<Category> categories;
  final List<Category> selectedCategories;
  final bool isLoading;
  final Exception hasError;

  CategoriesViewState({
    @required this.categories,
    @required this.selectedCategories,
    @required this.isLoading,
    this.hasError,
  });

  static CategoriesViewState createDefault() => CategoriesViewState(
        categories: List(),
        selectedCategories: List(),
        isLoading: false,
        hasError: null,
      );

  CategoriesViewState copy(
      {List<Category> categories,
      List<Category> selectedCategories,
      bool isLoading,
      Exception hasError}) {
    return CategoriesViewState(
      categories: categories ?? this.categories,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
