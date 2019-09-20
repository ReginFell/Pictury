import 'dart:async';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:pictury/data/category/category_dao.dart';
import 'package:pictury/data/category/models/category.dart';
import 'package:pictury/data/gallery/gallery_dao.dart';
import 'package:pictury/data/gallery/models/gallery_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [GalleryEntity, CategoryEntity])
abstract class AppDatabase extends FloorDatabase {
  GalleryDao get galleryDao;

  CategoryDao get categoryDao;
}
