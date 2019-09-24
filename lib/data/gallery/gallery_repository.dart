import 'package:pictury/data/api/models/image_response.dart';
import 'package:pictury/data/gallery/gallery_dao.dart';
import 'package:pictury/data/gallery/models/gallery_entity.dart';

import '../api/api.dart';

class GalleryRepository {
  final Api _api;
  final Future<GalleryDao> _galleryDao;

  GalleryRepository(this._api, this._galleryDao);

  Future<List<GalleryEntity>> loadGallery(String query, int page) async {
    final List<ImageResponse> result = await _api.loadByQuery(query, page);

    return result
        .map((imageResponse) => GalleryEntity(
              imageResponse.id,
              imageResponse.description,
              imageResponse.urls.small,
              imageResponse.urls.regular,
              imageResponse.urls.raw,
              imageResponse.urls.full,
            ))
        .toList();
  }

  Future<void> addFavorite(GalleryEntity galleryEntity) async {
    final GalleryDao dao = await _galleryDao;

    dao.insertEntity(galleryEntity);
  }

  Future<void> removeFavorite(GalleryEntity galleryEntity) async {
    final GalleryDao dao = await _galleryDao;

    dao.deleteEntity(galleryEntity);
  }

  Stream<List<GalleryEntity>> observeFavorites() async* {
    final GalleryDao dao = await _galleryDao;

    yield* dao.observeAll();
  }

  Stream<GalleryEntity> observeById(String id) async* {
    final GalleryDao dao = await _galleryDao;

    yield* dao.observeById(id).map((result) {
      if (result.isNotEmpty) {
        return result.first;
      } else {
        return null;
      }
    });
  }
}
