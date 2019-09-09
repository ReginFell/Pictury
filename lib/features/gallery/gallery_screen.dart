import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pictury/core/ui/base/base_bloc_provider.dart';
import 'package:pictury/domain/gallery/models/picture.dart';
import 'package:pictury/features/gallery/gallery_view_state.dart';
import 'package:provider/provider.dart';

import 'gallery_bloc.dart';
import 'gallery_event.dart';

class GalleryScreen extends StatefulWidget {
  static const String route = '/gallery';

  final String query;

  GalleryScreen(this.query);

  @override
  State<StatefulWidget> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseBlocProvider<GalleryBloc, GalleryViewState>(
        bloc: GalleryBloc(Provider.of(context)),
        onBlocReady: (model) {
          model.dispatch(LoadNextPageEvent(widget.query));
          _scrollController.addListener(() {
            if (_scrollController.position.pixels ==
                _scrollController.position.maxScrollExtent) {
              model.dispatch(LoadNextPageEvent(widget.query));
            }
          });
        },
        builder: (context, model) {
          return _buildBody(context, model);
        });
  }

  Widget _buildBody(BuildContext context, GalleryBloc model) {
    return Container(
      child: Column(
        children: [
          if (model.currentState.isLoading &&
              model.currentState.pictures.isEmpty)
            Expanded(child: Center(child: PlatformCircularProgressIndicator()))
          else
            Expanded(child: buildGrid(context, model)),
          if (model.currentState.isLoading &&
              model.currentState.pictures.isNotEmpty)
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformCircularProgressIndicator(),
            )),
        ],
      ),
    );
  }

  Widget buildGrid(BuildContext context, GalleryBloc model) {
    return StaggeredGridView.countBuilder(
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 1),
        controller: _scrollController,
        crossAxisCount: 4,
        itemCount: model.currentState.pictures.length,
        itemBuilder: (BuildContext context, int index) {
          final Picture picture = model.currentState.pictures[index];
          return FittedBox(
            fit: BoxFit.cover,
            child: Hero(
              child: GestureDetector(
                  onTap: () => model.onImageClick(context, picture),
                  child: CachedNetworkImage(imageUrl: picture.link)),
              tag: "image ${picture.link}",
            ),
          );
        });
  }
}
