import 'package:built_value/built_value.dart';

part 'gallery_details_view_state.g.dart';

abstract class GalleryDetailsViewState
    implements Built<GalleryDetailsViewState, GalleryDetailsViewStateBuilder> {
  bool get isFavorite;

  bool get isLoading;

  GalleryDetailsViewState._();

  static GalleryDetailsViewState createDefault() => GalleryDetailsViewState(
        (b) => b
          ..isFavorite = false
          ..isLoading = false,
      );

  factory GalleryDetailsViewState(
          [void Function(GalleryDetailsViewStateBuilder) updates]) =
      _$GalleryDetailsViewState;
}
