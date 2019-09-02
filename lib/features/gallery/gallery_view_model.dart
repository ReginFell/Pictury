import 'package:flutter/material.dart';
import 'package:unsplash_gallery/core/ui/base/base_view_model.dart';
import 'package:unsplash_gallery/data/gallery/models/section.dart';
import 'package:unsplash_gallery/domain/gallery/load_gallery_use_case.dart';
import 'package:unsplash_gallery/domain/gallery/models/picture.dart';
import 'package:unsplash_gallery/features/gallery/gallery_view_state.dart';
import 'package:unsplash_gallery/features/gallery_details/gallery_details_screen.dart';

class GalleryViewModel extends BaseViewModel<GalleryViewState> {
  final LoadGalleryUseCase _loadGalleryUseCase;

  int page = 1;

  GalleryViewModel(this._loadGalleryUseCase);

  Future loadGallery(Section section) async {
    mutateViewState((viewState) => viewState.copy(isLoading: true));

    final List<Picture> result =
        await _loadGalleryUseCase.loadGallery(section, page++);

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
