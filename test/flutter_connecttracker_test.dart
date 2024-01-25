import 'package:flutter_connecttracker/connecttracker_options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_connecttracker/connecttracker.dart';
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
  Future<bool?> resolveDeelink(String url, List urlPrefixes) {
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
}

void main() {
  final ConnectTrackerPlatform initialPlatform =
      ConnectTrackerPlatform.instance;

  test('$MethodChannelConnectTracker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelConnectTracker>());
  });

  test('init', () async {
    ConnectTracker flutterConnecttrackerPlugin = ConnectTracker();
    MockFlutterConnecttrackerPlatform fakePlatform =
        MockFlutterConnecttrackerPlatform();
    ConnectTrackerPlatform.instance = fakePlatform;

    expect(await flutterConnecttrackerPlugin.init(ConnectTrackerOptions('123')), true);
  });
}
