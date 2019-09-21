import 'package:flutter/cupertino.dart';
import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/domain/category/models/category_view_model.dart';

class HomeViewState {
  final List<CategoryViewModel> categories;

  HomeViewState({@required this.categories});

  static HomeViewState createDefault() => HomeViewState(categories: List());
}
