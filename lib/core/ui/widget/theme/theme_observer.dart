import 'package:flutter/cupertino.dart';
import 'package:pictury/data/local_config/local_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeObserver extends StatelessWidget {
  final Widget Function(BuildContext, bool) builder;

  ThemeObserver({@required this.builder});

  @override
  Widget build(BuildContext context) {
    final LocalConfigProvider provider = Provider.of(context);
    return StreamBuilder(
      stream: provider.observeThemeState(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder(context, snapshot.data);
        } else {
          return Container();
        }
      },
    );
  }
}
