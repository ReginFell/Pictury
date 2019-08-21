import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:imgur_gallery/core/ui/base_widget.dart';
import 'package:imgur_gallery/data/gallery/models/section.dart';
import 'package:imgur_gallery/features/gallery/gallery_view_model.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatelessWidget {
  final Section section;

  GalleryScreen(this.section);

  static const String route = '/gallery';

  @override
  Widget build(BuildContext context) {
    return BaseWidget<GalleryViewModel>(
        model: GalleryViewModel(Provider.of(context)),
        onModelReady: (model) => model.loadGallery(section),
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
      crossAxisCount: 3,
      padding: const EdgeInsets.all(8),
      children: List.generate(model.gallery.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(1),
              child:
                  Image.network(model.gallery[index].link, fit: BoxFit.cover)),
        );
      }),
    );
  }
}
