import 'package:built_value/built_value.dart';

part 'splash_view_state.g.dart';

abstract class SplashViewState
    implements Built<SplashViewState, SplashViewStateBuilder> {
  bool get isSplashActive;

  bool get isCategoriesSelected;

  SplashViewState._();

  static SplashViewState createDefault() => SplashViewState(
        (b) => b
          ..isSplashActive = true
          ..isCategoriesSelected = false,
      );

  factory SplashViewState([void Function(SplashViewStateBuilder) updates]) =
      _$SplashViewState;
}
