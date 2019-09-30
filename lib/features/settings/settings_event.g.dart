// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_event.dart';

// **************************************************************************
// SealedClassGenerator
// **************************************************************************

class SealedSettingsEvent {
  R when<R>({
    @required R Function(ThemeChangedEvent) themeChangedEvent,
    @required R Function(ChangeThemeEvent) changeThemeEvent,
  }) {
    if (this is ThemeChangedEvent) {
      return themeChangedEvent(this as ThemeChangedEvent);
    }
    if (this is ChangeThemeEvent) {
      return changeThemeEvent(this as ChangeThemeEvent);
    }
    throw new Exception(
        'If you got here, probably you forgot to regenerate the classes? Try running flutter packages pub run build_runner build');
  }
}
