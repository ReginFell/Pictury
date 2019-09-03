import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pictury/core/ui/widget/app_label_text.dart';
import 'package:pictury/core/ui/widget/keep_alive_widget.dart';
import 'package:pictury/features/gallery/gallery_screen.dart';

import '../../app_localization.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Text("he"),
        appBar: buildAppBar(context),
        body: buildBody(context),
      ),
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

  Widget buildBody(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context);

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
              Tab(child: LabelText(localization.translate('hot'))),
              Tab(child: LabelText(localization.translate('top'))),
              Tab(child: LabelText(localization.translate('user'))),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                KeepAliveWidget(GalleryScreen()),
                KeepAliveWidget(GalleryScreen()),
                KeepAliveWidget(GalleryScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
