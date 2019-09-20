import 'package:pictury/core/ui/base/base_bloc.dart';
import 'package:pictury/data/local_config/local_config_provider.dart';
import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/domain/categories/load_categories_use_case.dart';
import 'package:pictury/domain/categories/save_categories_use_case.dart';
import 'package:pictury/features/categories/categories_event.dart';

import 'categories_view_state.dart';

class CategoriesBloc extends BaseBloc<CategoriesViewState, CategoriesEvent> {
  final LoadCategoriesUseCase _loadCategoriesUseCase;
  final SaveCategoriesUseCase _saveCategoriesUseCase;
  final LocalConfigProvider _localConfigProvider;

  CategoriesBloc(
    this._localConfigProvider,
    this._loadCategoriesUseCase,
    this._saveCategoriesUseCase,
  );

  @override
  CategoriesViewState get initialState => CategoriesViewState.createDefault();

  @override
  Stream<CategoriesViewState> mapEventToState(event) async* {
    yield* event.when(
      initLoadingEvent: _loadCategories,
      selectCategoryEvent: _selectCategory,
      continueEvent: _continue,
      searchQueryChangedEvent: _searchCategories,
    );
  }

  Stream<CategoriesViewState> _loadCategories(InitLoadingEvent event) async* {
    yield currentState.rebuild((b) => b..isLoading = true);

    final List<Category> categories =
        await _loadCategoriesUseCase.loadCategories();

    final List<Category> selectedCategories =
        await _loadCategoriesUseCase.observeSelectedCategories().first;

    yield currentState.rebuild(
      (b) => b
        ..isLoading = false
        ..categories = categories
        ..filteredCategories = categories
        ..selectedCategories = selectedCategories,
    );
  }

  Stream<CategoriesViewState> _searchCategories(
      SearchQueryChangedEvent event) async* {
    final List filteredCategories = currentState.categories
        .where((category) =>
            category.name.toLowerCase().contains(event.query.toLowerCase()))
        .toList();

    yield currentState.rebuild((b) => b
      ..filteredCategories = filteredCategories
      ..query = event.query);
  }

  Stream<CategoriesViewState> _selectCategory(
      SelectCategoryEvent event) async* {
    yield currentState.rebuild(
      (b) => b
        ..selectedCategories = b.selectedCategories.contains(event.category)
            ? [...b.selectedCategories..remove(event.category)]
            : [...b.selectedCategories..add(event.category)],
    );
  }

  Stream<CategoriesViewState> _continue(ContinueEvent event) async* {
    _saveCategoriesUseCase.saveCategories(currentState.selectedCategories);
    _localConfigProvider.setCategorySelected(true);

    yield currentState.rebuild((b) => b..doneEditing = true);
  }
}
