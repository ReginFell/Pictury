import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pictury/core/ui/base/base_bloc.dart';
import 'package:pictury/data/category/category_repository.dart';
import 'package:pictury/domain/category/models/category_view_model.dart';
import 'package:pictury/features/home/home_event.dart';
import 'package:pictury/features/home/home_view_state.dart';

class HomeBloc extends BaseBloc<HomeViewState, HomeEvent> {
  final CategoryRepository _categoryRepository;

  HomeBloc(this._categoryRepository) {
    subscriptions.add(
      _categoryRepository
          .observeCategories()
          .map((categories) =>
              categories.where((category) => category.isSelected))
          .map((categories) =>
              categories.map((category) => category.asViewModel()).toList())
          .map((selectedCategories) {
        final List<CategoryViewModel> categories = []..add(CategoryViewModel(
            name: "Everything",
            query: selectedCategories.map((v) => v.query).join(","),
            isSelected: true));
        categories
          ..add(CategoryViewModel(
              name: "Favorite", iconData: Icons.star, isSelected: true))
          ..addAll(selectedCategories);

        return categories;
      }).listen((selectedCategories) =>
              dispatch(CategoriesLoadedEvent(selectedCategories))),
    );
  }

  @override
  Stream<HomeViewState> mapEventToState(event) async* {
    if (event is CategoriesLoadedEvent) {
      yield HomeViewState(categories: event.categories);
    }
  }

  @override
  HomeViewState get initialState => HomeViewState.createDefault();
}
