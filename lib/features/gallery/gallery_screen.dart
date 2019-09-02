import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:imgur_gallery/core/ui/base/base_widget.dart';
import 'package:imgur_gallery/data/gallery/models/section.dart';
import 'package:imgur_gallery/domain/gallery/models/picture.dart';
import 'package:imgur_gallery/features/gallery/gallery_view_model.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatefulWidget {
  static const String route = '/gallery';

  final Section section;

  GalleryScreen(this.section);

  @override
  State<StatefulWidget> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<GalleryViewModel>(
        model: GalleryViewModel(Provider.of(context)),
        onModelReady: (model) {
          model.loadGallery(widget.section);

          _scrollController.addListener(() {
            if (_scrollController.position.pixels ==
                _scrollController.position.maxScrollExtent) {
              model.loadGallery(widget.section);
            }
          });
        },
        builder: (context, model, child) {
          if (model.viewState.isLoading) {
            return Center(child: PlatformCircularProgressIndicator());
          } else {
            return buildBody(context, model);
          }
        });
  }

  Widget buildBody(BuildContext context, GalleryViewModel model) {
    return GridView.count(
      controller: _scrollController,
      crossAxisCount: 2,
      children: List.generate(model.viewState.pictures.length, (index) {
        final Picture picture = model.viewState.pictures[index];
        return Container(
          child: FittedBox(
            fit: BoxFit.cover,
            child: Hero(
              child: InkWell(
                onTap: () => model.onImageClick(context, picture),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: CachedNetworkImage(imageUrl: picture.link)),
              ),
              tag: "image ${picture.link}",
            ),
          ),
        );
      }),
    );
  }
}
