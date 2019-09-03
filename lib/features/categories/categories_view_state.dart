import 'package:meta/meta.dart';
import 'package:pictury/data/remote_config/models/category.dart';

class CategoriesViewState {
  final List<Category> categories;
  final bool isLoading;
  final Exception hasError;

  CategoriesViewState(
      {@required this.categories, @required this.isLoading, this.hasError});

  static CategoriesViewState createDefault() => CategoriesViewState(
        categories: List(),
        isLoading: false,
        hasError: null,
      );

  CategoriesViewState copy(
      {List<Category> pictures, bool isLoading, Exception hasError}) {
    return CategoriesViewState(
      categories: pictures ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
