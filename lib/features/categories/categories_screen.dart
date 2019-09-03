import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pictury/core/ui/base/base_widget.dart';
import 'package:pictury/features/categories/categories_view_model.dart';
import 'package:pictury/features/gallery/gallery_view_model.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  static const String route = "/categories";

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<CategoriesViewModel>(
        model: CategoriesViewModel(Provider.of(context)),
        onModelReady: (model) => model.test(),
        builder: (context, model, child) {
          return Text("test");
        });
  }
}
