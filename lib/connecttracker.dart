import 'package:flutter_connecttracker/connecttracker_options.dart';

import 'connecttracker_platform_interface.dart';

class ConnectTracker {
  Future<bool?> init(ConnectTrackerOptions options) {
    return ConnectTrackerPlatform.instance.init(options);
  }

  Future<bool?> trackEvent(String name, dynamic value) {
    return ConnectTrackerPlatform.instance.trackEvent(name, value);
  }

  void appWillOpenUrl(String url) {
    ConnectTrackerPlatform.instance.appWillOpenUrl(url);
  }

  void resolveDeeplink(String url, List urlPrefixes) {
    ConnectTrackerPlatform.instance.resolveDeeplink(url, urlPrefixes);
  }

  void turnOffTracking() {
    ConnectTrackerPlatform.instance.turnOffTracking();
  }

  void turnOnTracking() {
    ConnectTrackerPlatform.instance.turnOnTracking();
  }

  Future<bool?> isInitialized() {
    return ConnectTrackerPlatform.instance.isInitialized();
  }

  Future<bool?> isTrackingOn() {
    return ConnectTrackerPlatform.instance.isTrackingOn();
  }

  void deleteUserData() {
    ConnectTrackerPlatform.instance.deleteUserData();
  }

  void onWillRequestLocationPermission() {
    ConnectTrackerPlatform.instance.onWillRequestLocationPermission();
  }

  void onLocationPermissionDenied() {
    ConnectTrackerPlatform.instance.onLocationPermissionDenied();
  }

  void onLocationPermissionGranted() {
    ConnectTrackerPlatform.instance.onLocationPermissionGranted();
  }

  void onApplicationPaused() {
    ConnectTrackerPlatform.instance.onApplicationPaused();
  }
}
