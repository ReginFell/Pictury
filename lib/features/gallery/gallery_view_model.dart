import 'package:flutter/material.dart';
import 'package:pictury/core/ui/base/base_view_model.dart';
import 'package:pictury/domain/gallery/load_gallery_use_case.dart';
import 'package:pictury/domain/gallery/models/picture.dart';
import 'package:pictury/features/gallery/gallery_view_state.dart';
import 'package:pictury/features/gallery_details/gallery_details_screen.dart';

class GalleryViewModel extends BaseViewModel<GalleryViewState> {
  final LoadGalleryUseCase _loadGalleryUseCase;

  int _currentPagePosition = 1;

  GalleryViewModel(this._loadGalleryUseCase);

  Future loadGallery(String query) async {
    mutateViewState((viewState) => viewState.copy(isLoading: true));

    final List<Picture> result =
        await _loadGalleryUseCase.loadGallery(query, _currentPagePosition++);

    mutateViewState((viewState) => viewState.copy(
          isLoading: false,
          pictures: viewState.pictures + result,
        ));
  }

  void onImageClick(BuildContext context, Picture picture) {
    Navigator.pushNamed(
      context,
      GalleryDetailsScreen.route,
      arguments: GalleryDetailsArguments(picture),
    );
  }

  @override
  GalleryViewState initialViewState() => GalleryViewState.createDefault();
}
