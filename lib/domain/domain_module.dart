import 'package:pictury/data/client/access_key_client.dart';
import 'package:pictury/data/gallery/gallery_repository.dart';
import 'package:pictury/domain/gallery/load_gallery_use_case.dart';
import 'package:pictury/environment.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> independentServices = [];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<GalleryRepository, LoadGalleryUseCase>(
    builder: (context, galleryRepository, api) =>
        LoadGalleryUseCase(galleryRepository),
  ),
];
