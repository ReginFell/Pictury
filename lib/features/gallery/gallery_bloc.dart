import 'package:flutter/material.dart';
import 'package:pictury/core/ui/base/base_bloc.dart';
import 'package:pictury/domain/gallery/load_gallery_use_case.dart';
import 'package:pictury/domain/gallery/models/picture.dart';
import 'package:pictury/features/gallery/gallery_event.dart';
import 'package:pictury/features/gallery/gallery_view_state.dart';
import 'package:pictury/features/gallery_details/gallery_details_screen.dart';

class GalleryBloc extends BaseBloc<GalleryViewState, GalleryEvent> {
  final LoadGalleryUseCase _loadGalleryUseCase;

  int _currentPagePosition = 1;

  GalleryBloc(this._loadGalleryUseCase);

  Stream<GalleryViewState> _loadGallery(String query) async* {
    yield currentState.copy(isLoading: true);

    final List<Picture> result =
        await _loadGalleryUseCase.loadGallery(query, _currentPagePosition++);

    yield currentState.copy(
      isLoading: false,
      pictures: currentState.pictures + result,
    );
  }

  void onImageClick(BuildContext context, Picture picture) {
    Navigator.pushNamed(
      context,
      GalleryDetailsScreen.route,
      arguments: GalleryDetailsArguments(picture),
    );
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
