import 'package:flutter_connecttracker/connecttracker_callbacks.dart';

class ConnectTrackerOptions {
  String appKey;
  bool useLocation = false;
  bool isSandbox = false;
  bool isAdIdTrackingDisabled = false;
  ConnectTrackerCallbacks? callbacks;

  ConnectTrackerOptions(this.appKey);
}