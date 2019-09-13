import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ApplicationAppBar extends AppBar {
  ApplicationAppBar._();

  static Widget create({String title, List<Widget> actions}) {
    return AppBar(
      title: Text(
        title ?? "",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      actions: actions,
      backgroundColor: Colors.black.withOpacity(0.2),
      elevation: 0,
    );
  }
}
