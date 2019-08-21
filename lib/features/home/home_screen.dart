import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:imgur_gallery/data/gallery/models/section.dart';
import 'package:imgur_gallery/features/gallery/gallery_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: buildAppBar(),
          body: buildBody(),
        ));
  }

  Widget buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: SafeArea(
        child: TabBar(
          isScrollable: true,
          tabs: [
            Tab(
              child: Text(
                "First",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Tab(
              child: Text(
                "Second",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Tab(
              child: Text(
                "Third",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return TabBarView(
      children: [
        GalleryScreen(Section.HOT),
        Icon(Icons.directions_transit),
        Icon(Icons.directions_bike),
      ],
    );
  }
}
