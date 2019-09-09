// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SplashViewState extends SplashViewState {
  @override
  final bool isSplashActive;
  @override
  final bool isCategoriesSelected;

  factory _$SplashViewState([void Function(SplashViewStateBuilder) updates]) =>
      (new SplashViewStateBuilder()..update(updates)).build();

  _$SplashViewState._({this.isSplashActive, this.isCategoriesSelected})
      : super._() {
    if (isSplashActive == null) {
      throw new BuiltValueNullFieldError('SplashViewState', 'isSplashActive');
    }
    if (isCategoriesSelected == null) {
      throw new BuiltValueNullFieldError(
          'SplashViewState', 'isCategoriesSelected');
    }
  }

  @override
  SplashViewState rebuild(void Function(SplashViewStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SplashViewStateBuilder toBuilder() =>
      new SplashViewStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SplashViewState &&
        isSplashActive == other.isSplashActive &&
        isCategoriesSelected == other.isCategoriesSelected;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, isSplashActive.hashCode), isCategoriesSelected.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SplashViewState')
          ..add('isSplashActive', isSplashActive)
          ..add('isCategoriesSelected', isCategoriesSelected))
        .toString();
  }
}

class SplashViewStateBuilder
    implements Builder<SplashViewState, SplashViewStateBuilder> {
  _$SplashViewState _$v;

  bool _isSplashActive;
  bool get isSplashActive => _$this._isSplashActive;
  set isSplashActive(bool isSplashActive) =>
      _$this._isSplashActive = isSplashActive;

  bool _isCategoriesSelected;
  bool get isCategoriesSelected => _$this._isCategoriesSelected;
  set isCategoriesSelected(bool isCategoriesSelected) =>
      _$this._isCategoriesSelected = isCategoriesSelected;

  SplashViewStateBuilder();

  SplashViewStateBuilder get _$this {
    if (_$v != null) {
      _isSplashActive = _$v.isSplashActive;
      _isCategoriesSelected = _$v.isCategoriesSelected;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SplashViewState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SplashViewState;
  }

  @override
  void update(void Function(SplashViewStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SplashViewState build() {
    final _$result = _$v ??
        new _$SplashViewState._(
            isSplashActive: isSplashActive,
            isCategoriesSelected: isCategoriesSelected);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
