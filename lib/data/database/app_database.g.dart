// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final database = _$AppDatabase();
    database.database = await database.open(
      name ?? ':memory:',
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  GalleryDao _galleryDaoInstance;

  CategoryDao _categoryDaoInstance;

  Future<sqflite.Database> open(String name, List<Migration> migrations,
      [Callback callback]) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Gallery` (`id` TEXT, `title` TEXT, `smallSizeLink` TEXT, `regularSizeLink` TEXT, `rawLink` TEXT, `fullSizeLink` TEXT, `author` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Category` (`name` TEXT, `image` TEXT, `query` TEXT, `isSelected` INTEGER, PRIMARY KEY (`name`))');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  GalleryDao get galleryDao {
    return _galleryDaoInstance ??= _$GalleryDao(database, changeListener);
  }

  @override
  CategoryDao get categoryDao {
    return _categoryDaoInstance ??= _$CategoryDao(database, changeListener);
  }
}

class _$GalleryDao extends GalleryDao {
  _$GalleryDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _galleryEntityInsertionAdapter = InsertionAdapter(
            database,
            'Gallery',
            (GalleryEntity item) => <String, dynamic>{
                  'id': item.id,
                  'title': item.title,
                  'smallSizeLink': item.smallSizeLink,
                  'regularSizeLink': item.regularSizeLink,
                  'rawLink': item.rawLink,
                  'fullSizeLink': item.fullSizeLink,
                  'author': item.author
                },
            changeListener),
        _galleryEntityDeletionAdapter = DeletionAdapter(
            database,
            'Gallery',
            ['id'],
            (GalleryEntity item) => <String, dynamic>{
                  'id': item.id,
                  'title': item.title,
                  'smallSizeLink': item.smallSizeLink,
                  'regularSizeLink': item.regularSizeLink,
                  'rawLink': item.rawLink,
                  'fullSizeLink': item.fullSizeLink,
                  'author': item.author
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _galleryMapper = (Map<String, dynamic> row) => GalleryEntity(
      row['id'] as String,
      row['title'] as String,
      row['smallSizeLink'] as String,
      row['regularSizeLink'] as String,
      row['rawLink'] as String,
      row['fullSizeLink'] as String,
      row['author'] as String);

  final InsertionAdapter<GalleryEntity> _galleryEntityInsertionAdapter;

  final DeletionAdapter<GalleryEntity> _galleryEntityDeletionAdapter;

  @override
  Stream<List<GalleryEntity>> observeAll() {
    return _queryAdapter.queryListStream('SELECT * FROM Gallery',
        tableName: 'Gallery', mapper: _galleryMapper);
  }

  @override
  Stream<List<GalleryEntity>> observeById(String id) {
    return _queryAdapter.queryListStream('SELECT * FROM Gallery WHERE id = ?',
        arguments: <dynamic>[id], tableName: 'Gallery', mapper: _galleryMapper);
  }

  @override
  Future<void> insertEntity(GalleryEntity entity) async {
    await _galleryEntityInsertionAdapter.insert(
        entity, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> insertEntities(List<GalleryEntity> entity) async {
    await _galleryEntityInsertionAdapter.insertList(
        entity, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> deleteEntity(GalleryEntity entity) async {
    await _galleryEntityDeletionAdapter.delete(entity);
  }
}

class _$CategoryDao extends CategoryDao {
  _$CategoryDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _categoryEntityInsertionAdapter = InsertionAdapter(
            database,
            'Category',
            (CategoryEntity item) => <String, dynamic>{
                  'name': item.name,
                  'image': item.image,
                  'query': item.query,
                  'isSelected': item.isSelected ? 1 : 0
                },
            changeListener),
        _categoryEntityUpdateAdapter = UpdateAdapter(
            database,
            'Category',
            ['name'],
            (CategoryEntity item) => <String, dynamic>{
                  'name': item.name,
                  'image': item.image,
                  'query': item.query,
                  'isSelected': item.isSelected ? 1 : 0
                },
            changeListener),
        _categoryEntityDeletionAdapter = DeletionAdapter(
            database,
            'Category',
            ['name'],
            (CategoryEntity item) => <String, dynamic>{
                  'name': item.name,
                  'image': item.image,
                  'query': item.query,
                  'isSelected': item.isSelected ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _categoryMapper = (Map<String, dynamic> row) => CategoryEntity(
      row['name'] as String,
      row['image'] as String,
      row['query'] as String,
      (row['isSelected'] as int) != 0);

  final InsertionAdapter<CategoryEntity> _categoryEntityInsertionAdapter;

  final UpdateAdapter<CategoryEntity> _categoryEntityUpdateAdapter;

  final DeletionAdapter<CategoryEntity> _categoryEntityDeletionAdapter;

  @override
  Stream<List<CategoryEntity>> observeAll() {
    return _queryAdapter.queryListStream('SELECT * FROM Category ORDER BY name',
        tableName: 'Category', mapper: _categoryMapper);
  }

  @override
  Stream<List<CategoryEntity>> observeById(String id) {
    return _queryAdapter.queryListStream('SELECT * FROM Category WHERE id = ?',
        arguments: <dynamic>[id],
        tableName: 'Category',
        mapper: _categoryMapper);
  }

  @override
  Future<void> insertEntity(CategoryEntity entity) async {
    await _categoryEntityInsertionAdapter.insert(
        entity, sqflite.ConflictAlgorithm.ignore);
  }

  @override
  Future<void> insertEntities(List<CategoryEntity> entity) async {
    await _categoryEntityInsertionAdapter.insertList(
        entity, sqflite.ConflictAlgorithm.ignore);
  }

  @override
  Future<void> updateEntity(CategoryEntity entity) async {
    await _categoryEntityUpdateAdapter.update(
        entity, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> deleteEntity(CategoryEntity entity) async {
    await _categoryEntityDeletionAdapter.delete(entity);
  }
}
