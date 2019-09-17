import 'package:pictury/data/gallery/models/gallery_entity.dart';

class GalleryDetailsEvent {}

class MakeFavoriteEvent extends GalleryDetailsEvent {}

class GalleryUpdatedEvent extends GalleryDetailsEvent {
  final GalleryEntity galleryEntity;

  GalleryUpdatedEvent(this.galleryEntity);
}
