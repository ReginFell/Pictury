import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:pictury/domain/gallery/models/gallery_view_model.dart';

@Entity(tableName: "Gallery")
class GalleryEntity {
  @primaryKey
  final String id;

  final String title;
  final String smallSizeLink;
  final String regularSizeLink;
  final String rawLink;
  final String fullSizeLink;

  GalleryEntity(
    @required this.id,
    @required this.title,
    @required this.smallSizeLink,
    @required this.regularSizeLink,
    @required this.rawLink,
    @required this.fullSizeLink,
  );

  GalleryViewModel asViewModel() => GalleryViewModel(
        id: this.id,
        title: this.title,
        smallSizeLink: smallSizeLink,
        regularSizeLink: this.regularSizeLink,
        rawLink: this.rawLink,
        fullSizeLink: this.fullSizeLink,
      );
}
