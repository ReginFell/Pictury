import 'package:floor/floor.dart';
import 'package:pictury/data/category/models/category.dart';

@dao
abstract class CategoryDao {
  @Query('SELECT * FROM Category ORDER BY name')
  Stream<List<CategoryEntity>> observeAll();

  @Query('SELECT * FROM Category WHERE id = :id')
  Stream<List<CategoryEntity>> observeById(String id);

  @Insert(onConflict: OnConflictStrategy.REPLACE)
  Future<void> insertEntity(CategoryEntity entity);

  @delete
  Future<void> deleteEntity(CategoryEntity entity);

  @Insert(onConflict: OnConflictStrategy.REPLACE)
  Future<void> insertEntities(List<CategoryEntity> entity);
}
