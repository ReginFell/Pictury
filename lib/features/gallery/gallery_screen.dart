import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:imgur_gallery/core/ui/base_widget.dart';
import 'package:imgur_gallery/features/gallery/gallery_view_model.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatelessWidget {
  static const String route = '/gallery';

  @override
  Widget build(BuildContext context) {
    return BaseWidget<GalleryViewModel>(
      model: GalleryViewModel(Provider.of(context)),
      onModelReady: (model) => model.loadGallery(),
      builder: (context, model, child) =>
          PlatformText(model.gallery.toString()),
    );
  }
}
