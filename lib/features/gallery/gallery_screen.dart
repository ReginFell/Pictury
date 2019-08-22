import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:imgur_gallery/core/ui/base/base_widget.dart';
import 'package:imgur_gallery/data/gallery/models/section.dart';
import 'package:imgur_gallery/features/gallery/gallery_view_model.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatefulWidget {
  final Section section;

  GalleryScreen(this.section);

  static const String route = '/gallery';

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
          if (model.gallery != null) {
            return buildBody(context, model);
          } else {
            return Center(child: PlatformCircularProgressIndicator());
          }
        });
  }

  Widget buildBody(BuildContext context, GalleryViewModel model) {
    return GridView.count(
      controller: _scrollController,
      crossAxisCount: 3,
      padding: const EdgeInsets.all(8),
      children: List.generate(model.gallery.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(1),
              child: CachedNetworkImage(
                  imageUrl: model.gallery[index].link, fit: BoxFit.cover)),
        );
      }),
    );
  }
}
