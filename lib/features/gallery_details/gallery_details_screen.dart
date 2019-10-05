import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

import 'gallery_details_view_state.dart';

class GalleryDetailsScreen extends StatelessWidget {
  static const String route = '/gallery/details';

  final GalleryDetailsArguments _arguments;

  GalleryDetailsScreen(this._arguments);

  @override
  Widget build(BuildContext context) {
    return BaseBlocProvider<GalleryDetailsBloc, GalleryDetailsViewState>(
      bloc: GalleryDetailsBloc(
          _arguments._galleryViewModel, Provider.of(context)),
      builder: (context, bloc) =>
          BlocListener<GalleryDetailsBloc, GalleryDetailsViewState>(
        bloc: bloc,
        condition: (oldState, newState) =>
            oldState.isLoading != newState.isLoading,
        listener: (context, state) {
          if (state.isLoading) {
            _showLoadingDialog(context);
          } else {
            Navigator.of(context).pop();
          }
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: ApplicationAppBar.create(context,
              title: _arguments._galleryViewModel.title),
          body: _buildBody(context, bloc),
        ),
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
              child: RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                      style: Theme.of(context).textTheme.body1,
                      text:
                          'Photo by ${_arguments._galleryViewModel.author} on '),
                  WidgetSpan(
                    child: InkWell(
                      onTap: () => _launchURL(),
                      child: Text(
                        "Unsplash",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  )
                ],
              )),
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
                      onTap: () => _showMenuDialog(context, bloc),
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

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text("Loading"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMenuDialog(BuildContext context, GalleryDetailsBloc bloc) {
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
                onTap: () {
                  Navigator.of(context).pop();
                  _showSetWallpaperMenu(context, bloc);
                },
                title: Text('Set as a background'),
                subtitle: Text('Sorry, this feature doesn\'t work on iOS'),
              ),
            ]).toList(),
          );
        });
  }

  void _showSetWallpaperMenu(
      BuildContext context, GalleryDetailsBloc bloc) async {
    final bool isLockSupported = await _isLockSupported();

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
                title: Text('Home'),
                onTap: () {
                  Navigator.of(context).pop();
                  bloc.dispatch(SetWallpaperEvent(
                      _arguments._galleryViewModel, Screen.Home));
                },
              ),
              if (isLockSupported)
                ListTile(
                  title: Text('Lock'),
                  onTap: () {
                    Navigator.of(context).pop();
                    bloc.dispatch(SetWallpaperEvent(
                        _arguments._galleryViewModel, Screen.Lock));
                  },
                ),
            ]).toList(),
          );
        });
  }

  Future<bool> _isLockSupported() async {
    return await WallpaperChanger.isLockScreenSupported();
  }

  void _launchURL() async {
    const url = 'https://unsplash.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class GalleryDetailsArguments {
  final GalleryViewModel _galleryViewModel;
  final String _tag;

  GalleryDetailsArguments(this._galleryViewModel, this._tag);
}
