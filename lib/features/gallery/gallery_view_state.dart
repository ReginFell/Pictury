import 'package:built_value/built_value.dart';
import 'package:pictury/domain/gallery/models/gallery_view_model.dart';

part 'gallery_view_state.g.dart';

abstract class GalleryViewState
    implements Built<GalleryViewState, GalleryViewStateBuilder> {
  List<GalleryViewModel> get pictures;

  bool get isLoading;

  @nullable
  Exception get hasError;

  GalleryViewState._();

  static GalleryViewState createDefault() => GalleryViewState(
        (b) => b
          ..pictures = List()
          ..isLoading = false
          ..hasError = null,
      );

  factory GalleryViewState([void Function(GalleryViewStateBuilder) updates]) =
      _$GalleryViewState;
}
