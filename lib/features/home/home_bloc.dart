import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pictury/core/ui/base/base_bloc.dart';
import 'package:pictury/data/category/category_repository.dart';
import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/domain/category/models/category_view_model.dart';
import 'package:pictury/features/home/home_event.dart';
import 'package:pictury/features/home/home_view_state.dart';

class HomeBloc extends BaseBloc<HomeViewState, HomeEvent> {
  final CategoryRepository _categoryRepository;

  StreamSubscription _streamSubscription;

  HomeBloc(this._categoryRepository) {
    _streamSubscription = _categoryRepository
        .observeCategories()
        .map(
            (categories) => categories.where((category) => category.isSelected))
        .map((categories) =>
            categories.map((category) => category.asViewModel()))
        .asyncExpand((selectedCategories) {
      if (selectedCategories.isEmpty) {
        return _categoryRepository.observeCategories().map((categories) =>
            categories.map((category) => category.asViewModel()).toList());
      } else {
        final List<CategoryViewModel> categories = [];

        categories.add(CategoryViewModel(
            name: "Everything",
            query: selectedCategories.map((v) => v.query).join(","),
            isSelected: true));

        categories.add(CategoryViewModel(
            name: "Favorite", iconData: Icons.star, isSelected: true));

        categories.addAll(selectedCategories.toList());

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
