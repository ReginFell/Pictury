// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_view_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SettingsViewState extends SettingsViewState {
  @override
  final bool isDarkThemeEnabled;

  factory _$SettingsViewState(
          [void Function(SettingsViewStateBuilder) updates]) =>
      (new SettingsViewStateBuilder()..update(updates)).build();

  _$SettingsViewState._({this.isDarkThemeEnabled}) : super._() {
    if (isDarkThemeEnabled == null) {
      throw new BuiltValueNullFieldError(
          'SettingsViewState', 'isDarkThemeEnabled');
    }
  }

  @override
  SettingsViewState rebuild(void Function(SettingsViewStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsViewStateBuilder toBuilder() =>
      new SettingsViewStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsViewState &&
        isDarkThemeEnabled == other.isDarkThemeEnabled;
  }

  @override
  int get hashCode {
    return $jf($jc(0, isDarkThemeEnabled.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SettingsViewState')
          ..add('isDarkThemeEnabled', isDarkThemeEnabled))
        .toString();
  }
}

class SettingsViewStateBuilder
    implements Builder<SettingsViewState, SettingsViewStateBuilder> {
  _$SettingsViewState _$v;

  bool _isDarkThemeEnabled;
  bool get isDarkThemeEnabled => _$this._isDarkThemeEnabled;
  set isDarkThemeEnabled(bool isDarkThemeEnabled) =>
      _$this._isDarkThemeEnabled = isDarkThemeEnabled;

  SettingsViewStateBuilder();

  SettingsViewStateBuilder get _$this {
    if (_$v != null) {
      _isDarkThemeEnabled = _$v.isDarkThemeEnabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SettingsViewState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SettingsViewState;
  }

  @override
  void update(void Function(SettingsViewStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingsViewState build() {
    final _$result = _$v ??
        new _$SettingsViewState._(isDarkThemeEnabled: isDarkThemeEnabled);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
