import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pictury/core/ui/base/base_bloc_provider.dart';
import 'package:pictury/core/ui/widget/app_label_text.dart';
import 'package:pictury/core/ui/widget/keep_alive_widget.dart';
import 'package:pictury/features/categories/categories_screen.dart';
import 'package:pictury/features/gallery/gallery_screen.dart';
import 'package:pictury/features/home/decorations/line_tab_decoration.dart';
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
                appBar: _buildAppBar(context),
                extendBodyBehindAppBar: true,
                body: _buildBody(context, model),
              ));
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Pictury"),
      backgroundColor: Colors.grey.withOpacity(0.5),
      elevation: 0,
    );
  }

  Widget _buildBody(BuildContext context, HomeBloc model) {
    return Container(
      child: Column(
        children: [
          Expanded(child: _buildPages(context, model)),
          Container(height: 2, color: Colors.grey),
          _buildBottomTabs(context, model)
        ],
      ),
    );
  }

  Widget _buildPages(BuildContext context, HomeBloc model) {
    return TabBarView(children: [
      ...model.currentState.categories
          .map((category) => KeepAliveWidget(GalleryScreen(category.query)))
    ]);
  }

  Widget _buildBottomTabs(BuildContext context, HomeBloc model) {
    final double tabHeight = 50;

    return Row(
      children: <Widget>[
        Container(
          height: tabHeight,
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
              height: tabHeight,
              child: TabBar(
          isScrollable: true,
          indicator: LineTabDecoration(color: Colors.grey),
          tabs: [
              ...model.currentState.categories
                  .map((category) => Tab(child: LabelText(category.name)))
          ],
        ),
            )),
      ],
    );
  }
}
