import 'package:pictury/data/source/remote/models/image_response.dart';

import '../source/remote/api.dart';

class GalleryRepository {
  final Api _api;

  GalleryRepository(this._api);

  Future<List<ImageResponse>> loadGallery(int page) {
    return _api.loadGallery(page);
  }
}
