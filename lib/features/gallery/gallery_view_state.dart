import 'package:flutter/foundation.dart';
import 'package:imgur_gallery/domain/gallery/models/image.dart';

class GalleryViewState {
  final List<Image> images;
  final bool isLoading;
  final Exception hasError;

  GalleryViewState(
      {@required this.images, @required this.isLoading, this.hasError});

  static GalleryViewState createDefault() => GalleryViewState(
        images: List(),
        isLoading: false,
        hasError: null,
      );

  GalleryViewState copy(
      {List<Image> images, bool isLoading, Exception hasError}) {
    return GalleryViewState(
      images: images ?? this.images,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
