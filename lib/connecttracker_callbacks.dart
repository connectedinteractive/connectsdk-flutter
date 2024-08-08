import 'package:flutter/foundation.dart';

/// Callback methods that will be called by the SDK on certain events.
class ConnectTrackerCallbacks {
  ValueChanged<dynamic>? onEventTracked;
  ValueChanged<dynamic>? onEventTrackedFailed;
  ValueChanged<dynamic>? onAttributionChanged;
  ValueChanged<dynamic>? onSessionStartSuccess;
  ValueChanged<dynamic>? onSessionStartFailed;
  ValueChanged<dynamic>? onAppTrackingPermissionGranted;
  ValueChanged<dynamic>? onAppTrackingPermissionDenied;
  ValueChanged<dynamic>? onDeeplinkResolved;
}
