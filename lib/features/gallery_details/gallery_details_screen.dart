import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:imgur_gallery/domain/gallery/models/picture.dart';

class GalleryDetailsScreen extends StatefulWidget {
  static const String route = '/gallery/details';

  final GalleryDetailsArguments _arguments;

  GalleryDetailsScreen(this._arguments);

  @override
  State<StatefulWidget> createState() => _GalleryDetailsScreenState();
}

class _GalleryDetailsScreenState extends State<GalleryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Hero(
        child: CachedNetworkImage(imageUrl: widget._arguments.picture.link),
        tag: "image ${widget._arguments.picture.link}",
      ),
    );
  }
}

class GalleryDetailsArguments {
  final Picture picture;

  GalleryDetailsArguments(this.picture);
}
