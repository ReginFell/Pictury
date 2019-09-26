package com.regin.wallpaper_changer

import android.app.Activity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import android.app.WallpaperManager
import android.graphics.BitmapFactory

class WallpaperChangerPlugin(private val activity: Activity) : MethodCallHandler {

    companion object {

        const val WALLPAPER_PATH_KEY: String = "wallpaperPathKey"
        const val WALLPAPER_SCREEN_KEY: String = "wallpaperScreenKey"

        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "wallpaper_changer")
            channel.setMethodCallHandler(WallpaperChangerPlugin(registrar.activity()))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "setWallpaper") {
            setWallpaper(call.argument(WALLPAPER_PATH_KEY)!!, call.argument(WALLPAPER_SCREEN_KEY)!!)

            result.success("")
        } else {
            result.notImplemented()
        }
    }

    private fun setWallpaper(filePath: String, screenIndex: Int) {
        val wallpaperManager = WallpaperManager.getInstance(activity)
        try {
            val bitmap = BitmapFactory.decodeFile(filePath)

            wallpaperManager.setBitmap(bitmap)
        } catch (ex: Throwable) {
            ex.printStackTrace()
        }

    }
}
