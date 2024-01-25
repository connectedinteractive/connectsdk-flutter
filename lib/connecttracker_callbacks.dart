import 'package:flutter/foundation.dart';

class ConnectTrackerCallbacks {
  ValueChanged<dynamic>? onEventTracked;
  ValueChanged<dynamic>? onEventTrackedFailed;
  ValueChanged<dynamic>? onAttributionChanged;
  ValueChanged<dynamic>? onSessionStartSuccess;
  ValueChanged<dynamic>? onSessionStartFailed;
}