import 'package:pictury/data/category/category_repository.dart';
import 'package:pictury/domain/categories/load_categories_use_case.dart';
import 'package:pictury/domain/categories/save_categories_use_case.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> independentServices = [];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<CategoryRepository, LoadCategoriesUseCase>(
    builder: (context, categoryRepository, loadCategoriesUseCase) =>
        LoadCategoriesUseCase(categoryRepository),
  ),
  ProxyProvider<CategoryRepository, SaveCategoriesUseCase>(
    builder: (context, categoryRepository, saveCategoriesUseCase) =>
        SaveCategoriesUseCase(categoryRepository),
  ),
];
