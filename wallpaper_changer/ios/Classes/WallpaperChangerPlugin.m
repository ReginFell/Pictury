#import "WallpaperChangerPlugin.h"
#import <wallpaper_changer/wallpaper_changer-Swift.h>

@implementation WallpaperChangerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftWallpaperChangerPlugin registerWithRegistrar:registrar];
}
@end
