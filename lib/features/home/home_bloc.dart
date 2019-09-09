import 'dart:async';

import 'package:pictury/core/ui/base/base_bloc.dart';
import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/domain/categories/load_categories_use_case.dart';
import 'package:pictury/features/home/home_event.dart';
import 'package:pictury/features/home/home_view_state.dart';

class HomeBloc extends BaseBloc<HomeViewState, HomeEvent> {
  final LoadCategoriesUseCase _loadCategoriesUseCase;

  StreamSubscription _streamSubscription;

  HomeBloc(this._loadCategoriesUseCase) {
    _streamSubscription = _loadCategoriesUseCase
        .observeSelectedCategories()
        .asyncExpand((selectedCategories) {
      if (selectedCategories.isEmpty) {
        return _loadCategoriesUseCase.loadCategories().asStream();
      } else {
        final List<Category> categories = List();

        if (selectedCategories.length != 1) {
          categories.add(Category(
              name: "All",
              query: selectedCategories.map((v) => v.query).join(",")));
        }

        categories.addAll(selectedCategories);

        return Future.value(categories).asStream();
      }
    }).listen((selectedCategories) =>
            dispatch(CategoriesLoadedEvent(selectedCategories)));
  }

  @override
  Stream<HomeViewState> mapEventToState(event) async* {
    if (event is CategoriesLoadedEvent) {
      yield HomeViewState(categories: event.categories);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  @override
  HomeViewState get initialState => HomeViewState.createDefault();
}
