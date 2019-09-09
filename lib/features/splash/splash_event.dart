import 'package:meta/meta.dart';

@sealed
abstract class SplashEvent {}

class StartSplashEvent extends SplashEvent {}

class EndSplashEvent extends SplashEvent {}
