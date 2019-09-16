import 'package:pictury/data/gallery/gallery_dao.dart';
import 'package:pictury/data/gallery/models/gallery_entity.dart';
import 'package:pictury/data/source/remote/models/image_response.dart';

import '../source/remote/api.dart';

class GalleryRepository {
  final Api _api;
  final Future<GalleryDao> _galleryDao;

  GalleryRepository(this._api, this._galleryDao);

  Future loadGallery(String query, int page) async {
    final GalleryDao dao = await _galleryDao;

    final List<ImageResponse> result = await _api.loadByQuery(query, page);
    try {
      return dao.insertEntities(result
          .map((value) =>
              GalleryEntity(value.id, value.description, value.urls.full))
          .toList());
    } catch (e) {
      print(e);
    }
  }

  Stream<List<GalleryEntity>> observeGallery(String query, int page) async* {
    final GalleryDao dao = await _galleryDao;

    yield* dao.observeAll();
  }
}
