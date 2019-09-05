import 'package:flutter/cupertino.dart';
import 'package:pictury/core/ui/base/base_view_model.dart';
import 'package:pictury/data/local_config/local_config_provider.dart';
import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/domain/categories/load_categories_use_case.dart';
import 'package:pictury/domain/categories/save_categories_use_case.dart';
import 'package:pictury/features/home/home_screen.dart';

import 'categories_view_state.dart';

class CategoriesViewModel extends BaseViewModel<CategoriesViewState> {
  final LoadCategoriesUseCase _loadCategoriesUseCase;
  final SaveCategoriesUseCase _saveCategoriesUseCase;
  final LocalConfigProvider _localConfigProvider;

  CategoriesViewModel(
    this._localConfigProvider,
    this._loadCategoriesUseCase,
    this._saveCategoriesUseCase,
  );

  void loadCategories() async {
    mutateViewState((viewState) => viewState.copy(isLoading: true));

    final List<Category> categories =
        await _loadCategoriesUseCase.loadCategories();

    final List<Category> selectedCategories =
        await _loadCategoriesUseCase.observeSelectedCategories().first;

    mutateViewState((viewState) => viewState.copy(
          isLoading: false,
          categories: categories,
          selectedCategories: selectedCategories,
        ));
  }

  void selectCategory(Category category) {
    mutateViewState((viewState) {
      if (viewState.selectedCategories.contains(category)) {
        return viewState.copy(
            selectedCategories: viewState.selectedCategories..remove(category));
      } else {
        return viewState.copy(
            selectedCategories: viewState.selectedCategories..add(category));
      }
    });
  }

  void skip(BuildContext context) {
    _saveCategoriesUseCase.saveCategories(viewState.selectedCategories);
    _localConfigProvider.setCategorySelected(true);

    Navigator.pushNamed(context, HomeScreen.route);
  }

  @override
  CategoriesViewState initialViewState() => CategoriesViewState.createDefault();
}
