import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pictury/core/ui/base/base_bloc.dart';
import 'package:pictury/data/gallery/gallery_repository.dart';
import 'package:pictury/domain/gallery/models/gallery_view_model.dart';
import 'package:pictury/features/gallery_details/gallery_details_event.dart';
import 'package:wallpaper_changer/wallpaper_changer.dart';
import 'package:http/http.dart' as http;

import 'gallery_details_view_state.dart';

class GalleryDetailsBloc
    extends BaseBloc<GalleryDetailsViewState, GalleryDetailsEvent> {
  static const String tempFileName = 'temp.png';

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
      setWallpaperEvent: _setAsWallpaper,
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

  Stream<GalleryDetailsViewState> _setAsWallpaper(
      SetWallpaperEvent event) async* {
    yield currentState.rebuild((b) => b..isLoading = true);
    final File file = await _loadImage(event.galleryViewModel.regularSizeLink);
    await WallpaperChanger.setWallpaper(file, event.screen);
    yield currentState.rebuild((b) => b..isLoading = false);
  }

  static Future<File> _loadImage(String url) async {
    final folder = await getTemporaryDirectory();
    var fileSave = File('${folder.path}/$tempFileName');
    final response = await http.get(url);
    await fileSave.writeAsBytes(response.bodyBytes);
    return fileSave;
  }
}
