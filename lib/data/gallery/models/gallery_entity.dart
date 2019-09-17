import 'package:floor/floor.dart';
import 'package:pictury/domain/gallery/models/gallery_view_model.dart';

@Entity(tableName: "Gallery")
class GalleryEntity {

  @primaryKey
  final String id;

  final String title;
  final String link;

  GalleryEntity(this.id, this.title, this.link);

  GalleryViewModel asViewModel() =>
      GalleryViewModel(this.id, this.title, this.link);
}
