import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class WallpaperChanger {
  static const String tempFileName = 'temp.png';

  static const String setWallpaperMethod = 'setWallpaper';
  static const String wallpaperPathKey = 'wallpaperPathKey';
  static const String wallpaperScreenKey = 'wallpaperScreenKey';

  static const MethodChannel _channel =
      const MethodChannel('wallpaper_changer');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('setWallpaper');
    return version;
  }

  static Future<void> setWallpaper(String url, Screen screen) async {
    final folder = await getTemporaryDirectory();

    var fileSave = new File('${folder.path}/$tempFileName');

    final response = await http.get(url);

    await fileSave.writeAsBytes(response.bodyBytes);

    _channel.invokeMethod(setWallpaperMethod, <String, dynamic>{
      wallpaperPathKey: fileSave.path,
      wallpaperScreenKey: screen.index,
    });
  }
}

enum Screen { Home, Lock }
