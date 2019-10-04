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
  final String author;

  GalleryEntity(
    this.id,
    this.title,
    this.smallSizeLink,
    this.regularSizeLink,
    this.rawLink,
    this.fullSizeLink,
    this.author,
  );

  GalleryViewModel asViewModel() => GalleryViewModel(
        id: this.id,
        title: this.title,
        smallSizeLink: smallSizeLink,
        regularSizeLink: this.regularSizeLink,
        rawLink: this.rawLink,
        fullSizeLink: this.fullSizeLink,
        author: author,
      );
}
