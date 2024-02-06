import 'package:flutter_connecttracker/connecttracker_options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_connecttracker/connecttracker_platform_interface.dart';
import 'package:flutter_connecttracker/connecttracker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterConnecttrackerPlatform
    with MockPlatformInterfaceMixin
    implements ConnectTrackerPlatform {
  @override
  Future<bool?> init(ConnectTrackerOptions options) => Future.value(true);
  
  @override
  Future<bool?> trackEvent(String name, value) => Future.value(true);
  
  @override
  Future<bool?> deleteUserData() {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> isInitialized() {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> isTrackingOn() {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> resolveDeeplink(String url, List urlPrefixes) {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> turnOffTracking() {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> turnOnTracking() {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> appWillOpenUrl(String url) {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> onLocationPermissionDenied() {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> onLocationPermissionGranted() {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> onWillRequestLocationPermission() {
    throw UnimplementedError();
  }

  @override
  Future<bool?> onApplicationPaused() {
    throw UnimplementedError();
  }
}

void main() {
  final ConnectTrackerPlatform initialPlatform =
      ConnectTrackerPlatform.instance;

  test('$MethodChannelConnectTracker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelConnectTracker>());
  });
}
