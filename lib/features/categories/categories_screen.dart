import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pictury/core/ui/base/base_widget.dart';
import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/features/categories/categories_view_model.dart';
import 'package:provider/provider.dart';

import '../../app_localization.dart';

class CategoriesScreen extends StatefulWidget {
  static const String route = "/categories";

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with TickerProviderStateMixin {
  AnimationController _scaleController;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CategoriesViewModel>(
        model: CategoriesViewModel(Provider.of(context)),
        onModelReady: (model) => model.loadCategories(),
        builder: (context, model, child) {
          return PlatformScaffold(
            body: _buildBody(context, model),
          );
        });
  }

  Widget _buildBody(BuildContext context, CategoriesViewModel model) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations localization = AppLocalizations.of(context);

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
                      child: Text(localization.translate("hi_how_are_you"),
                          style: theme.textTheme.headline
                              .copyWith(color: theme.primaryColorDark))),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 8.0, bottom: 16.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          localization.translate("choose_what_you_like"),
                          style: theme.textTheme.subhead
                              .copyWith(color: theme.primaryColorDark))),
                ),
                Expanded(child: _buildGrid(context, model)),
                InkWell(
                  onTap: () => model.skip(context),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Center(
                        child: PlatformText(localization.translate("skip"))),
                  ),
                ),
              ],
            ))),
        ],
      ),
    ));
  }

  Widget _buildGrid(BuildContext context, CategoriesViewModel model) {
    return GridView.count(
        childAspectRatio: 1.5,
        crossAxisCount: 2,
        children: List.generate(model.viewState.categories.length, (index) {
          final Category category = model.viewState.categories[index];
          final bool isSelected =
              model.viewState.selectedCategories.contains(category);

          return GestureDetector(
              onTap: () => model.selectCategory(category),
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Stack(children: [
                    Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: category.picture,
                          fit: BoxFit.cover,
                        )),
                    SizedOverflowBox(
                        size: Size(300, 300),
                        child: AnimatedContainer(
                          width: isSelected ? 200 : 0,
                          height: isSelected ? 200 : 0,
                          alignment: Alignment.center,
                          duration: Duration(milliseconds: 100),
                          color: isSelected
                              ? Theme.of(context).primaryColorDark
                              : Colors.transparent,
                        )),
                    Align(
                      alignment: Alignment.center,
                      child: Text(category.name,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(color: Colors.white)),
                    )
                  ]),
                ),
              ));
        }));
  }
}
