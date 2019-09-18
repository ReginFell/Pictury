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
      backgroundColor: Color(0xFF4D4D4D).withOpacity(0.5),
      elevation: 0,
    );
  }
}
