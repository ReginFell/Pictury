import 'dart:async';

import 'package:imgur_gallery/data/gallery/gallery_repository.dart';
import 'package:imgur_gallery/data/gallery/models/section.dart';

import 'models/picture.dart';

class LoadGalleryUseCase {
  final GalleryRepository _galleryRepository;

  LoadGalleryUseCase(this._galleryRepository);

  FutureOr<List<Picture>> loadGallery(Section section, int page) async {
    return (await _galleryRepository.loadGallery(section, page))
        .map((value) => Picture(value.description, value.urls.regular))
        .toList();
  }
}
