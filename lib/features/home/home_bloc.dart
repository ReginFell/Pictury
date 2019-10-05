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
              categories.map((category) => category.asViewModel()).toList())
          .map((categories) {
        final List<CategoryViewModel> selectedCategories =
            categories.where((category) => category.isSelected).toList();

        final List<CategoryViewModel> homeCategories = []
          ..add(CategoryViewModel(
              name: "Everything",
              query: categories.map((v) => v.query).join(","),
              isSelected: true))
          ..add(CategoryViewModel(
              name: "Favorite", iconData: Icons.star, isSelected: true))
          ..addAll(selectedCategories);

        return homeCategories;
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
