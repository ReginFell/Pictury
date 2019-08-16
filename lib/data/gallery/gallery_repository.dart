import 'package:imgur_gallery/data/source/remote/models/image_response.dart';

import '../source/remote/api.dart';

class GalleryRepository {
  final Api _api;

  GalleryRepository(this._api);

  Future<ImageResponse> loadGallery(String section, int page) {
    return _api.loadGallery(section, page);
  }
}
