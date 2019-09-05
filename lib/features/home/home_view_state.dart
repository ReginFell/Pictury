import 'package:flutter/cupertino.dart';
import 'package:pictury/data/remote_config/models/category.dart';

class HomeViewState {
  final List<Category> categories;

  HomeViewState({@required this.categories});

  static HomeViewState createDefault() => HomeViewState(categories: List());
}
