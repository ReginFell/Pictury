import 'package:pictury/data/gallery/models/gallery_entity.dart';

import 'package:meta/meta.dart';

part 'gallery_details_event.g.dart';

@sealed
class GalleryDetailsEvent with SealedGalleryDetailsEvent {}

class MakeFavoriteEvent extends GalleryDetailsEvent {}

class GalleryUpdatedEvent extends GalleryDetailsEvent {
  final GalleryEntity galleryEntity;

  GalleryUpdatedEvent(this.galleryEntity);
}
