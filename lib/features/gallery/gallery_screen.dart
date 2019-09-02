import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unsplash_gallery/core/ui/base/base_widget.dart';
import 'package:unsplash_gallery/data/gallery/models/section.dart';
import 'package:unsplash_gallery/domain/gallery/models/picture.dart';
import 'package:unsplash_gallery/features/gallery/gallery_view_model.dart';
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
          return buildBody(context, model);
        });
  }

  Widget buildBody(BuildContext context, GalleryViewModel model) {
    return Container(
      child: Column(
        children: [
          if (model.viewState.isLoading && model.viewState.pictures.isEmpty)
            Center(child: PlatformCircularProgressIndicator())
          else
            Expanded(child: buildGrid(context, model)),
          if (model.viewState.isLoading && model.viewState.pictures.isNotEmpty)
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformCircularProgressIndicator(),
            )),
        ],
      ),
    );
  }

  Widget buildGrid(BuildContext context, GalleryViewModel model) {
    return StaggeredGridView.countBuilder(
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 1),
        controller: _scrollController,
        crossAxisCount: 4,
        itemCount: model.viewState.pictures.length,
        itemBuilder: (BuildContext context, int index) {
          final Picture picture = model.viewState.pictures[index];
          return FittedBox(
            fit: BoxFit.cover,
            child: Hero(
              child: GestureDetector(
                  onTap: () => model.onImageClick(context, picture),
                  child: CachedNetworkImage(
                    imageUrl: picture.link,
                  )),
              tag: "image ${picture.link}",
            ),
          );
        });
  }
}
