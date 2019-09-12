// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_view_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CategoriesViewState extends CategoriesViewState {
  @override
  final List<Category> categories;
  @override
  final List<Category> selectedCategories;
  @override
  final bool isLoading;
  @override
  final bool doneEditing;
  @override
  final Exception hasError;

  factory _$CategoriesViewState(
          [void Function(CategoriesViewStateBuilder) updates]) =>
      (new CategoriesViewStateBuilder()..update(updates)).build();

  _$CategoriesViewState._(
      {this.categories,
      this.selectedCategories,
      this.isLoading,
      this.doneEditing,
      this.hasError})
      : super._() {
    if (categories == null) {
      throw new BuiltValueNullFieldError('CategoriesViewState', 'categories');
    }
    if (selectedCategories == null) {
      throw new BuiltValueNullFieldError(
          'CategoriesViewState', 'selectedCategories');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('CategoriesViewState', 'isLoading');
    }
    if (doneEditing == null) {
      throw new BuiltValueNullFieldError('CategoriesViewState', 'doneEditing');
    }
  }

  @override
  CategoriesViewState rebuild(
          void Function(CategoriesViewStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoriesViewStateBuilder toBuilder() =>
      new CategoriesViewStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoriesViewState &&
        categories == other.categories &&
        selectedCategories == other.selectedCategories &&
        isLoading == other.isLoading &&
        doneEditing == other.doneEditing &&
        hasError == other.hasError;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, categories.hashCode), selectedCategories.hashCode),
                isLoading.hashCode),
            doneEditing.hashCode),
        hasError.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CategoriesViewState')
          ..add('categories', categories)
          ..add('selectedCategories', selectedCategories)
          ..add('isLoading', isLoading)
          ..add('doneEditing', doneEditing)
          ..add('hasError', hasError))
        .toString();
  }
}

class CategoriesViewStateBuilder
    implements Builder<CategoriesViewState, CategoriesViewStateBuilder> {
  _$CategoriesViewState _$v;

  List<Category> _categories;
  List<Category> get categories => _$this._categories;
  set categories(List<Category> categories) => _$this._categories = categories;

  List<Category> _selectedCategories;
  List<Category> get selectedCategories => _$this._selectedCategories;
  set selectedCategories(List<Category> selectedCategories) =>
      _$this._selectedCategories = selectedCategories;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  bool _doneEditing;
  bool get doneEditing => _$this._doneEditing;
  set doneEditing(bool doneEditing) => _$this._doneEditing = doneEditing;

  Exception _hasError;
  Exception get hasError => _$this._hasError;
  set hasError(Exception hasError) => _$this._hasError = hasError;

  CategoriesViewStateBuilder();

  CategoriesViewStateBuilder get _$this {
    if (_$v != null) {
      _categories = _$v.categories;
      _selectedCategories = _$v.selectedCategories;
      _isLoading = _$v.isLoading;
      _doneEditing = _$v.doneEditing;
      _hasError = _$v.hasError;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoriesViewState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CategoriesViewState;
  }

  @override
  void update(void Function(CategoriesViewStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CategoriesViewState build() {
    final _$result = _$v ??
        new _$CategoriesViewState._(
            categories: categories,
            selectedCategories: selectedCategories,
            isLoading: isLoading,
            doneEditing: doneEditing,
            hasError: hasError);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
