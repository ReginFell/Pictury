import '../source/remote/api.dart';

class GalleryRepository {
  final Api _api;

  GalleryRepository(this._api);

  List<String> loadGallery() {
    _api.loadGallery();
  }
}
