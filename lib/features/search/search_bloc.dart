import 'package:pictury/core/ui/base/base_bloc.dart';
import 'package:pictury/features/search/search_event.dart';
import 'package:pictury/features/search/search_view_state.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends BaseBloc<SearchViewState, SearchEvent> {
  @override
  SearchViewState get initialState => SearchViewState.createDefault();

  @override
  Stream<SearchViewState> mapEventToState(SearchEvent event) async* {
    if (event is SearchQueryChangedEvent) {
      yield currentState.rebuild((b) => b..query = event.query);
    }
  }

  @override
  Stream<SearchViewState> transformEvents(
    Stream<SearchEvent> events,
    Stream<SearchViewState> Function(SearchEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<SearchEvent>).debounceTime(
        Duration(milliseconds: 300),
      ),
      next,
    );
  }
}
