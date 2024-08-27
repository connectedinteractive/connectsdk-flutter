import 'package:flutter_connecttracker/connecttracker_options.dart';

import 'connecttracker_platform_interface.dart';

/// ConnectTracker base class to start attributing events.
class ConnectTracker {
  static final ConnectTracker _instance = ConnectTracker();
  static ConnectTracker get instance => _instance;

  /// Initializes the SDK with the [ConnectTrackerOptions].
  Future<bool?> init(ConnectTrackerOptions options) {
    return ConnectTrackerPlatform.instance.init(options);
  }

  /// Tracks a single event by [name] and [value].
  Future<bool?> trackEvent(String name, dynamic value) {
    return ConnectTrackerPlatform.instance.trackEvent(name, value);
  }

  /// Handles deeplink app open.
  void appWillOpenUrl(String? url) {
    ConnectTrackerPlatform.instance.appWillOpenUrl(url);
  }

  /// Resolves a deeplink when it has been open from an email client.
  void resolveDeeplink(String url, List urlPrefixes) {
    ConnectTrackerPlatform.instance.resolveDeeplink(url, urlPrefixes);
  }

  /// Turn off SDK tracking.
  void turnOffTracking() {
    ConnectTrackerPlatform.instance.turnOffTracking();
  }

  /// Turn on SDK tracking.
  void turnOnTracking() {
    ConnectTrackerPlatform.instance.turnOnTracking();
  }

  /// Checks if the SDK is initialized
  Future<bool?> isInitialized() {
    return ConnectTrackerPlatform.instance.isInitialized();
  }

  /// Checks if tracking is on
  Future<bool?> isTrackingOn() {
    return ConnectTrackerPlatform.instance.isTrackingOn();
  }

  /// Deletes user device data from the server
  void deleteUserData() {
    ConnectTrackerPlatform.instance.deleteUserData();
  }

  /// Handler method when location permission will be requested.
  void onWillRequestLocationPermission() {
    ConnectTrackerPlatform.instance.onWillRequestLocationPermission();
  }

  /// Handler method when location permission has been denied.
  void onLocationPermissionDenied() {
    ConnectTrackerPlatform.instance.onLocationPermissionDenied();
  }

  /// Handler method when location premission has been granted.
  void onLocationPermissionGranted() {
    ConnectTrackerPlatform.instance.onLocationPermissionGranted();
  }

  /// Handler method when the application has been paused.
  void onApplicationPaused() {
    ConnectTrackerPlatform.instance.onApplicationPaused();
  }
}
