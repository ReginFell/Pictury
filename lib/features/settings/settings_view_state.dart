import 'package:built_value/built_value.dart';

part 'settings_view_state.g.dart';

abstract class SettingsViewState
    implements Built<SettingsViewState, SettingsViewStateBuilder> {
  bool get isDarkThemeEnabled;

  SettingsViewState._();

  static SettingsViewState createDefault() => SettingsViewState(
        (b) => b.._isDarkThemeEnabled = false,
      );

  factory SettingsViewState([void Function(SettingsViewStateBuilder) updates]) =
      _$SettingsViewState;
}
