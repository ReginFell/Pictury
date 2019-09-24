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

  GalleryBloc(this._galleryType, this._galleryRepository) {
    if (_galleryType is FavoriteGalleryType) {
      subscriptions.add(
        _galleryRepository
            .observeFavorites()
            .listen((entities) => dispatch(PageLoadedEvent(entities))),
      );
    }
  }

  @override
  GalleryViewState get initialState => GalleryViewState.createDefault();

  @override
  Stream<GalleryViewState> mapEventToState(event) async* {
    yield* event.when(
      loadNextPageEvent: _loadGallery,
      pageLoadedEvent: _loadGalleryLocally,
    );
  }

  Stream<GalleryViewState> _loadGallery(LoadNextPageEvent event) async* {
    final GalleryType type = _galleryType;
    if (type is RemoteGalleryType) {
      if (type.query.isNotEmpty) {
        yield currentState.rebuild((b) => b..isLoading = true);

        List<GalleryEntity> result = await _galleryRepository.loadGallery(
            type.query, _currentPagePosition++);

        yield currentState.rebuild((b) => b
          ..isLoading = false
          ..pictures = [
            ...currentState.pictures,
            ...result.map((value) => value.asViewModel()).toList(),
          ]);
      }
    }
  }

  Stream<GalleryViewState> _loadGalleryLocally(PageLoadedEvent event) async* {
    yield currentState.rebuild(
      (b) => b
        ..isLoading = false
        ..pictures =
            event.entities.map((value) => value.asViewModel()).toList(),
    );
  }
}
