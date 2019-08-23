import 'package:imgur_gallery/core/ui/base/base_view_model.dart';
import 'package:imgur_gallery/data/gallery/models/section.dart';
import 'package:imgur_gallery/domain/gallery/load_gallery_use_case.dart';
import 'package:imgur_gallery/domain/gallery/models/image.dart';
import 'package:imgur_gallery/features/gallery/gallery_view_state.dart';

class GalleryViewModel extends BaseViewModel<GalleryViewState> {
  final LoadGalleryUseCase _loadGalleryUseCase;

  int page = 0;

  GalleryViewModel(this._loadGalleryUseCase);

  Future loadGallery(Section section) async {
    mutateViewState((viewState) => viewState.copy(isLoading: true));

    final List<Image> result =
        await _loadGalleryUseCase.loadGallery(section, page++);

    mutateViewState((viewState) =>
        viewState.copy(isLoading: false, images: viewState.images + result));
  }

  @override
  GalleryViewState initialViewState() => GalleryViewState.createDefault();
}
