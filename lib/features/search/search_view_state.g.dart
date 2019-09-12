// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_view_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchViewState extends SearchViewState {
  @override
  final String query;

  factory _$SearchViewState([void Function(SearchViewStateBuilder) updates]) =>
      (new SearchViewStateBuilder()..update(updates)).build();

  _$SearchViewState._({this.query}) : super._() {
    if (query == null) {
      throw new BuiltValueNullFieldError('SearchViewState', 'query');
    }
  }

  @override
  SearchViewState rebuild(void Function(SearchViewStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchViewStateBuilder toBuilder() =>
      new SearchViewStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchViewState && query == other.query;
  }

  @override
  int get hashCode {
    return $jf($jc(0, query.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchViewState')..add('query', query))
        .toString();
  }
}

class SearchViewStateBuilder
    implements Builder<SearchViewState, SearchViewStateBuilder> {
  _$SearchViewState _$v;

  String _query;
  String get query => _$this._query;
  set query(String query) => _$this._query = query;

  SearchViewStateBuilder();

  SearchViewStateBuilder get _$this {
    if (_$v != null) {
      _query = _$v.query;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchViewState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchViewState;
  }

  @override
  void update(void Function(SearchViewStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchViewState build() {
    final _$result = _$v ?? new _$SearchViewState._(query: query);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
