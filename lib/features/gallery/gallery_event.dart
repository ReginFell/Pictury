import 'package:pictury/data/gallery/models/gallery_entity.dart';

abstract class GalleryEvent {}

class LoadNextPageEvent extends GalleryEvent {
  final String query;

  LoadNextPageEvent(this.query);
}

class PageLoadedEvent extends GalleryEvent {
  final List<GalleryEntity> entities;

  PageLoadedEvent(this.entities);
}
