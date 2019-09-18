import 'package:meta/meta.dart';
import 'package:pictury/data/gallery/models/gallery_entity.dart';

part 'gallery_event.g.dart';

@sealed
abstract class GalleryEvent with SealedGalleryEvent {}

class LoadNextPageEvent extends GalleryEvent {}

class PageLoadedEvent extends GalleryEvent {
  final List<GalleryEntity> entities;

  PageLoadedEvent(this.entities);
}
