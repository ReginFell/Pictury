import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pictury/core/ui/base/base_bloc_provider.dart';
import 'package:pictury/domain/gallery/models/gallery_view_model.dart';
import 'package:pictury/features/gallery/gallery_view_state.dart';
import 'package:pictury/features/gallery_details/gallery_details_screen.dart';
import 'package:provider/provider.dart';

import 'gallery_bloc.dart';
import 'gallery_event.dart';
import 'gallery_type.dart';

class GalleryScreen extends StatelessWidget {
  static const String route = '/gallery';

  final GalleryType type;

  GalleryScreen(this.type, {key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseBlocProvider<GalleryBloc, GalleryViewState>(
        bloc: GalleryBloc(type, Provider.of(context)),
        onBlocReady: (model) {
          model.dispatch(LoadNextPageEvent());
          _scrollController.addListener(() {
            if (_scrollController.position.pixels ==
                _scrollController.position.maxScrollExtent) {
              model.dispatch(LoadNextPageEvent());
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
        staggeredTileBuilder: (int index) {
          if (index % 16 == 0) {
            return StaggeredTile.count(6, 2);
          } else {
            return StaggeredTile.count(2, index.isEven ? 2 : 1);
          }
        },
        controller: _scrollController,
        crossAxisCount: 4,
        itemCount: model.currentState.pictures.length,
        itemBuilder: (BuildContext context, int index) {
          final GalleryViewModel galleryViewModel =
              model.currentState.pictures[index];

          final String heroTag = "image $type ${galleryViewModel.rawLink}";

          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Hero(
                child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                          context,
                          GalleryDetailsScreen.route,
                          arguments: GalleryDetailsArguments(
                              galleryViewModel, heroTag),
                        ),
                    child: CachedNetworkImage(
                        imageUrl: galleryViewModel.smallSizeLink)),
                tag: heroTag,
              ),
            ),
          );
        });
  }
}
