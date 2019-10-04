import 'package:meta/meta.dart';

part 'settings_event.g.dart';

@sealed
abstract class SettingsEvent with SealedSettingsEvent {}

class ThemeChangedEvent extends SettingsEvent {
  final bool isDarkThemeEnabled;

  ThemeChangedEvent(this.isDarkThemeEnabled);
}

class ChangeThemeEvent extends SettingsEvent {
  final bool isDarkThemeEnabled;

  ChangeThemeEvent(this.isDarkThemeEnabled);

  @override
  String toString() {
    return 'ChangeThemeEvent{isDarkThemeEnabled: $isDarkThemeEnabled}';
  }
}
