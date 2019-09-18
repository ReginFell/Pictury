// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_event.dart';

// **************************************************************************
// SealedClassGenerator
// **************************************************************************

class SealedGalleryEvent {
  R when<R>({
    @required R Function(LoadNextPageEvent) loadNextPageEvent,
    @required R Function(PageLoadedEvent) pageLoadedEvent,
  }) {
    if (this is LoadNextPageEvent) {
      return loadNextPageEvent(this as LoadNextPageEvent);
    }
    if (this is PageLoadedEvent) {
      return pageLoadedEvent(this as PageLoadedEvent);
    }
    throw new Exception(
        'If you got here, probably you forgot to regenerate the classes? Try running flutter packages pub run build_runner build');
  }
}
