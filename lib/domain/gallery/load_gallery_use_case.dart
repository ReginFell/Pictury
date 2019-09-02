import 'package:imgur_gallery/data/gallery/gallery_repository.dart';
import 'package:imgur_gallery/data/gallery/models/section.dart';
import 'package:imgur_gallery/data/source/remote/models/image_response.dart';

import '../../environment.dart';
import 'models/picture.dart';

class LoadGalleryUseCase {
  final GalleryRepository _galleryRepository;

  LoadGalleryUseCase(this._galleryRepository);

  Future<List<Picture>> loadGallery(Section section, int page) async {
    final ImageResponse response =
        await _galleryRepository.loadGallery(section, page);

    return response.data
        .where((value) => value.images != null)
        .where((value) => value.images.first.link
            .contains(RegExp(environment.supportedTypes.join("|"))))
        .map((value) => Picture(value.title, value.images.first.link))
        .toList();
  }
}
