import 'dart:convert';

import 'package:pictury/data/category/category_dao.dart';
import 'package:pictury/data/category/models/category.dart';
import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/data/remote_config/remote_config_provider.dart';

class CategoryRepository {
  static const String categoriesTag = "categories";

  final Future<CategoryDao> _categoryDao;
  final RemoteConfigProvider _remoteConfigRepository;

  CategoryRepository(this._categoryDao, this._remoteConfigRepository);

  Future<void> loadCategories() async {
    return _remoteConfigRepository.consume().then((storage) {
      final List<dynamic> parsedJson =
          json.decode(storage.getString(categoriesTag));

      final List<CategoryEntity> categoryEntities = parsedJson
          .map((value) => ApiCategory.fromJson(value))
          .map((apiCategory) => CategoryEntity(
              apiCategory.name, apiCategory.picture, apiCategory.query, false))
          .toList();

      saveCategories(categoryEntities);
    });
  }

  Future<void> saveCategory(CategoryEntity entity) async {
    final CategoryDao dao = await _categoryDao;

    dao.insertEntity(entity);
  }

  Future<void> updateCategory(CategoryEntity entity) async {
    final CategoryDao dao = await _categoryDao;

    dao.updateEntity(entity);
  }

  Future<void> saveCategories(List<CategoryEntity> entities) async {
    final CategoryDao dao = await _categoryDao;

    dao.insertEntities(entities);
  }

  Stream<List<CategoryEntity>> observeCategories() async* {
    final CategoryDao dao = await _categoryDao;

    yield* dao.observeAll();
  }
}
