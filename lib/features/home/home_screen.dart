import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pictury/core/ui/base/base_bloc_provider.dart';
import 'package:pictury/core/ui/widget/bottom_bar.dart';
import 'package:pictury/core/ui/widget/keep_alive_widget.dart';
import 'package:pictury/core/ui/widget/application_app_bar.dart';
import 'package:pictury/features/categories/categories_screen.dart';
import 'package:pictury/features/gallery/gallery_screen.dart';
import 'package:pictury/features/gallery/gallery_type.dart';
import 'package:pictury/features/home/decorations/line_tab_decoration.dart';
import 'package:pictury/features/home/home_bloc.dart';
import 'package:pictury/features/home/home_view_state.dart';
import 'package:pictury/features/search/search_screen.dart';
import 'package:pictury/features/settings/settings_screen.dart';
import 'package:pictury/theme/app_theme.dart';
import 'package:pictury/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BaseBlocProvider<HomeBloc, HomeViewState>(
      bloc: HomeBloc(Provider.of(context)),
      builder: (context, model) {
        if (model.currentState.categories.isNotEmpty) {
          return DefaultTabController(
              length: model.currentState.categories.length,
              child: Scaffold(
                appBar: ApplicationAppBar.create(context,
                    title: "Pictury",
                    actions: [
                      PlatformIconButton(
                        icon: Icon(
                          Icons.search,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, SearchScreen.route);
                        },
                      ),
                      PlatformIconButton(
                        icon: Icon(
                          Icons.settings,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, SettingsScreen.route);
                        },
                      ),
                    ]),
                extendBodyBehindAppBar: true,
                bottomNavigationBar: _buildBottomTabs(context, model),
                body: _buildBody(context, model),
              ));
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildBody(BuildContext context, HomeBloc model) {
    return _buildPages(context, model);
  }

  Widget _buildPages(BuildContext context, HomeBloc model) {
    return TabBarView(children: [
      ...model.currentState.categories.map((category) {
        if (category.name.contains("Favorite")) {
          return KeepAliveWidget(GalleryScreen(
            FavoriteGalleryType(),
            key: ValueKey(category.query),
          ));
        } else {
          return KeepAliveWidget(GalleryScreen(
            RemoteGalleryType(category.query),
            key: ValueKey(category.query),
          ));
        }
      })
    ]);
  }

  Widget _buildBottomTabs(BuildContext context, HomeBloc model) {
    final ThemeProvider provider = Provider.of(context);
    final AppTheme theme = provider.getThemeFromKey(context);

    return BottomBar(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: InkWell(
              customBorder: CircleBorder(),
              onTap: () =>
                  Navigator.of(context).pushNamed(CategoriesScreen.route),
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: Icon(Icons.add),
              ),
            ),
          ),
          Expanded(
              child: Container(
            height: double.infinity,
            child: TabBar(
              isScrollable: true,
              indicator: LineTabDecoration(color: theme.indicatorColor),
              tabs: [
                ...model.currentState.categories.map((category) {
                  if (category.iconData != null) {
                    return Tab(child: Icon(category.iconData));
                  } else {
                    return Tab(child: PlatformText(category.name));
                  }
                })
              ],
            ),
          )),
        ],
      ),
    );
  }
}
