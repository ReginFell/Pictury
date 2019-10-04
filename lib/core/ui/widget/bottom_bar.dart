import 'package:flutter/material.dart';
import 'package:pictury/theme/app_theme.dart';
import 'package:pictury/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  static const double borderLineSize = 0;
  static const double bottomBarSize = 50 + borderLineSize;

  final Widget child;

  BottomBar({@required this.child});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider provider = Provider.of(context);
    final AppTheme theme = provider.getThemeFromKey(context);

    return Container(
      color: theme.bottomBarBackgroundColor,
      child: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: Container(
          height: bottomBarSize,
          child: Column(
            children: [
              Expanded(
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
