import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pictury/domain/gallery/models/picture.dart';

class GalleryDetailsScreen extends StatelessWidget {
  static const String route = '/gallery/details';

  final GalleryDetailsArguments _arguments;

  GalleryDetailsScreen(this._arguments);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        body: SafeArea(
      child: Hero(
        child: CachedNetworkImage(imageUrl: _arguments.picture.link),
        tag: _arguments.key.toString(),
      ),
    ));
  }
}

class GalleryDetailsArguments {
  final Picture picture;
  final Key key;

  GalleryDetailsArguments(this.picture, this.key);
}
