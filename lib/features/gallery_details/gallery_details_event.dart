import 'package:pictury/data/gallery/models/gallery_entity.dart';

import 'package:meta/meta.dart';
import 'package:pictury/domain/gallery/models/gallery_view_model.dart';
import 'package:wallpaper_changer/wallpaper_changer.dart';

part 'gallery_details_event.g.dart';

@sealed
class GalleryDetailsEvent with SealedGalleryDetailsEvent {}

class MakeFavoriteEvent extends GalleryDetailsEvent {}

class GalleryUpdatedEvent extends GalleryDetailsEvent {
  final GalleryEntity galleryEntity;

  GalleryUpdatedEvent(this.galleryEntity);
}

class SetWallpaperEvent extends GalleryDetailsEvent {
  final GalleryViewModel galleryViewModel;
  final Screen screen;

  SetWallpaperEvent(this.galleryViewModel, this.screen);
}
