import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pictury/core/ui/base/base_bloc_provider.dart';
import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/features/categories/categories_view_state.dart';
import 'package:pictury/features/categories/widgets/category_item.dart';
import 'package:pictury/features/home/home_screen.dart';
import 'package:pictury/features/search/search_screen.dart';
import 'package:provider/provider.dart';

import '../../app_localization.dart';
import 'categories_bloc.dart';
import 'categories_event.dart';

class CategoriesScreen extends StatelessWidget {
  static const String route = "/categories";

  final bool isInitial;

  CategoriesScreen({this.isInitial = false});

  @override
  Widget build(BuildContext context) {
    return BaseBlocProvider<CategoriesBloc, CategoriesViewState>(
        stateListener: (state) {
          if (state.doneEditing) {
            if (isInitial) {
              Navigator.pushReplacementNamed(context, HomeScreen.route);
            } else {
              Navigator.maybePop(context);
            }
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
                Expanded(
                    child: CustomScrollView(slivers: [
                  _buildTitle(context),
                  _buildAppCategories(context),
                  _buildCustomCategoryTitle(context),
                  _buildCustomCategories(context)
                ])),
                InkWell(
                  onTap: () => bloc.dispatch(ContinueEvent()),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
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

  Widget _buildAppCategories(BuildContext context) {
    final CategoriesBloc bloc = BlocProvider.of(context);

    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.5),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final Category category = bloc.currentState.categories[index];
            final bool isSelected =
                bloc.currentState.selectedCategories.contains(category);

            return SelectableItem(
                item: category,
                background: CachedNetworkImage(
                  imageUrl: (category as ApiCategory).picture,
                  fit: BoxFit.cover,
                ),
                foreground: Text(category.name,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .copyWith(color: Colors.white, fontSize: 22)),
                foregroundSelected: Text(category.name,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .copyWith(color: Colors.black, fontSize: 22)),
                isSelected: isSelected,
                onTap: (category) =>
                    bloc.dispatch(SelectCategoryEvent(category)));
          },
          childCount: bloc.currentState.categories.length,
        ));
  }

  Widget _buildTitle(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations localization = AppLocalizations.of(context);

    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(localization.translate("hi_how_are_you"),
                    style: theme.textTheme.headline
                        .copyWith(color: theme.primaryColorDark)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(localization.translate("choose_what_you_like"),
                    style: theme.textTheme.subhead
                        .copyWith(color: theme.primaryColorDark)),
              ),
            ],
          ),
        );
      }, childCount: 1)),
    );
  }

  Widget _buildCustomCategoryTitle(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations localization = AppLocalizations.of(context);

    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Text(localization.translate("or_add_your_own"),
            style: theme.textTheme.headline
                .copyWith(color: theme.primaryColorDark));
      }, childCount: 1)),
    );
  }

  Widget _buildCustomCategories(BuildContext context) {
    final CategoriesBloc bloc = BlocProvider.of(context);

    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.5),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            if (index == 0) {
              return SelectableItem(
                  background: Container(),
                  foreground: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onTap: (item) {
                    Navigator.pushNamed(context, SearchScreen.route);
                  },
                  isSelected: true);
            } else {
              return Container();
            }
          },
          childCount: 1,
        ));
  }
}
