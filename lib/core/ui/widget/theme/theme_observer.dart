import 'package:flutter/cupertino.dart';
import 'package:pictury/data/local_config/local_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeObserver extends StatelessWidget {

  final Widget Function(context, bool) builder;

  ThemeObserver({@required this.builder})

  @override
  Widget build(BuildContext context) {
    final LocalConfigProvider provider = Provider.of(context);
    return StreamBuilder(
      stream: provider.observeThemeState(),
      builder: (context, snapshot) => builder(context, snapshot.data),
    );
  }
}
