import 'package:built_value/built_value.dart';
import 'package:pictury/data/remote_config/models/category.dart';

part 'categories_view_state.g.dart';

abstract class CategoriesViewState
    implements Built<CategoriesViewState, CategoriesViewStateBuilder> {
  List<Category> get categories;

  List<Category> get selectedCategories;

  List<Category> get customCategories;

  bool get isLoading;

  bool get doneEditing;

  @nullable
  Exception get hasError;

  CategoriesViewState._();

  static CategoriesViewState createDefault() => CategoriesViewState(
        (b) => b
          ..categories = List()
          ..customCategories = List()
          ..selectedCategories = List()
          ..isLoading = false
          ..doneEditing = false
          ..hasError = null,
      );

  factory CategoriesViewState(
          [void Function(CategoriesViewStateBuilder) updates]) =
      _$CategoriesViewState;
}
