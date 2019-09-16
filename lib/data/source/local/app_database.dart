import 'dart:async';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:pictury/data/gallery/gallery_dao.dart';
import 'package:pictury/data/gallery/models/gallery_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [GalleryEntity])
abstract class AppDatabase extends FloorDatabase {
  GalleryDao get galleryDao;
}
