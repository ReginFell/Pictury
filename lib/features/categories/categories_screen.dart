import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pictury/core/ui/base/base_bloc_provider.dart';
import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/features/categories/categories_view_state.dart';
import 'package:pictury/features/categories/widgets/category_item.dart';
import 'package:pictury/features/home/home_screen.dart';
import 'package:provider/provider.dart';

import '../../app_localization.dart';
import 'categories_bloc.dart';
import 'categories_event.dart';

class CategoriesScreen extends StatelessWidget {
  static const String route = "/categories";

  @override
  Widget build(BuildContext context) {
    return BaseBlocProvider<CategoriesBloc, CategoriesViewState>(
        stateListener: (state) {
          if (state.doneEditing) {
            Navigator.pushReplacementNamed(context, HomeScreen.route);
          }
        },
        bloc: CategoriesBloc(
            Provider.of(context), Provider.of(context), Provider.of(context)),
        onBlocReady: (model) => model.dispatch(InitLoadingEvent()),
        builder: (context, model) {
          return PlatformScaffold(
            body: _buildBody(context),
          );
        });
  }

  Widget _buildBody(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations localization = AppLocalizations.of(context);
    final CategoriesBloc bloc = BlocProvider.of(context);

    return SafeArea(
        child: Container(
      child: Column(
        children: [
          if (bloc.currentState.isLoading)
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
                Expanded(child: _buildGrid(context)),
                InkWell(
                  onTap: () => bloc.dispatch(ContinueEvent()),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Center(
                        child: PlatformText(localization.translate(
                            bloc.currentState.selectedCategories.isNotEmpty
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

  Widget _buildGrid(BuildContext context) {
    final CategoriesBloc bloc = BlocProvider.of(context);

    return GridView.count(
      childAspectRatio: 1.5,
      crossAxisCount: 2,
      children: List.generate(bloc.currentState.categories.length, (index) {
        final Category category = bloc.currentState.categories[index];
        final bool isSelected =
            bloc.currentState.selectedCategories.contains(category);

        return CategoryItem(
            category: category,
            isSelected: isSelected,
            onTap: (category) => bloc.dispatch(SelectCategoryEvent(category)));
      }),
    );
  }
}
