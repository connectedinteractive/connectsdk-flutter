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

class ConnectTrackerInitHelper : ConnectTrackerCallback {
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
                "name" to p0?.name,
                "campaign" to p0?.attribution?.campaign,
                "creative" to p0?.attribution?.creative,
                "lineItem" to p0?.attribution?.lineItem,
                "network" to p0?.attribution?.network,
                "impressionId" to p0?.attribution?.impressionId,
            )
        ); }

    override fun onEventTrackFailed(p0: ConnectTrackerFailedEvent?) {
        channel.invokeMethod(
            "onEventTrackFailed", mapOf(
                "timestamp" to p0?.timestamp,
                "advertisingId" to p0?.advertisingId,
                "sdkVersion" to p0?.sdkVersion,
                "trackingId" to p0?.trackingId,
                "name" to p0?.name,
                "willRetry" to p0?.willRetry(),
                "campaign" to p0?.attribution?.campaign,
                "creative" to p0?.attribution?.creative,
                "lineItem" to p0?.attribution?.lineItem,
                "network" to p0?.attribution?.network,
                "impressionId" to p0?.attribution?.impressionId,
                )
        );
    }

    override fun onAttributionChanged(p0: ConnectTrackerAttribution?) {
        channel.invokeMethod(
            "onAttributionChanged", mapOf(
                "advertisingId" to p0?.advertisingId,
                "sdkVersion" to p0?.sdkVersion,
                "trackingId" to p0?.trackingId,
                "campaign" to p0?.attribution?.campaign,
                "creative" to p0?.attribution?.creative,
                "lineItem" to p0?.attribution?.lineItem,
                "network" to p0?.attribution?.network,
                "impressionId" to p0?.attribution?.impressionId,
                )
        );
    }

    override fun onSessionStartSuccess(p0: ConnectTrackerSession?) {
        channel.invokeMethod(
            "onSessionStartSuccess", mapOf(
                "timestamp" to p0?.timestamp,
                "advertisingId" to p0?.advertisingId,
                "sdkVersion" to p0?.sdkVersion,
                "trackingId" to p0?.trackingId,
                "campaign" to p0?.attribution?.campaign,
                "creative" to p0?.attribution?.creative,
                "lineItem" to p0?.attribution?.lineItem,
                "network" to p0?.attribution?.network,
                "impressionId" to p0?.attribution?.impressionId,
            )
        );
    }

    override fun onSessionStartFailed(p0: ConnectTrackerSessionFailed?) {
        channel.invokeMethod(
            "onSessionStartFailed", mapOf(
                "timestamp" to p0?.timestamp,
                "advertisingId" to p0?.advertisingId,
                "sdkVersion" to p0?.sdkVersion,
                "trackingId" to p0?.trackingId,
                "willRetry" to p0?.willRetry(),
                "campaign" to p0?.attribution?.campaign,
                "creative" to p0?.attribution?.creative,
                "lineItem" to p0?.attribution?.lineItem,
                "network" to p0?.attribution?.network,
                "impressionId" to p0?.attribution?.impressionId,
            )
        );
    }
}