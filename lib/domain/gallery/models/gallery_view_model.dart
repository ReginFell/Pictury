import 'package:pictury/data/gallery/models/gallery_entity.dart';

class GalleryViewModel {
  final String id;
  final String title;
  final String link;

  GalleryViewModel(this.id, this.title, this.link);

  GalleryEntity asEntity() => GalleryEntity(this.id, this.title, this.link);
}
