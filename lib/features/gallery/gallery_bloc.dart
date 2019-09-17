import 'package:pictury/core/ui/base/base_bloc.dart';
import 'package:pictury/data/gallery/gallery_repository.dart';
import 'package:pictury/data/gallery/models/gallery_entity.dart';
import 'package:pictury/domain/gallery/models/gallery_view_model.dart';
import 'package:pictury/features/gallery/gallery_event.dart';
import 'package:pictury/features/gallery/gallery_view_state.dart';

import 'gallery_type.dart';

class GalleryBloc extends BaseBloc<GalleryViewState, GalleryEvent> {
  final GalleryType _galleryType;
  final GalleryRepository _galleryRepository;

  int _currentPagePosition = 1;

  GalleryBloc(this._galleryType, this._galleryRepository);

  Stream<GalleryViewState> _loadGallery() async* {
    final GalleryType type = _galleryType;
    List<GalleryEntity> result;

    if (type is RemoteGalleryType) {
      if (type.query.isNotEmpty) {
        yield currentState.rebuild((b) => b..isLoading = true);

        result = await _galleryRepository.loadGallery(
            type.query, _currentPagePosition++);
      }
    } else if (_galleryType is FavoriteGalleryType) {
      result = await _galleryRepository.observeFavorites().first;
    }

    yield currentState.rebuild((b) => b
      ..isLoading = false
      ..pictures = [
        ...currentState.pictures,
        ...result
            .map((value) => GalleryViewModel(value.id, value.title, value.link))
            .toList(),
      ]);
  }

  @override
  GalleryViewState get initialState => GalleryViewState.createDefault();

  @override
  Stream<GalleryViewState> mapEventToState(event) async* {
    if (event is LoadNextPageEvent) {
      yield* _loadGallery();
    }
  }
}
