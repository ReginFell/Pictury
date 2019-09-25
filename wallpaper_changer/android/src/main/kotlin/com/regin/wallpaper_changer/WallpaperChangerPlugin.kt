package com.regin.wallpaper_changer

import android.app.Activity
import android.app.Application
import android.graphics.Bitmap
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import android.app.WallpaperManager
import android.net.Uri
import java.io.IOException
import com.sun.tools.corba.se.idl.Util.getAbsolutePath
import android.graphics.BitmapFactory


class WallpaperChangerPlugin(private val activity: Activity) : MethodCallHandler {

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "wallpaper_changer")
            channel.setMethodCallHandler(WallpaperChangerPlugin(registrar.activity()))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "setWallpaper") {

            result.success()
        } else {
            result.notImplemented()
        }
    }

    fun setWallpaper(uri: Uri) {
        val wallpaperManager = WallpaperManager.getInstance(activity)
        try {
            val bitmap = BitmapFactory.decodeFile(uri.path)

            wallpaperManager.setBitmap(bitmap)
        } catch (ex: IOException) {
            ex.printStackTrace()
        }

    }
}
