import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pictury/core/ui/base/base_bloc_provider.dart';
import 'package:pictury/core/ui/widget/app_label_text.dart';
import 'package:pictury/core/ui/widget/keep_alive_widget.dart';
import 'package:pictury/features/gallery/gallery_screen.dart';
import 'package:pictury/features/home/home_bloc.dart';
import 'package:pictury/features/home/home_view_state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return BaseBlocProvider<HomeBloc, HomeViewState>(
      bloc: HomeBloc(Provider.of(context)),
      builder: (context, model) {
        if (model.currentState.categories.isNotEmpty) {
          return DefaultTabController(
              length: model.currentState.categories.length,
              child: Scaffold(
                body: _buildBody(context, model),
              ));
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        child: AppBar(
          backgroundColor: Colors.black.withOpacity(0.5),
          elevation: 0,
        ));
  }

  Widget _buildBody(BuildContext context, HomeBloc model) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 22),
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    children: [
                      ...model.currentState.categories.map((category) =>
                          KeepAliveWidget(GalleryScreen(category.query)))
                    ],
                  ),
                ),
                TabBar(
                  indicatorPadding: EdgeInsets.all(0.0),
                  indicatorWeight: 2.0,
                  isScrollable: true,
                  tabs: [
                    ...model.currentState.categories
                        .map((category) => Tab(child: LabelText(category.name)))
                  ],
                ),
              ],
            ),
          ),
        ),
        _buildAppBar(context),
      ],
    );
  }
}
