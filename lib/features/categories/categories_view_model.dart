import 'package:pictury/core/ui/base/base_view_model.dart';
import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/domain/categories/load_categories_use_case.dart';

import 'categories_view_state.dart';

class CategoriesViewModel extends BaseViewModel<CategoriesViewState> {
  final LoadCategoriesUseCase _loadCategoriesUseCase;

  CategoriesViewModel(this._loadCategoriesUseCase);

  void loadCategories() async {
    mutateViewState((viewState) => viewState.copy(isLoading: true));

    final List<Category> categories =
        await _loadCategoriesUseCase.loadCategories();

    mutateViewState((viewState) =>
        viewState.copy(isLoading: false, categories: categories));
  }

  void selectCategory(Category category) {
    mutateViewState((viewState) {
      if (viewState.selectedCategories.contains(category)) {
        viewState.copy(selectedCategories: viewState.selectedCategories);
      }
    });
  }

  @override
  CategoriesViewState initialViewState() => CategoriesViewState.createDefault();
}
