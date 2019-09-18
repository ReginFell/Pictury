import 'package:pictury/core/ui/base/base_bloc.dart';
import 'package:pictury/data/gallery/gallery_repository.dart';
import 'package:pictury/data/gallery/models/gallery_entity.dart';
import 'package:pictury/domain/gallery/models/gallery_view_model.dart';
import 'package:pictury/features/gallery_details/gallery_details_event.dart';

import 'gallery_details_view_state.dart';

class GalleryDetailsBloc
    extends BaseBloc<GalleryDetailsViewState, GalleryDetailsEvent> {
  final GalleryRepository _galleryRepository;

  final GalleryViewModel _galleryViewModel;

  GalleryDetailsBloc(this._galleryViewModel, this._galleryRepository) {
    subscriptions.add(
      _galleryRepository
          .observeById(_galleryViewModel.id)
          .listen((entity) => dispatch(GalleryUpdatedEvent(entity))),
    );
  }

  @override
  get initialState => GalleryDetailsViewState.createDefault();

  @override
  Stream<GalleryDetailsViewState> mapEventToState(
      GalleryDetailsEvent event) async* {
    yield* event.when(
      makeFavoriteEvent: _makeFavorite,
      galleryUpdatedEvent: _onGalleryUpdated,
    );
  }

  Stream<GalleryDetailsViewState> _onGalleryUpdated(
      GalleryUpdatedEvent event) async* {
    yield currentState
        .rebuild((b) => b.isFavorite = event.galleryEntity != null);
  }

  Stream<GalleryDetailsViewState> _makeFavorite(
      MakeFavoriteEvent event) async* {
    if (currentState.isFavorite) {
      await _galleryRepository.removeFavorite(_galleryViewModel.asEntity());
    } else {
      await _galleryRepository.addFavorite(_galleryViewModel.asEntity());
    }
  }
}
