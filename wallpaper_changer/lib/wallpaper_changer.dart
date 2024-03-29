import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class WallpaperChanger {
  static const String setWallpaperMethod = 'setWallpaper';
  static const String lockScreenSupported = 'isLockScreenSupported';
  static const String wallpaperPathKey = 'wallpaperPathKey';
  static const String wallpaperScreenKey = 'wallpaperScreenKey';

  static const MethodChannel _channel =
      const MethodChannel('wallpaper_changer');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('setWallpaper');
    return version;
  }

  static Future<void> setWallpaper(File file, Screen screen) async {
    _channel.invokeMethod(setWallpaperMethod, <String, dynamic>{
      wallpaperPathKey: file.path,
      wallpaperScreenKey: screen.index,
    });
  }

  static Future<bool> isLockScreenSupported() async {
    final bool result = await _channel.invokeMethod(lockScreenSupported);
    return result;
  }
}

enum Screen { Home, Lock }
