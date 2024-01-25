import 'package:flutter_connecttracker/connecttracker_options.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'connecttracker_method_channel.dart';

abstract class ConnectTrackerPlatform extends PlatformInterface {
  /// Constructs a FlutterConnecttrackerPlatform.
  ConnectTrackerPlatform() : super(token: _token);

  static final Object _token = Object();

  static ConnectTrackerPlatform _instance = MethodChannelConnectTracker();

  /// The default instance of [ConnectTrackerPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterConnecttracker].
  static ConnectTrackerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterConnecttrackerPlatform] when
  /// they register themselves.
  static set instance(ConnectTrackerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> init(ConnectTrackerOptions options){
    throw UnimplementedError('init has not been implemented.');
  }

  Future<bool?> trackEvent(String name, dynamic value) {
    throw UnimplementedError('trackEvent has not been implemented');
  }

  Future<bool?> resolveDeelink(String url, List urlPrefixes) {
    throw UnimplementedError('resolveDeelink has not been implemented');
  }

  Future<bool?> isTrackingOn() {
    throw UnimplementedError('isTrackingOn has not been implemented');
  }

    Future<bool?> turnOnTracking() {
    throw UnimplementedError('turnOnTracking has not been implemented');
  }

  Future<bool?> turnOffTracking() {
    throw UnimplementedError('turnOffTracking has not been implemented');
  }

    Future<bool?> isInitialized() {
    throw UnimplementedError('turnOffTracking has not been implemented');
  }

    Future<bool?> deleteUserData() {
    throw UnimplementedError('turnOffTracking has not been implemented');
  }
}
