// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_details_event.dart';

// **************************************************************************
// SealedClassGenerator
// **************************************************************************

class SealedGalleryDetailsEvent {
  R when<R>({
    @required R Function(MakeFavoriteEvent) makeFavoriteEvent,
    @required R Function(GalleryUpdatedEvent) galleryUpdatedEvent,
  }) {
    if (this is MakeFavoriteEvent) {
      return makeFavoriteEvent(this as MakeFavoriteEvent);
    }
    if (this is GalleryUpdatedEvent) {
      return galleryUpdatedEvent(this as GalleryUpdatedEvent);
    }
    throw new Exception(
        'If you got here, probably you forgot to regenerate the classes? Try running flutter packages pub run build_runner build');
  }
}
