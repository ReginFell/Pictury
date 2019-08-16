import 'package:imgur_gallery/data/client/imgur_client.dart';
import 'package:imgur_gallery/data/gallery/gallery_repository.dart';
import 'package:imgur_gallery/domain/gallery/load_gallery_use_case.dart';
import 'package:imgur_gallery/environment.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> independentServices = [];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<GalleryRepository, LoadGalleryUseCase>(
    builder: (context, galleryRepository, api) =>
        LoadGalleryUseCase(galleryRepository),
  ),
];
