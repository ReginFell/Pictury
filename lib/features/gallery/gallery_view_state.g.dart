// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_view_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GalleryViewState extends GalleryViewState {
  @override
  final List<GalleryViewModel> pictures;
  @override
  final bool isLoading;
  @override
  final Exception hasError;

  factory _$GalleryViewState(
          [void Function(GalleryViewStateBuilder) updates]) =>
      (new GalleryViewStateBuilder()..update(updates)).build();

  _$GalleryViewState._({this.pictures, this.isLoading, this.hasError})
      : super._() {
    if (pictures == null) {
      throw new BuiltValueNullFieldError('GalleryViewState', 'pictures');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('GalleryViewState', 'isLoading');
    }
  }

  @override
  GalleryViewState rebuild(void Function(GalleryViewStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GalleryViewStateBuilder toBuilder() =>
      new GalleryViewStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GalleryViewState &&
        pictures == other.pictures &&
        isLoading == other.isLoading &&
        hasError == other.hasError;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, pictures.hashCode), isLoading.hashCode), hasError.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GalleryViewState')
          ..add('pictures', pictures)
          ..add('isLoading', isLoading)
          ..add('hasError', hasError))
        .toString();
  }
}

class GalleryViewStateBuilder
    implements Builder<GalleryViewState, GalleryViewStateBuilder> {
  _$GalleryViewState _$v;

  List<GalleryViewModel> _pictures;
  List<GalleryViewModel> get pictures => _$this._pictures;
  set pictures(List<GalleryViewModel> pictures) => _$this._pictures = pictures;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  Exception _hasError;
  Exception get hasError => _$this._hasError;
  set hasError(Exception hasError) => _$this._hasError = hasError;

  GalleryViewStateBuilder();

  GalleryViewStateBuilder get _$this {
    if (_$v != null) {
      _pictures = _$v.pictures;
      _isLoading = _$v.isLoading;
      _hasError = _$v.hasError;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GalleryViewState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GalleryViewState;
  }

  @override
  void update(void Function(GalleryViewStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GalleryViewState build() {
    final _$result = _$v ??
        new _$GalleryViewState._(
            pictures: pictures, isLoading: isLoading, hasError: hasError);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
