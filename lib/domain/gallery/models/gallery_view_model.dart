import 'package:flutter/cupertino.dart';
import 'package:pictury/data/gallery/models/gallery_entity.dart';

class GalleryViewModel {
  final String id;
  final String title;
  final String smallSizeLink;
  final String regularSizeLink;
  final String rawLink;
  final String fullSizeLink;

  GalleryViewModel({
    @required this.id,
    @required this.title,
    @required this.smallSizeLink,
    @required this.regularSizeLink,
    @required this.rawLink,
    @required this.fullSizeLink,
  });

  GalleryEntity asEntity() => GalleryEntity(
        id: this.id,
        title: this.title,
        smallSizeLink: this.smallSizeLink,
        regularSizeLink: this.regularSizeLink,
        rawLink: this.rawLink,
        fullSizeLink: this.fullSizeLink,
      );
}
