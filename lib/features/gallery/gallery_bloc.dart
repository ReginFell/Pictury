import 'package:pictury/core/ui/base/base_bloc.dart';
import 'package:pictury/data/gallery/gallery_repository.dart';
import 'package:pictury/data/gallery/models/gallery_entity.dart';
import 'package:pictury/domain/gallery/models/picture.dart';
import 'package:pictury/features/gallery/gallery_event.dart';
import 'package:pictury/features/gallery/gallery_view_state.dart';

class GalleryBloc extends BaseBloc<GalleryViewState, GalleryEvent> {
  final GalleryRepository _galleryRepository;

  int _currentPagePosition = 1;

  GalleryBloc(this._galleryRepository) {
    _galleryRepository.observeGallery("", 0).listen((result) {
      dispatch(PageLoadedEvent(result));
    });
  }

  @override
  GalleryViewState get initialState => GalleryViewState.createDefault();

  @override
  Stream<GalleryViewState> mapEventToState(event) async* {
    if (event is LoadNextPageEvent) {
      yield* _loadNextPage(event.query);
    } else if (event is PageLoadedEvent) {
      yield* _onPageLoaded(event.entities);
    }
  }

  Stream<GalleryViewState> _loadNextPage(String query) async* {
    if (query.isNotEmpty) {
      yield currentState.copy(isLoading: true);

      await _galleryRepository.loadGallery(query, _currentPagePosition++);

      yield currentState.copy(isLoading: false);
    }
  }

  Stream<GalleryViewState> _onPageLoaded(List<GalleryEntity> entities) async* {
    yield currentState.copy(
        pictures: entities
            .map((entity) => Picture(entity.title, entity.link))
            .toList());
  }
}
