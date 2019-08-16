import 'package:imgur_gallery/data/gallery/gallery_repository.dart';
import 'package:imgur_gallery/data/source/remote/models/image_response.dart';
import 'package:imgur_gallery/domain/gallery/models/image.dart';

class LoadGalleryUseCase {
  final GalleryRepository _galleryRepository;

  LoadGalleryUseCase(this._galleryRepository);

  Future<List<Image>> loadGallery(String section, int page) async {
    final ImageResponse response =
        await _galleryRepository.loadGallery(section, page);

    return response.data
        .map((value) => Image(value.title, value.images.first.link));
  }
}
