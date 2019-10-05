// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_details_view_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GalleryDetailsViewState extends GalleryDetailsViewState {
  @override
  final bool isFavorite;
  @override
  final bool isLoading;

  factory _$GalleryDetailsViewState(
          [void Function(GalleryDetailsViewStateBuilder) updates]) =>
      (new GalleryDetailsViewStateBuilder()..update(updates)).build();

  _$GalleryDetailsViewState._({this.isFavorite, this.isLoading}) : super._() {
    if (isFavorite == null) {
      throw new BuiltValueNullFieldError(
          'GalleryDetailsViewState', 'isFavorite');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError(
          'GalleryDetailsViewState', 'isLoading');
    }
  }

  @override
  GalleryDetailsViewState rebuild(
          void Function(GalleryDetailsViewStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GalleryDetailsViewStateBuilder toBuilder() =>
      new GalleryDetailsViewStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GalleryDetailsViewState &&
        isFavorite == other.isFavorite &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, isFavorite.hashCode), isLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GalleryDetailsViewState')
          ..add('isFavorite', isFavorite)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class GalleryDetailsViewStateBuilder
    implements
        Builder<GalleryDetailsViewState, GalleryDetailsViewStateBuilder> {
  _$GalleryDetailsViewState _$v;

  bool _isFavorite;
  bool get isFavorite => _$this._isFavorite;
  set isFavorite(bool isFavorite) => _$this._isFavorite = isFavorite;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  GalleryDetailsViewStateBuilder();

  GalleryDetailsViewStateBuilder get _$this {
    if (_$v != null) {
      _isFavorite = _$v.isFavorite;
      _isLoading = _$v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GalleryDetailsViewState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GalleryDetailsViewState;
  }

  @override
  void update(void Function(GalleryDetailsViewStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GalleryDetailsViewState build() {
    final _$result = _$v ??
        new _$GalleryDetailsViewState._(
            isFavorite: isFavorite, isLoading: isLoading);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
