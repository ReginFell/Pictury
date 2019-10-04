import 'package:meta/meta.dart';
import 'package:pictury/theme/theme_provider.dart';

part 'settings_event.g.dart';

@sealed
abstract class SettingsEvent with SealedSettingsEvent {}

class ThemeChangedEvent extends SettingsEvent {
  final AppThemeMode appThemeMode;

  ThemeChangedEvent(this.appThemeMode);
}

class ChangeThemeEvent extends SettingsEvent {
  final bool isDarkThemeEnabled;

  ChangeThemeEvent(this.isDarkThemeEnabled);

  @override
  String toString() {
    return 'ChangeThemeEvent{isDarkThemeEnabled: $isDarkThemeEnabled}';
  }
}
