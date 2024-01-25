package com.connectedinteractive.flutter_connecttracker

import android.content.Context
import android.net.Uri
import android.os.Debug
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.connectedinteractive.connectsdk.ConnectTracker;
import com.connectedinteractive.connectsdk.ConnectTrackerAttribution
import com.connectedinteractive.connectsdk.ConnectTrackerCallback
import com.connectedinteractive.connectsdk.ConnectTrackerEvent
import com.connectedinteractive.connectsdk.ConnectTrackerFailedEvent
import com.connectedinteractive.connectsdk.ConnectTrackerOptions
import com.connectedinteractive.connectsdk.ConnectTrackerSession
import com.connectedinteractive.connectsdk.ConnectTrackerSessionFailed

/** FlutterConnecttrackerPlugin */
class FlutterConnecttrackerPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private val initHelper = ConnectTrackerInitHelper();

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_connecttracker")
        context = flutterPluginBinding.applicationContext
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "init" -> {
                init(call, result)
            }
            "trackEvent" -> {
                trackEvent(call, result)
            }
            "appWillOpenUrl" -> {
                handleDeepLinkOpen(call, result)
            }
            "turnOffTracking" -> {
                ConnectTracker.turnOffTracking()
                result.success(true)
            }
            "turnOnTracking" -> {
                ConnectTracker.turnOnTracking()
                result.success(true)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    private fun handleDeepLinkOpen(call: MethodCall,
                                   result: Result) {
        val url = call.argument<String>("url")
        val uri = Uri.parse(url);
        ConnectTracker.appWillOpenUrl(uri)
        result.success(true)
    }

    private fun trackEvent(call: MethodCall,
                           result: Result) {
        val name = call.argument<String>("name")
        val value = call.argument<String>("value") ?: ""
        ConnectTracker.trackEvent(name, value)
        result.success(true)
    }

    private fun init(
        call: MethodCall,
        result: Result
    ) {
        val options = ConnectTrackerOptions()
        options.appKey = call.argument("appKey")
        options.isSandboxMode = call.argument<Boolean>("sandbox") ?: false
        options.isDisableAdIdTracking = call.argument<Boolean>("disableTracking") ?: false
        val location = call.argument<Boolean>("useLocation") ?: false
        options.setUseLocationServices(location)
        options.context = this.context
        initHelper.init(options, channel);
        result.success(true)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
