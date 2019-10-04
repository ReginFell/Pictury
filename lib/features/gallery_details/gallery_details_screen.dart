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
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpaper_changer/wallpaper_changer.dart';

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
        appBar: ApplicationAppBar.create(context,
            title: _arguments._galleryViewModel.title),
        body: Builder(builder: (context) => _buildBody(context, bloc)),
      ),
    );
  }

  Widget _buildBody(BuildContext context, GalleryDetailsBloc bloc) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PhotoView(
                backgroundDecoration:
                    BoxDecoration(color: themeData.scaffoldBackgroundColor),
                initialScale: PhotoViewComputedScale.contained,
                minScale: PhotoViewComputedScale.contained,
                heroAttributes: PhotoViewHeroAttributes(tag: _arguments._tag),
                imageProvider: CachedNetworkImageProvider(
                  _arguments._galleryViewModel.regularSizeLink,
                )),
          ),
          _buildBottomMenu(context, bloc)
        ],
      ),
    );
  }

  Widget _buildBottomMenu(BuildContext context, GalleryDetailsBloc bloc) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Text('Photo by ${_arguments._galleryViewModel.author} on '),
                  InkWell(
                    onTap: () => _launchURL(),
                    child: Text(
                      "Unsplash",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomBar(
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
                    child: InkWell(
                      customBorder: new CircleBorder(),
                      onTap: () => _showMenuDialog(context),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/icons/horizontal_options_menu.svg",
                          color: themeData.iconTheme.color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showMenuDialog(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: context,
        builder: (builder) {
          return ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: ListTile.divideTiles(context: context, tiles: [
              ListTile(
                leading: Icon(
                  Icons.file_download,
                ),
                title: Text('Download full'),
                subtitle: Text(
                  _arguments._galleryViewModel.smallSizeLink,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              ListTile(
                leading: Icon(Icons.file_download),
                title: Text('Download raw'),
                subtitle: Text(
                  _arguments._galleryViewModel.smallSizeLink,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              ListTile(
                leading: Icon(Icons.image),
                onTap: () => _setAsWallpaper(),
                title: Text('Set as a background'),
                subtitle: Text('Sorry, this feature doesn\'t work on iOS'),
              ),
            ]).toList(),
          );
        });
  }

  void _launchURL() async {
    const url = 'https://unsplash.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _setAsWallpaper() {
    WallpaperChanger.setWallpaper(
      _arguments._galleryViewModel.fullSizeLink,
      Screen.Home,
    );
  }
}

class GalleryDetailsArguments {
  final GalleryViewModel _galleryViewModel;
  final String _tag;

  GalleryDetailsArguments(this._galleryViewModel, this._tag);
}
