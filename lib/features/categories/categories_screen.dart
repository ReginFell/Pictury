import 'dart:ui';

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
    final ThemeData theme = Theme.of(context);

    return SafeArea(
        child: Container(
      child: Column(
        children: [
          if (model.viewState.isLoading)
            Expanded(child: Center(child: PlatformCircularProgressIndicator()))
          else
            Expanded(
                child: Container(
                    child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Hi! how are you?",
                          style: theme.textTheme.headline
                              .copyWith(color: theme.primaryColorDark))),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 8.0, bottom: 16.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Choose what you like to fill your feed",
                          style: theme.textTheme.subhead
                              .copyWith(color: theme.primaryColorDark))),
                ),
                Expanded(child: buildGrid(context, model)),
                InkWell(
                  onTap: () => model.skip(context),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Center(child: PlatformText("Skip")),
                  ),
                ),
              ],
            ))),
        ],
      ),
    ));
  }

  Widget buildGrid(BuildContext context, CategoriesViewModel model) {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(model.viewState.categories.length, (index) {
          final Category category = model.viewState.categories[index];
          final bool isSelected =
              model.viewState.selectedCategories.contains(category);

          final List<Category> selectedCategories =
              model.viewState.selectedCategories;

          return GestureDetector(
            onTap: () => model.selectCategory(category),
            child: Stack(fit: StackFit.expand, children: [
              CachedNetworkImage(
                imageBuilder: (context, provider) {
                  return Stack(fit: StackFit.expand, children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: provider,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            isSelected ? Colors.red : Colors.transparent,
                            BlendMode.colorBurn,
                          ),
                        ),
                      ),
                    )
                  ]);
                },
                imageUrl: category.picture,
                fit: BoxFit.cover,
                colorBlendMode: selectedCategories.contains(category)
                    ? BlendMode.hardLight
                    : BlendMode.colorDodge,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: PlatformText(
                    selectedCategories.contains(category).toString()),
              )
            ]),
          );
        }));
  }
}
