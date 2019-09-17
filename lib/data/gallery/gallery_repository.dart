import 'package:pictury/data/gallery/gallery_dao.dart';
import 'package:pictury/data/gallery/models/gallery_entity.dart';
import 'package:pictury/data/source/remote/models/image_response.dart';

import '../source/remote/api.dart';

class GalleryRepository {
  final Api _api;
  final Future<GalleryDao> _galleryDao;

  GalleryRepository(this._api, this._galleryDao);

  Future<List<GalleryEntity>> loadGallery(String query, int page) async {
    final List<ImageResponse> result = await _api.loadByQuery(query, page);

    return result
        .map((imageResponse) => GalleryEntity(imageResponse.id,
            imageResponse.description, imageResponse.urls.regular))
        .toList();
  }

  Future<void> addToFavorite(GalleryEntity galleryEntity) async {
    final GalleryDao dao = await _galleryDao;

    dao.insertEntity(galleryEntity);
  }

  Stream<List<GalleryEntity>> observeFavorites() async* {
    final GalleryDao dao = await _galleryDao;

    yield* dao.observeAll();
  }

  Stream<GalleryEntity> observeById(String id) async* {
    final GalleryDao dao = await _galleryDao;

    yield* dao.observeById(id);
  }
}
