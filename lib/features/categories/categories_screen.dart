import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pictury/core/ui/base/base_widget.dart';
import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/features/categories/categories_view_model.dart';
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
        onModelReady: (model) => model.loadCategories(),
        builder: (context, model, child) {
          return PlatformScaffold(
            body: buildBody(context, model),
          );
        });
  }

  Widget buildBody(BuildContext context, CategoriesViewModel model) {
    return SafeArea(
        child: Container(
      child: Column(
        children: [
          if (model.viewState.isLoading)
            Expanded(child: Center(child: PlatformCircularProgressIndicator()))
          else
            Expanded(child: buildGrid(context, model)),
          InkWell(
            onTap: () => PlatformText("sa"),
            child: SizedBox(
              height: 60,
              child: PlatformText("Skip"),
            ),
          ),
        ],
      ),
    ));
  }

  Widget buildGrid(BuildContext context, CategoriesViewModel model) {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(model.viewState.categories.length, (index) {
          final Category category = model.viewState.categories[index];

          return Stack(fit: StackFit.expand, children: [
            CachedNetworkImage(
              imageUrl: category.picture,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: PlatformText(category.name),
            )
          ]);
        }));
  }
}
