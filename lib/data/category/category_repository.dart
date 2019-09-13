import 'dart:convert';

import 'package:pictury/data/category/adapter/category_adapter.dart';
import 'package:pictury/data/local_config/local_config_provider.dart';
import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/data/remote_config/remote_config_provider.dart';

class CategoryRepository {
  static const String categoriesTag = "categories";

  final RemoteConfigProvider _remoteConfigRepository;
  final LocalConfigProvider _localConfigRepository;

  CategoryRepository(this._localConfigRepository, this._remoteConfigRepository);

  Future<List<Category>> loadCategories() {
    return _remoteConfigRepository.consume().then((storage) {
      final List<dynamic> parsedJson =
          json.decode(storage.getString(categoriesTag));

      return parsedJson.map((value) => ApiCategory.fromJson(value)).toList();
    });
  }

  Stream<List<Category>> observeSelectedCategories() {
    return _localConfigRepository.consume().asStream().asyncExpand((storage) {
      return storage.getCustomValue(categoriesTag,
          defaultValue: List(), adapter: CategoryAdapter());
    });
  }

  void selectCategories(List<Category> categories) {
    _localConfigRepository.consume().then((storage) {
      storage.setString(categoriesTag, jsonEncode(categories));
    });
  }
}
