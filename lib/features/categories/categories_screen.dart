import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pictury/core/ui/base/base_widget.dart';
import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/features/categories/categories_view_model.dart';
import 'package:pictury/features/categories/widgets/category_item.dart';
import 'package:provider/provider.dart';

import '../../app_localization.dart';

class CategoriesScreen extends StatefulWidget {
  static const String route = "/categories";

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CategoriesViewModel>(
        model: CategoriesViewModel(
            Provider.of(context), Provider.of(context), Provider.of(context)),
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
                        child: PlatformText(localization.translate(
                            model.viewState.selectedCategories.isNotEmpty
                                ? "continue"
                                : "skip"))),
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

        return CategoryItem(
            category: category,
            isSelected: isSelected,
            onTap: (category) => model.selectCategory(category));
      }),
    );
  }
}
