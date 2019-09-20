import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pictury/core/ui/base/base_bloc_provider.dart';
import 'package:pictury/core/ui/widget/application_app_bar.dart';
import 'package:pictury/core/ui/widget/bottom_bar.dart';
import 'package:pictury/domain/gallery/models/gallery_view_model.dart';
import 'package:pictury/features/gallery_details/gallery_details_bloc.dart';
import 'package:pictury/features/gallery_details/gallery_details_event.dart';
import 'package:provider/provider.dart';

class GalleryDetailsScreen extends StatelessWidget {
  static const String route = '/gallery/details';

  final GalleryDetailsArguments _arguments;

  GalleryDetailsScreen(this._arguments);

  @override
  Widget build(BuildContext context) {
    return BaseBlocProvider(
      bloc: GalleryDetailsBloc(
          _arguments._galleryViewModel, Provider.of(context)),
      builder: (context, bloc) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar:
            ApplicationAppBar.create(title: _arguments._galleryViewModel.title),
        body: Builder(builder: (context) => _buildBody(context, bloc)),
      ),
    );
  }

  Widget _buildBody(BuildContext context, GalleryDetailsBloc bloc) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: PhotoView(
                heroAttributes: PhotoViewHeroAttributes(tag: _arguments._tag),
                imageProvider: CachedNetworkImageProvider(
                    _arguments._galleryViewModel.link)),
          ),
          _buildBottomMenu(context, bloc)
        ],
      ),
    );
  }

  Widget _buildBottomMenu(BuildContext context, GalleryDetailsBloc bloc) {
    return BottomBar(
      child: Material(
        type: MaterialType.transparency,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                  onTap: () => {bloc.dispatch(MakeFavoriteEvent())},
                  customBorder: new CircleBorder(),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: bloc.currentState.isFavorite
                          ? Icon(Icons.star, key: ValueKey("selected"))
                          : Icon(Icons.star_border,
                              key: ValueKey("notSelected")),
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  customBorder: new CircleBorder(),
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        context: context,
                        builder: (builder) {
                          return ListView(
                            physics: NeverScrollableScrollPhysics(),
                            children:
                                ListTile.divideTiles(context: context, tiles: [
                              ListTile(
                                leading: Icon(Icons.file_download),
                                title: Text('Download full'),
                                subtitle: Text(
                                  _arguments._galleryViewModel.link,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.file_download),
                                title: Text('Download raw'),
                                subtitle: Text(
                                  _arguments._galleryViewModel.link,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.image),
                                title: Text('Set as a background'),
                              ),
                              ListTile(
                                leading: Icon(Icons.image),
                                title: Text('Sheep'),
                              ),
                              ListTile(
                                title: Text('Goat'),
                              ),
                            ]).toList(),
                          );
                        });
                  },
                  child: SvgPicture.asset(
                    "assets/icons/horizontal_options_menu.svg",
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GalleryDetailsArguments {
  final GalleryViewModel _galleryViewModel;
  final String _tag;

  GalleryDetailsArguments(this._galleryViewModel, this._tag);
}
