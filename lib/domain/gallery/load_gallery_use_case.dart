import 'dart:async';

import 'package:pictury/data/gallery/gallery_repository.dart';

import 'models/picture.dart';

class LoadGalleryUseCase {
  final GalleryRepository _galleryRepository;

  LoadGalleryUseCase(this._galleryRepository);

  FutureOr<List<Picture>> loadGallery(int page) async {
    return (await _galleryRepository.loadGallery(page))
        .map((value) => Picture(value.description, value.urls.regular))
        .toList();
  }
}
