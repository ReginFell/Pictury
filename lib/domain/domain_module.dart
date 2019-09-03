import 'package:pictury/data/gallery/gallery_repository.dart';
import 'package:pictury/data/remote_config/remote_config_repository.dart';
import 'package:pictury/domain/categories/load_categories_use_case.dart';
import 'package:pictury/domain/gallery/load_gallery_use_case.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> independentServices = [];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<GalleryRepository, LoadGalleryUseCase>(
    builder: (context, galleryRepository, api) =>
        LoadGalleryUseCase(galleryRepository),
  ),
  ProxyProvider<RemoteConfigRepository, LoadCategoriesUseCase>(
    builder: (context, remoteConfigRepository, loadCategoriesUseCase) =>
        LoadCategoriesUseCase(remoteConfigRepository),
  ),
];
