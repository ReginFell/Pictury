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
            'CREATE TABLE IF NOT EXISTS `Gallery` (`id` TEXT, `title` TEXT, `link` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  GalleryDao get galleryDao {
    return _galleryDaoInstance ??= _$GalleryDao(database, changeListener);
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
                  'link': item.link
                },
            changeListener),
        _galleryEntityDeletionAdapter = DeletionAdapter(
            database,
            'Gallery',
            ['id'],
            (GalleryEntity item) => <String, dynamic>{
                  'id': item.id,
                  'title': item.title,
                  'link': item.link
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _galleryMapper = (Map<String, dynamic> row) => GalleryEntity(
      row['id'] as String, row['title'] as String, row['link'] as String);

  final InsertionAdapter<GalleryEntity> _galleryEntityInsertionAdapter;

  final DeletionAdapter<GalleryEntity> _galleryEntityDeletionAdapter;

  @override
  Stream<List<GalleryEntity>> observeAll() {
    return _queryAdapter.queryListStream('SELECT * FROM Gallery',
        tableName: 'Gallery', mapper: _galleryMapper);
  }

  @override
  Stream<GalleryEntity> observeById(String id) {
    return _queryAdapter.queryStream('SELECT * FROM Gallery WHERE id = ?',
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
