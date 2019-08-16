import 'package:imgur_gallery/core/ui/base_view_model.dart';
import 'package:imgur_gallery/data/gallery/gallery_repository.dart';
import 'package:imgur_gallery/data/source/remote/models/image_response.dart';

class GalleryViewModel extends BaseViewModel {
  final GalleryRepository _galleryRepository;

  ImageResponse gallery;

  Future loadGallery() async {
    gallery = await _galleryRepository.loadGallery();
    notifyListeners();
  }

  GalleryViewModel(this._galleryRepository);
}
