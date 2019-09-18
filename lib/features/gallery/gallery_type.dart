class GalleryType {}

class RemoteGalleryType extends GalleryType {
  final String query;

  RemoteGalleryType(this.query);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RemoteGalleryType &&
          runtimeType == other.runtimeType &&
          query == other.query;

  @override
  int get hashCode => query.hashCode;

  @override
  String toString() {
    return 'RemoteGalleryType{query: $query}';
  }
}

class FavoriteGalleryType extends GalleryType {
  @override
  String toString() {
    return 'FavoriteGalleryType{}';
  }
}
