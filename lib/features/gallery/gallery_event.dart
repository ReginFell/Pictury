abstract class GalleryEvent {}

class LoadNextPageEvent extends GalleryEvent {
  final String query;

  LoadNextPageEvent(this.query);
}
