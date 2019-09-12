class SearchEvent {}

class SearchQueryChangedEvent extends SearchEvent {
  final String query;

  SearchQueryChangedEvent(this.query);
}
