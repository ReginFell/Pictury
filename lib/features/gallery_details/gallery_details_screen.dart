import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pictury/core/ui/widget/application_app_bar.dart';
import 'package:pictury/domain/gallery/models/picture.dart';

class GalleryDetailsScreen extends StatelessWidget {
  static const String route = '/gallery/details';

  final GalleryDetailsArguments _arguments;

  GalleryDetailsScreen(this._arguments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ApplicationAppBar.create(title: _arguments._picture.title),
      body: Hero(
        child: CachedNetworkImage(imageUrl: _arguments._picture.link),
        tag: _arguments._tag,
      ),
    );
  }
}

class GalleryDetailsArguments {
  final Picture _picture;
  final String _tag;

  GalleryDetailsArguments(this._picture, this._tag);
}
