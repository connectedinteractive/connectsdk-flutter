import 'package:flutter_connecttracker/connecttracker_options.dart';

import 'connecttracker_platform_interface.dart';

class ConnectTracker {
  Future<bool?> init(ConnectTrackerOptions options) {
    return ConnectTrackerPlatform.instance.init(options);
  }

  Future<bool?> trackEvent(String name, dynamic value) {
    return ConnectTrackerPlatform.instance.trackEvent(name, value);
  }

  Future<bool?> isInitialized() {
    return ConnectTrackerPlatform.instance.isInitialized();
  }

  Future<bool?> isTrackingOn() {
    return ConnectTrackerPlatform.instance.isTrackingOn();
  }

  Future<bool?> turnOnTracking() {
    return ConnectTrackerPlatform.instance.turnOnTracking();
  }

  Future<bool?> turnOffTracking() {
    return ConnectTrackerPlatform.instance.turnOffTracking();
  }

  Future<bool?> deleteUserData() {
    return ConnectTrackerPlatform.instance.deleteUserData();
  }

    Future<bool?> resolveDeelink(String url, List urlPrefixes) {
    return ConnectTrackerPlatform.instance.resolveDeelink(url, urlPrefixes);
  }
}
