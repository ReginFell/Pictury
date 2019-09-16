import 'package:floor/floor.dart';

@Entity(tableName: "Gallery")
class GalleryEntity {
  @primaryKey
  final String id;

  final String title;
  final String link;

  GalleryEntity(this.id, this.title, this.link);
}
