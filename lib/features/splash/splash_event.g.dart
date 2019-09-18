// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_event.dart';

// **************************************************************************
// SealedClassGenerator
// **************************************************************************

class SealedSplashEvent {
  R when<R>({
    @required R Function(StartSplashEvent) startSplashEvent,
    @required R Function(EndSplashEvent) endSplashEvent,
  }) {
    if (this is StartSplashEvent) {
      return startSplashEvent(this as StartSplashEvent);
    }
    if (this is EndSplashEvent) {
      return endSplashEvent(this as EndSplashEvent);
    }
    throw new Exception(
        'If you got here, probably you forgot to regenerate the classes? Try running flutter packages pub run build_runner build');
  }
}
