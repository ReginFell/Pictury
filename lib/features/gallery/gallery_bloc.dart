import 'package:pictury/core/ui/base/base_bloc.dart';
import 'package:pictury/data/gallery/gallery_repository.dart';
import 'package:pictury/data/gallery/models/gallery_entity.dart';
import 'package:pictury/domain/gallery/models/gallery_view_model.dart';
import 'package:pictury/features/gallery/gallery_event.dart';
import 'package:pictury/features/gallery/gallery_view_state.dart';

class GalleryBloc extends BaseBloc<GalleryViewState, GalleryEvent> {
  final GalleryRepository _galleryRepository;

  int _currentPagePosition = 1;

  GalleryBloc(this._galleryRepository);

  Stream<GalleryViewState> _loadGallery(String query) async* {
    if (query.isNotEmpty) {
      yield currentState.rebuild((b) => b..isLoading = true);

      final List<GalleryEntity> result =
          await _galleryRepository.loadGallery(query, _currentPagePosition++);

      yield currentState.rebuild((b) => b
        ..isLoading = false
        ..pictures = [
          ...currentState.pictures,
          ...result
              .map((value) => GalleryViewModel(value.title, value.link))
              .toList(),
        ]);
    }
  }

  @override
  GalleryViewState get initialState => GalleryViewState.createDefault();

  @override
  Stream<GalleryViewState> mapEventToState(event) async* {
    if (event is LoadNextPageEvent) {
      yield* _loadGallery(event.query);
    }
  }
}
