import 'dart:async';

import 'package:flutter/services.dart';

class WallpaperChanger {
  static const MethodChannel _channel =
      const MethodChannel('wallpaper_changer');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
