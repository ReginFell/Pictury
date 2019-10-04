import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pictury/data/api/api.dart';
import 'package:pictury/data/api/models/image_response.dart';
import 'package:pictury/data/category/category_dao.dart';
import 'package:pictury/data/category/models/category.dart';
import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/data/remote_config/remote_config_provider.dart';

class CategoryRepository {
  static const String categoriesTag = "categories";

  final Api _api;

  final Future<CategoryDao> _categoryDao;
  final RemoteConfigProvider _remoteConfigRepository;

  CategoryRepository(
    this._api,
    this._categoryDao,
    this._remoteConfigRepository,
  );

  Future<void> loadCategories() async {
    return _remoteConfigRepository.consume().then((storage) {
      final List<dynamic> parsedJson =
          json.decode(storage.getString(categoriesTag));

      final List<CategoryEntity> categoryEntities = parsedJson
          .map((value) => CategoryResource.fromJson(value))
          .map((apiCategory) => CategoryEntity(
              apiCategory.name, apiCategory.picture, apiCategory.query, false))
          .toList();

      saveCategories(categoryEntities);
    });
  }

  Future<void> addCategory(String name) async {
    final ImageResponse result =
        (await _api.loadByQuery(name, 1, perPage: 1)).first;

    return saveCategory(CategoryEntity(name, result.urls.regular, name, true));
  }

  Future<void> saveCategory(CategoryEntity entity) async {
    final CategoryDao dao = await _categoryDao;

    return dao.insertEntity(entity);
  }

  Future<void> updateCategory(CategoryEntity entity) async {
    final CategoryDao dao = await _categoryDao;

    return dao.updateEntity(entity);
  }

  Future<void> saveCategories(List<CategoryEntity> entities) async {
    final CategoryDao dao = await _categoryDao;

    return dao.insertEntities(entities);
  }

  Stream<List<CategoryEntity>> observeCategories() async* {
    final CategoryDao dao = await _categoryDao;

    yield* dao.observeAll();
  }
}
