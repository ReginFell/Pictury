import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pictury/core/ui/base/base_bloc_provider.dart';
import 'package:pictury/core/ui/widget/app_label_text.dart';
import 'package:pictury/core/ui/widget/horizontal_list_wheel_scroll_view.dart';
import 'package:pictury/core/ui/widget/keep_alive_widget.dart';
import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/features/categories/categories_screen.dart';
import 'package:pictury/features/gallery/gallery_screen.dart';
import 'package:pictury/features/home/home_bloc.dart';
import 'package:pictury/features/home/home_view_state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return BaseBlocProvider<HomeBloc, HomeViewState>(
      bloc: HomeBloc(Provider.of(context)),
      builder: (context, model) {
        if (model.currentState.categories.isNotEmpty) {
          _tabController = new TabController(
              vsync: this, length: model.currentState.categories.length);

          return Scaffold(
            appBar: _buildAppBar(context),
            extendBodyBehindAppBar: true,
            body: _buildBody(context, model),
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
    return TabBarView(
      controller: _tabController,
      children: [
        ...model.currentState.categories
            .map((category) => KeepAliveWidget(GalleryScreen(category.query)))
      ],
    );
  }

  Widget _buildBottomTabs(BuildContext context, HomeBloc model) {
    final double tabHeight = 38;

    return Column(
      children: <Widget>[
        Container(
            height: 12,
            child: VerticalDivider(
              thickness: 1,
              color: Colors.grey,
              width: 2,
            )),
        Row(
          children: <Widget>[
            Expanded(
                child: Container(
                    height: tabHeight,
                    child: HorizontalListWheelScrollView(
                      itemExtent: 90,
                      onSelectedItemChanged: (index) {
                        _tabController.animateTo(index);
                      },
                      scrollDirection: Axis.horizontal,
                      childCount: model.currentState.categories.length,
                      builder: (context, index) {
                        final Category category =
                            model.currentState.categories[index];

                        return Tab(child: LabelText(category.name));
                      },
                    ))),
          ],
        ),
      ],
    );
  }
}
