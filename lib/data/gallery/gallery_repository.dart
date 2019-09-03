import 'package:pictury/data/gallery/models/section.dart';
import 'package:pictury/data/source/remote/models/image_response.dart';

import '../source/remote/api.dart';
import 'models/sort.dart';

class GalleryRepository {
  final Api _api;

  GalleryRepository(this._api);

  Future<List<ImageResponse>> loadGallery(Section section, int page) {
    return _api.loadGallery(section, Sort.VIRAL, page);
  }
}
