import 'package:built_value/built_value.dart';
import 'package:pictury/domain/category/models/category_view_model.dart';

part 'categories_view_state.g.dart';

abstract class CategoriesViewState
    implements Built<CategoriesViewState, CategoriesViewStateBuilder> {
  List<CategoryViewModel> get categories;

  List<CategoryViewModel> get filteredCategories;

  String get query;

  bool get isLoading;

  bool get doneEditing;

  @nullable
  Exception get hasError;

  CategoriesViewState._();

  static CategoriesViewState createDefault() => CategoriesViewState(
        (b) => b
          ..categories = List()
          ..filteredCategories = List()
          ..query = ""
          ..isLoading = false
          ..doneEditing = false
          ..hasError = null,
      );

  factory CategoriesViewState(
          [void Function(CategoriesViewStateBuilder) updates]) =
      _$CategoriesViewState;
}
