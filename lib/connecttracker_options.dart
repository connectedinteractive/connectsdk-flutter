import 'package:flutter_connecttracker/connecttracker_callbacks.dart';

/// Options to initialize the ConnectTracker SDK
class ConnectTrackerOptions {
  String iosAppKey;
  String androidAppKey;
  bool useLocation = false;
  bool isSandbox = false;
  bool isAdIdTrackingDisabled = false;
  bool usePushNotifications = false;
  bool requestAppTrackingPermission = false;

  ConnectTrackerCallbacks? callbacks;
  ConnectTrackerOptions(this.androidAppKey, this.iosAppKey);
}
