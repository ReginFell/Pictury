import 'package:flutter/cupertino.dart';
import 'package:pictury/data/gallery/models/gallery_entity.dart';

class GalleryViewModel {
  final String id;
  final String title;
  final String smallSizeLink;
  final String regularSizeLink;
  final String rawLink;
  final String fullSizeLink;
  final String author;

  GalleryViewModel({
    @required this.id,
    @required this.title,
    @required this.smallSizeLink,
    @required this.regularSizeLink,
    @required this.rawLink,
    @required this.fullSizeLink,
    @required this.author,
  });

  GalleryEntity asEntity() => GalleryEntity(
        this.id,
        this.title,
        this.smallSizeLink,
        this.regularSizeLink,
        this.rawLink,
        this.fullSizeLink,
        this.author,
      );
}
