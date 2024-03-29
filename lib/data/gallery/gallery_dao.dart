import 'package:floor/floor.dart';
import 'package:pictury/data/gallery/models/gallery_entity.dart';

@dao
abstract class GalleryDao {
  @Query('SELECT * FROM Gallery')
  Stream<List<GalleryEntity>> observeAll();

  @Query('SELECT * FROM Gallery WHERE id = :id')
  Stream<List<GalleryEntity>> observeById(String id);

  @insert
  Future<void> insertEntity(GalleryEntity entity);

  @delete
  Future<void> deleteEntity(GalleryEntity entity);

  @insert
  Future<void> insertEntities(List<GalleryEntity> entity);
}
