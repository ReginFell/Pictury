import 'package:meta/meta.dart';

part 'splash_event.g.dart';

@sealed
abstract class SplashEvent extends SealedSplashEvent {}

class StartSplashEvent extends SplashEvent {}

class EndSplashEvent extends SplashEvent {}
