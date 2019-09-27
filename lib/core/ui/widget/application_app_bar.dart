import 'package:flutter/material.dart';
import 'package:pictury/theme/app_theme.dart';
import 'package:pictury/theme/material_theme_provider.dart';
import 'package:provider/provider.dart';

class ApplicationAppBar extends AppBar {
  ApplicationAppBar._();

  static AppBar create(BuildContext context,
      {String title, List<Widget> actions}) {
    final MaterialThemeProvider provider = Provider.of(context);
    final AppTheme theme = provider.getThemeFromKey(context);

    return AppBar(
      title: Text(
        title ?? "",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      actions: actions,
      backgroundColor: theme.appBarBackgroundColor,
      elevation: 0,
    );
  }
}
