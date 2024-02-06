import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_connecttracker/connecttracker_options.dart';

import 'connecttracker_platform_interface.dart';

/// An implementation of [FlutterConnecttrackerPlatform] that uses method channels.
class MethodChannelConnectTracker extends ConnectTrackerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_connecttracker');
  ConnectTrackerOptions? _options;

  Future<void> _methodCallHandler(MethodCall call) async {
    switch (call.method) {
      case 'onEventTracked':
        _options?.callbacks?.onEventTracked?.call(call.arguments);
        break;
      case 'onEventTrackFailed':
        _options?.callbacks?.onEventTrackedFailed?.call(call.arguments);
        break;
      case 'onAttributionChanged':
        _options?.callbacks?.onAttributionChanged?.call(call.arguments);
        break;
      case 'onSessionStartSuccess':
        _options?.callbacks?.onSessionStartSuccess?.call(call.arguments);
        break;
      case 'onSessionStartFailed':
        _options?.callbacks?.onSessionStartFailed?.call(call.arguments);
        break;
      case 'onAppTrackingPermissionGranted':
        _options?.callbacks?.onAppTrackingPermissionGranted
            ?.call(call.arguments);
        break;
      case 'onAppTrackingPermissionDenied':
        _options?.callbacks?.onSessionStartFailed?.call(call.arguments);
        break;
      default:
    }
  }

  @override
  Future<bool?> init(ConnectTrackerOptions options) async {
    _options = options;
    methodChannel.setMethodCallHandler(_methodCallHandler);

    final result =
        await methodChannel.invokeMethod<bool>('init', <String, dynamic>{
      'androidAppKey': options.androidAppKey,
      'iosAppKey': options.iosAppKey,
      'sandbox': options.isSandbox,
      'disableTracking': options.isAdIdTrackingDisabled,
      'useLocation': options.useLocation,
      'requestAppTrackingPermission': options.requestAppTrackingPermission,
      'usePushNotifications': options.usePushNotifications
    });

    return result;
  }

  @override
  Future<bool?> trackEvent(String name, value) async {
    final result = await methodChannel.invokeMethod<bool>(
        'trackEvent', <String, dynamic>{'name': name, 'value': value});

    return result;
  }

  @override
  Future<bool?> appWillOpenUrl(String url) async {
    final result = await methodChannel
        .invokeMethod<bool>('appWillOpenUrl', <String, dynamic>{'url': url});

    return result;
  }

  @override
  Future<bool?> deleteUserData() async {
    final result = await methodChannel.invokeMethod<bool>('deleteUserData');
    return result;
  }

  @override
  Future<bool?> isInitialized() async {
    final result = await methodChannel.invokeMethod<bool>('isInitialized');
    return result;
  }

  @override
  Future<bool?> isTrackingOn() async {
    final result = await methodChannel.invokeMethod<bool>('isTrackingOn');
    return result;
  }

  @override
  Future<bool?> resolveDeeplink(String url, List urlPrefixes) async {
    final result = await methodChannel.invokeMethod<bool>('resolveDeeplink',
        <String, dynamic>{'url': url, 'urlPrefixes': urlPrefixes});

    return result;
  }

  @override
  Future<bool?> turnOffTracking() async {
    final result = await methodChannel.invokeMethod<bool>('turnOffTracking');
    return result;
  }

  @override
  Future<bool?> turnOnTracking() async {
    final result = await methodChannel.invokeMethod<bool>('turnOnTracking');
    return result;
  }

  @override
  Future<bool?> onLocationPermissionDenied() async {
    final result =
        await methodChannel.invokeMethod<bool>('onLocationPermissionDenied');
    return result;
  }

  @override
  Future<bool?> onLocationPermissionGranted() async {
    final result =
        await methodChannel.invokeMethod<bool>('onLocationPermissionGranted');
    return result;
  }

  @override
  Future<bool?> onWillRequestLocationPermission() async {
    final result = await methodChannel
        .invokeMethod<bool>('onWillRequestLocationPermission');
    return result;
  }

  @override
  Future<bool?> onApplicationPaused() async {
    final result = await methodChannel.invokeMethod('onApplicationPaused');
    return result;
  }
}
