import 'package:built_value/built_value.dart';

part 'search_view_state.g.dart';

abstract class SearchViewState
    implements Built<SearchViewState, SearchViewStateBuilder> {
  String get query;

  SearchViewState._();

  static SearchViewState createDefault() =>
      SearchViewState((b) => b..query = "");

  factory SearchViewState([void Function(SearchViewStateBuilder) updates]) =
      _$SearchViewState;
}
