import Flutter
import UIKit
import ConnectTracker

public class FlutterConnecttrackerPlugin: NSObject, FlutterPlugin {
    static var channel: FlutterMethodChannel?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        channel = FlutterMethodChannel(name: "flutter_connecttracker", binaryMessenger: registrar.messenger())
        let instance = FlutterConnecttrackerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel!)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let arguments = call.arguments as? [String: Any]
        switch call.method {
        case "init":
            initSdk(arguments, result: result)
            break
        case "trackEvent":
            trackEvent(arguments, result: result)
            break
        case "appWillOpenUrl":
            appWillOpenUrl(arguments, result: result)
            break
        case "resolveDeeplink":
            handleDeeplink(arguments, result: result)
            break
        case "turnOffTracking":
            ConnectTracker.turnOffTracking()
            result(.some(true))
            break
        case "turnOnTracking":
            ConnectTracker.turnOnTracking()
            result(.some(true))
            break
        case "isInitialized":
            result(.some(ConnectTracker.isInitialized()))
            break
        case "isTrackingOn":
            result(.some(ConnectTracker.isTrackingOn()))
            break
        case "deleteUserData":
            ConnectTracker.deleteUserData()
            result(.some(true))
            break
        case "onWillRequestLocationPermission":
            ConnectTracker.onWillRequestLocationPermission()
            result(.some(true))
            break
        case "onLocationPermissionDenied":
            ConnectTracker.onLocationPermissionDenied()
            result(.some(true))
            break
        case "onLocationPermissionGranted":
            ConnectTracker.onLocationPermissionGranted()
            result(.some(true))
            break
        case "onApplicationPaused":
            ConnectTracker.applicationDidEnterBackground()
            result(true)
            break
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

fileprivate extension FlutterConnecttrackerPlugin {
    func trackEvent(_ arguments: [String: Any]?, result: FlutterResult) {
        guard let arguments = arguments, let name = arguments["name"] as? String else {
            result(.some(false))
            return
        }
        
        let values = arguments["value"] as? String
        ConnectTracker.trackEvent(name, withValue: values ?? "")
        result(.some(true))
    }
    
    func appWillOpenUrl(_ arguments: [String: Any]?, result: FlutterResult) {
        guard let arguments = arguments, let urlString = arguments["url"] as? String, let url = URL(string: urlString) else {
            result(.some(false))
            return
        }
        
        ConnectTracker.appWillOpen(url)
        result(.some(true))
    }
    
    func requestAppTrackingPermissionIfNeeded(_ arguments: [String : Any]) {
        let requestAppTrackingPermission = (arguments["requestAppTrackingPermission"] as? Bool) ?? false
        if(requestAppTrackingPermission && ConnectTracker.needsAppTrackingPermission()) {
            ConnectTracker.requestAppTrackingPermission { permissionResult in
                switch permissionResult {
                case 3:
                    FlutterConnecttrackerPlugin.channel?.invokeMethod("onAppTrackingPermissionGranted", arguments: permissionResult)
                default:
                    FlutterConnecttrackerPlugin.channel?.invokeMethod("onAppTrackingPermissionDenied", arguments: permissionResult)
                }
            }
        }
    }
    
    func initSdk(_ arguments: [String: Any]?, result: FlutterResult) {
        guard let arguments = arguments, let appKey = arguments["iosAppKey"] as? String else {
            result(.some(false))
            return
        }
        
        let options = ConnectTrackerOptions()
        options.appKey = appKey
        options.useLocationServices = (arguments["useLocation"] as? Bool) ?? false
        options.usePushNotifications = (arguments["usePushNotifications"] as? Bool) ?? false
        options.connectTrackerCallback = self
        
        ConnectTracker.`init`(options)
        
        requestAppTrackingPermissionIfNeeded(arguments)
        
        result(true)
    }
    
    func handleDeeplink(_ arguments: [String: Any]?, result: FlutterResult) {
        guard let arguments = arguments, let urlString = arguments["url"] as? String, let url = URL(string: urlString) else {
            result(.some(false))
            return
        }
        
        let urlSuffix = arguments["urlSuffix"] as? [Any];
        
        ConnectTracker.linkResolution(url, urlSuffixArray: urlSuffix)
    }
}

extension FlutterConnecttrackerPlugin: ConnectTrackerCallback {
    public func onDeepLinkResolved(_ url: URL) {
        FlutterConnecttrackerPlugin.channel?.invokeMethod("onEventTracked", arguments: url)
    }
    
    public func onEventTracked(_ connectTrackerEvent: ConnectTrackerEvent) {
        let arguments = [
            "timestamp": connectTrackerEvent.timestamp,
            "advertisingId": connectTrackerEvent.idfa,
            "sdkVersion": connectTrackerEvent.sdkVersion,
            "trackingId": connectTrackerEvent.trackingId,
            "name": connectTrackerEvent.name,
            "campaign": connectTrackerEvent.attribution.campaign,
            "creative": connectTrackerEvent.attribution.creative,
            "impressionId": connectTrackerEvent.attribution.impressionId,
            "lineItem": connectTrackerEvent.attribution.lineItem,
            "network": connectTrackerEvent.attribution.network
            
        ]
        
        FlutterConnecttrackerPlugin.channel?.invokeMethod("onEventTracked", arguments: arguments)
    }
    
    public func onEventTrackFailed(_ connectTrackerFailedEvent: ConnectTrackerFailedEvent) {
        let arguments = [
            "timestamp": connectTrackerFailedEvent.timestamp,
            "advertisingId": connectTrackerFailedEvent.idfa,
            "sdkVersion": connectTrackerFailedEvent.sdkVersion,
            "trackingId": connectTrackerFailedEvent.trackingId,
            "name": connectTrackerFailedEvent.name,
            "campaign": connectTrackerFailedEvent.attribution.campaign,
            "creative": connectTrackerFailedEvent.attribution.creative,
            "impressionId": connectTrackerFailedEvent.attribution.impressionId,
            "lineItem": connectTrackerFailedEvent.attribution.lineItem,
            "network": connectTrackerFailedEvent.attribution.network
            
        ]
        
        FlutterConnecttrackerPlugin.channel?.invokeMethod("onEventTrackFailed", arguments: arguments)
    }
    
    public func onAttributionChanged(_ connectTrackerAttribution: ConnectTrackerAttribution) {
        let arguments = [
            "advertisingId": connectTrackerAttribution.idfa,
            "sdkVersion": connectTrackerAttribution.sdkVersion,
            "trackingId": connectTrackerAttribution.trackingId,
            "campaign": connectTrackerAttribution.attribution.campaign,
            "creative": connectTrackerAttribution.attribution.creative,
            "impressionId": connectTrackerAttribution.attribution.impressionId,
            "lineItem": connectTrackerAttribution.attribution.lineItem,
            "network": connectTrackerAttribution.attribution.network
            
        ]
        
        FlutterConnecttrackerPlugin.channel?.invokeMethod("onAttributionChanged", arguments: arguments)
    }
    
    public func onSessionStartSuccess(_ connectTrackerSession: ConnectTrackerSession) {
        let arguments = [
            "timestamp": connectTrackerSession.timestamp,
            "advertisingId": connectTrackerSession.idfa,
            "sdkVersion": connectTrackerSession.sdkVersion,
            "trackingId": connectTrackerSession.trackingId,
            "campaign": connectTrackerSession.attribution.campaign,
            "creative": connectTrackerSession.attribution.creative,
            "impressionId": connectTrackerSession.attribution.impressionId,
            "lineItem": connectTrackerSession.attribution.lineItem,
            "network": connectTrackerSession.attribution.network
            
        ]
        
        FlutterConnecttrackerPlugin.channel?.invokeMethod("onSessionStartSuccess", arguments: arguments)
    }
    
    public func onSessionStart(_ connectTrackerSessionFailed: ConnectTrackerSessionFailed) {
        let arguments = [
            "timestamp": connectTrackerSessionFailed.timestamp,
            "advertisingId": connectTrackerSessionFailed.idfa,
            "sdkVersion": connectTrackerSessionFailed.sdkVersion,
            "trackingId": connectTrackerSessionFailed.trackingId,
            "campaign": connectTrackerSessionFailed.attribution.campaign,
            "creative": connectTrackerSessionFailed.attribution.creative,
            "impressionId": connectTrackerSessionFailed.attribution.impressionId,
            "lineItem": connectTrackerSessionFailed.attribution.lineItem,
            "network": connectTrackerSessionFailed.attribution.network
            
        ]
        
        FlutterConnecttrackerPlugin.channel?.invokeMethod("connectTrackerSessionFailed", arguments: arguments)
    }
}
