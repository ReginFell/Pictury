import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pictury/theme/app_theme.dart';
import 'package:pictury/theme/material_theme_provider.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  final String hint;
  final Function(String) onChanged;

  SearchView({@required this.hint, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final MaterialThemeProvider provider = Provider.of(context);
    final AppTheme theme = provider.getThemeFromKey(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(theme.searchBarCornerRadius),
      child: Container(
        color: theme.searchBarColor,
        child: TextField(
            decoration: new InputDecoration(
              prefixIcon: Icon(Icons.search, color: theme.searchIconColor),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hint,
            ),
            onChanged: (text) {
              onChanged(text);
            }),
      ),
    );
  }
}
