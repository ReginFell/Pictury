import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pictury/core/ui/base/base_bloc_provider.dart';
import 'package:pictury/core/ui/widget/application_app_bar.dart';
import 'package:pictury/features/settings/settings_bloc.dart';
import 'package:pictury/features/settings/settings_event.dart';
import 'package:pictury/features/settings/settings_view_state.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  static const String route = '/settings';

  @override
  Widget build(BuildContext context) {
    return BaseBlocProvider<SettingsBloc, SettingsViewState>(
        bloc: SettingsBloc(Provider.of(context), Provider.of(context)),
        builder: (context, bloc) {
          return Scaffold(
            appBar: ApplicationAppBar.create(context, title: "Settings"),
            body: _buildBody(context, bloc),
          );
        });
  }

  Widget _buildBody(BuildContext context, SettingsBloc bloc) {
    return ListView(
        children: ListTile.divideTiles(context: context, tiles: [
      SwitchListTile(
          title: Text("Dark theme"),
          value: bloc.currentState.isDarkThemeEnabled,
          onChanged: (newValue) => bloc.dispatch(ChangeThemeEvent(newValue))),
      ListTile(
        title: Text("Terms and conditions"),
        leading: Icon(Icons.info),
      )
    ]).toList());
  }
}
