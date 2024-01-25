package com.connectedinteractive.flutter_connecttracker

import android.util.Log
import com.connectedinteractive.connectsdk.ConnectTracker
import com.connectedinteractive.connectsdk.ConnectTrackerAttribution
import com.connectedinteractive.connectsdk.ConnectTrackerCallback
import com.connectedinteractive.connectsdk.ConnectTrackerEvent
import com.connectedinteractive.connectsdk.ConnectTrackerFailedEvent
import com.connectedinteractive.connectsdk.ConnectTrackerOptions
import com.connectedinteractive.connectsdk.ConnectTrackerSession
import com.connectedinteractive.connectsdk.ConnectTrackerSessionFailed
import io.flutter.plugin.common.MethodChannel

class ConnectTrackerInitHelper: ConnectTrackerCallback {
    private lateinit var channel: MethodChannel

    fun init(options: ConnectTrackerOptions, channel: MethodChannel) {
        this.channel = channel;
        options.connectTrackerCallback = this;

        ConnectTracker.init(options);
    }
    override fun onEventTracked(p0: ConnectTrackerEvent?) {
        channel.invokeMethod(
            "onEventTracked", mapOf(
                "timestamp" to p0?.timestamp,
                "advertisingId" to p0?.advertisingId,
                "sdkVersion" to p0?.sdkVersion,
                "trackingId" to p0?.trackingId,
                "name" to p0?.name
            )
        ); }

    override fun onEventTrackFailed(p0: ConnectTrackerFailedEvent?) {
        channel.invokeMethod("onEventTrackFailed", p0);
    }

    override fun onAttributionChanged(p0: ConnectTrackerAttribution?) {
        channel.invokeMethod("onAttributionChanged", p0);
    }

    override fun onSessionStartSuccess(p0: ConnectTrackerSession?) {
        Log.d("onSessionStartSuccess", "Session started successfully")
        channel.invokeMethod(
            "onSessionStartSuccess", mapOf(
                "timestamp" to p0?.timestamp,
                "advertisingId" to p0?.advertisingId,
                "sdkVersion" to p0?.sdkVersion,
                "trackingId" to p0?.trackingId
            )
        );
    }

    override fun onSessionStartFailed(p0: ConnectTrackerSessionFailed?) {
        channel.invokeMethod("onSessionStartFailed", p0);
    }
}