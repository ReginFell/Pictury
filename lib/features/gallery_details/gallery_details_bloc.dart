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
    _galleryRepository
        .observeById(_galleryViewModel.id)
        .listen((entity) => dispatch(GalleryUpdatedEvent(entity)));
  }

  @override
  get initialState => GalleryDetailsViewState.createDefault();

  @override
  Stream<GalleryDetailsViewState> mapEventToState(
      GalleryDetailsEvent event) async* {
    if (event is MakeFavoriteEvent) {
      _makeFavorite();
    } else if (event is GalleryUpdatedEvent) {
      yield* _onGalleryUpdated(event.galleryEntity);
    }
  }

  Stream<GalleryDetailsViewState> _onGalleryUpdated(
      GalleryEntity galleryEntity) async* {
    yield currentState.rebuild((b) => b.isFavorite = galleryEntity != null);
  }

  void _makeFavorite() async {
    if (currentState.isFavorite) {
      await _galleryRepository.removeFavorite(_galleryViewModel.asEntity());
    } else {
      await _galleryRepository.addFavorite(_galleryViewModel.asEntity());
    }
  }
}
