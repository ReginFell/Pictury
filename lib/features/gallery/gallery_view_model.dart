import 'package:imgur_gallery/core/ui/base_view_model.dart';
import 'package:imgur_gallery/data/gallery/models/section.dart';
import 'package:imgur_gallery/domain/gallery/load_gallery_use_case.dart';
import 'package:imgur_gallery/domain/gallery/models/image.dart';

class GalleryViewModel extends BaseViewModel {
  final LoadGalleryUseCase _loadGalleryUseCase;

  List<Image> gallery;

  GalleryViewModel(this._loadGalleryUseCase);

  Future loadGallery(Section section) async {
    gallery = await _loadGalleryUseCase.loadGallery(section, 0);
    notifyListeners();
  }
}
