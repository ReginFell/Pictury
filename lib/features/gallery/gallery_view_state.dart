import 'package:flutter/foundation.dart';
import 'package:pictury/domain/gallery/models/picture.dart';

class GalleryViewState {
  final List<Picture> pictures;
  final bool isLoading;
  final Exception hasError;

  GalleryViewState(
      {@required this.pictures, @required this.isLoading, this.hasError});

  static GalleryViewState createDefault() => GalleryViewState(
        pictures: List(),
        isLoading: false,
        hasError: null,
      );

  GalleryViewState copy(
      {List<Picture> pictures, bool isLoading, Exception hasError}) {
    return GalleryViewState(
      pictures: pictures ?? this.pictures,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  String toString() {
    return 'GalleryViewState{pictures: $pictures, isLoading: $isLoading, hasError: $hasError}';
  }
}
