import 'package:imgur_gallery/core/ui/base/base_view_model.dart';
import 'package:imgur_gallery/data/gallery/models/section.dart';
import 'package:imgur_gallery/domain/gallery/load_gallery_use_case.dart';
import 'package:imgur_gallery/domain/gallery/models/image.dart';

class GalleryViewModel extends BaseViewModel {
  final LoadGalleryUseCase _loadGalleryUseCase;

  int page = 0;

  List<Image> gallery = new List();

  GalleryViewModel(this._loadGalleryUseCase);

  Future loadGallery(Section section) async {
    final List<Image> result =
        await _loadGalleryUseCase.loadGallery(section, page++);
    gallery.addAll(result);
    notifyListeners();
  }
}
