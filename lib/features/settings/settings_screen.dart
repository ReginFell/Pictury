import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pictury/core/ui/base/base_bloc_provider.dart';
import 'package:pictury/core/ui/widget/application_app_bar.dart';
import 'package:pictury/features/settings/settings_bloc.dart';
import 'package:pictury/features/settings/settings_event.dart';
import 'package:pictury/features/settings/settings_view_state.dart';
import 'package:provider/provider.dart';

import '../../app_localization.dart';

class SettingsScreen extends StatelessWidget {
  static const String route = '/settings';

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context);

    return BaseBlocProvider<SettingsBloc, SettingsViewState>(
        bloc: SettingsBloc(Provider.of(context), Provider.of(context)),
        builder: (context, bloc) {
          return Scaffold(
            appBar: ApplicationAppBar.create(context,
                title: localization.translate('settings')),
            body: _buildBody(context, bloc),
          );
        });
  }

  Widget _buildBody(BuildContext context, SettingsBloc bloc) {
    final AppLocalizations localization = AppLocalizations.of(context);

    return ListView(
        children: ListTile.divideTiles(context: context, tiles: [
      SwitchListTile(
          title: Text(localization.translate('dark_theme')),
          value: bloc.currentState.isDarkThemeEnabled,
          onChanged: (newValue) => bloc.dispatch(ChangeThemeEvent(newValue))),
      ListTile(
        title: Text(localization.translate('terms_and_conditions')),
        leading: Icon(Icons.info),
      )
    ]).toList());
  }
}
