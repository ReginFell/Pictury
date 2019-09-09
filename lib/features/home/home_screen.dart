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
      builder: (context, model) => DefaultTabController(
          length: model.currentState.categories.length,
          child: Scaffold(
            appBar: buildAppBar(context),
            body: buildBody(context, model),
          )),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
          icon: Icon(Icons.format_align_left),
          color: Colors.black,
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      }),
    );
  }

  Widget buildBody(BuildContext context, HomeBloc model) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(
            indicatorPadding: EdgeInsets.all(0.0),
            indicatorWeight: 2.0,
            isScrollable: true,
            tabs: [
              ...model.currentState.categories
                  .map((category) => Tab(child: LabelText(category.name)))
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                ...model.currentState.categories.map((category) =>
                    KeepAliveWidget(GalleryScreen(category.query)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
