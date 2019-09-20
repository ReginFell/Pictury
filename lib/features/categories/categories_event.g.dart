// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_event.dart';

// **************************************************************************
// SealedClassGenerator
// **************************************************************************

class SealedCategoriesEvent {
  R when<R>({
    @required R Function(InitLoadingEvent) initLoadingEvent,
    @required R Function(SelectCategoryEvent) selectCategoryEvent,
    @required R Function(ContinueEvent) continueEvent,
    @required R Function(SearchQueryChangedEvent) searchQueryChangedEvent,
  }) {
    if (this is InitLoadingEvent) {
      return initLoadingEvent(this as InitLoadingEvent);
    }
    if (this is SelectCategoryEvent) {
      return selectCategoryEvent(this as SelectCategoryEvent);
    }
    if (this is ContinueEvent) {
      return continueEvent(this as ContinueEvent);
    }
    if (this is SearchQueryChangedEvent) {
      return searchQueryChangedEvent(this as SearchQueryChangedEvent);
    }
    throw new Exception(
        'If you got here, probably you forgot to regenerate the classes? Try running flutter packages pub run build_runner build');
  }
}
