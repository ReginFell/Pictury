import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pictury/core/ui/widget/application_app_bar.dart';
import 'package:pictury/core/ui/widget/bottom_bar.dart';
import 'package:pictury/domain/gallery/models/gallery_view_model.dart';

class GalleryDetailsScreen extends StatelessWidget {
  static const String route = '/gallery/details';

  final GalleryDetailsArguments _arguments;

  GalleryDetailsScreen(this._arguments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ApplicationAppBar.create(title: _arguments._galleryViewModel.title),
      body: Builder(builder: (context) => _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Hero(
                child: CachedNetworkImage(imageUrl: _arguments._galleryViewModel.link),
                tag: _arguments._tag,
              ),
            ),
          ),
          _buildBottomMenu(context)
        ],
      ),
    );
  }

  Widget _buildBottomMenu(BuildContext context) {
    return BottomBar(
      color: Colors.white,
      child: Material(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    customBorder: new CircleBorder(),
                    child: Icon(Icons.star_border),
                    onTap: () => {},
                  ),
                )),
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
