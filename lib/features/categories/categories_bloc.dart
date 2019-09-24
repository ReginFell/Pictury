import 'package:pictury/core/ui/base/base_bloc.dart';
import 'package:pictury/data/category/category_repository.dart';
import 'package:pictury/data/category/models/category.dart';
import 'package:pictury/data/local_config/local_config_provider.dart';
import 'package:pictury/domain/category/models/category_view_model.dart';
import 'package:pictury/features/categories/categories_event.dart';

import 'categories_view_state.dart';

class CategoriesBloc extends BaseBloc<CategoriesViewState, CategoriesEvent> {
  final LocalConfigProvider _localConfigProvider;
  final CategoryRepository _categoryRepository;

  CategoriesBloc(
    this._localConfigProvider,
    this._categoryRepository,
  ) {
    subscriptions.add(
      _categoryRepository
          .observeCategories()
          .listen((value) => dispatch(LoadCategoriesEvent(value))),
    );
  }

  @override
  CategoriesViewState get initialState => CategoriesViewState.createDefault();

  @override
  Stream<CategoriesViewState> mapEventToState(event) async* {
    yield* event.when(
        initEvent: _init,
        selectCategoryEvent: _selectCategory,
        continueEvent: _continue,
        loadCategoriesEvent: _loadCategories,
        searchQueryChangedEvent: _searchCategories,
        addCategoryEvent: _addCategory);
  }

  Stream<CategoriesViewState> _addCategory(AddCategoryEvent event) async* {
    await _categoryRepository.addCategory(event.name);
  }

  Stream<CategoriesViewState> _init(InitEvent event) async* {
    yield currentState.rebuild((b) => b..isLoading = true);

    await _categoryRepository.loadCategories();
  }

  Stream<CategoriesViewState> _loadCategories(
      LoadCategoriesEvent event) async* {
    yield currentState.rebuild((b) => b..isLoading = false);

    yield* _filter(
      event.entities.map((entity) => entity.asViewModel()).toList(),
      currentState.query,
    );
  }

  Stream<CategoriesViewState> _searchCategories(
      SearchQueryChangedEvent event) async* {
    yield* _filter(
      currentState.categories,
      event.query,
    );
  }

  Stream<CategoriesViewState> _selectCategory(
      SelectCategoryEvent event) async* {
    final CategoryEntity entity = event.categoryViewModel
        .asEntity(isSelected: !event.categoryViewModel.isSelected ?? true);

    await _categoryRepository.updateCategory(entity);
  }

  Stream<CategoriesViewState> _continue(ContinueEvent event) async* {
    _localConfigProvider.setCategorySelected(true);

    yield currentState.rebuild((b) => b..doneEditing = true);
  }

  Stream<CategoriesViewState> _filter(
      List<CategoryViewModel> models, query) async* {
    final List filteredCategories = models
        .where((category) =>
            category.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    yield currentState.rebuild(
      (b) => b
        ..categories = models
        ..filteredCategories = filteredCategories
        ..query = query,
    );
  }
}
