import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pictury/core/ui/base/base_bloc_provider.dart';
import 'package:pictury/core/ui/widget/bottom_bar.dart';
import 'package:pictury/core/ui/widget/search_view.dart';
import 'package:pictury/domain/category/models/category_view_model.dart';
import 'package:pictury/features/categories/categories_view_state.dart';
import 'package:pictury/features/categories/widgets/selectable_item.dart';
import 'package:pictury/features/home/home_screen.dart';
import 'package:pictury/theme/app_theme.dart';
import 'package:pictury/theme/theme_provider.dart';
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
        bloc: CategoriesBloc(Provider.of(context), Provider.of(context)),
        onBlocReady: (model) => model.dispatch(InitEvent()),
        builder: (context, bloc) {
          return Scaffold(
            body: _buildBody(context, bloc),
            bottomNavigationBar: _buildBottomBar(context, bloc),
          );
        });
  }

  Widget _buildBottomBar(BuildContext context, CategoriesBloc bloc) {
    final AppLocalizations localization = AppLocalizations.of(context);

    return InkWell(
      onTap: () => bloc.dispatch(ContinueEvent()),
      child: BottomBar(
        child: Center(
            child: PlatformText(localization.translate(
                bloc.currentState.filteredCategories.isNotEmpty
                    ? "continue"
                    : "skip"))),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CategoriesBloc bloc) {
    if (bloc.currentState.isLoading) {
      return Center(child: PlatformCircularProgressIndicator());
    } else {
      return CustomScrollView(slivers: [
        _buildAppBar(context),
        _buildSearch(context, bloc),
        _buildAppCategories(context),
        if (bloc.currentState.filteredCategories.isEmpty)
          _buildNewCategory(context, bloc)
      ]);
    }
  }

  Widget _buildAppCategories(BuildContext context) {
    final CategoriesBloc bloc = BlocProvider.of(context);
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final CategoryViewModel viewModel =
                bloc.currentState.filteredCategories[index];

            return SelectableItem(
                item: viewModel,
                selected: Stack(
                  children: [
                    Positioned.fill(
                        child: CachedNetworkImage(
                      imageUrl: viewModel.image,
                      fit: BoxFit.cover,
                    )),
                    Align(
                      alignment: Alignment.center,
                      child: Text(viewModel.name,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(color: Colors.white, fontSize: 22)),
                    )
                  ],
                ),
                notSelected: Stack(
                  children: [
                    Positioned.fill(
                        child: Container(color: Colors.transparent)),
                    Align(
                      alignment: Alignment.center,
                      child: Text(viewModel.name,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(color: Colors.black, fontSize: 22)),
                    )
                  ],
                ),
                isSelected: viewModel.isSelected,
                onTap: (category) =>
                    bloc.dispatch(SelectCategoryEvent(category)));
          },
          childCount: bloc.currentState.filteredCategories.length,
        ));
  }

  Widget _buildAppBar(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of(context);

    return SliverAppBar(
      floating: false,
      pinned: true,
      title: Text("Add a new category"),
      backgroundColor:
          themeProvider.getThemeFromKey(context).appBarBackgroundColor,
    );
  }

  Widget _buildSearch(BuildContext context, CategoriesBloc bloc) {
    final AppLocalizations localization = AppLocalizations.of(context);

    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
          child: SearchView(
        hint: localization.translate("find_category"),
        onChanged: (query) {
          bloc.dispatch(SearchQueryChangedEvent(query));
        },
      )),
    );
  }

  Widget _buildNewCategory(BuildContext context, CategoriesBloc bloc) {
    final AppLocalizations localization = AppLocalizations.of(context);

    return SliverPadding(
      padding: const EdgeInsets.only(right: 16.0, left: 16.0),
      sliver: SliverToBoxAdapter(
          child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(localization.translate("category_not_found")),
            InkWell(
                onTap: () {
                  bloc.dispatch(AddCategoryEvent(bloc.currentState.query));
                },
                child: Text(
                  " ${bloc.currentState.query}",
                  style: TextStyle(color: Colors.blue, fontSize: 22),
                ))
          ],
        ),
      )),
    );
  }
}
