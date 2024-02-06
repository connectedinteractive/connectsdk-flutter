// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

import 'dart:async';

import 'package:flutter_connecttracker/connecttracker_options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_connecttracker/connecttracker_callbacks.dart';

import 'package:flutter_connecttracker/connecttracker.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("SDk init tests", () {
    test("Test sdk is initialized with proper App Keys", () async {
      final options = ConnectTrackerOptions("fc8cb1dd304c1060acec8b52f5342cea",
          "5166d4ddf0c0ad2e6d84d3b100730966");
      final flutterConnecttrackerPlugin = ConnectTracker();

      final isInitialized = await flutterConnecttrackerPlugin.init(options);
      Future.delayed(const Duration(seconds: 10));

      expectLater(isInitialized, true);
    });
  });

  group("Tracking event tests", () {
    test("Track custom event with null value", () async {
      final completer = Completer<String>();
      final options = ConnectTrackerOptions("fc8cb1dd304c1060acec8b52f5342cea",
          "5166d4ddf0c0ad2e6d84d3b100730966");
      final flutterConnecttrackerPlugin = ConnectTracker();
      final callbacks = ConnectTrackerCallbacks();

      callbacks.onEventTracked = (value) => completer.complete(value['name']);
      callbacks.onEventTrackedFailed = (value) => completer.complete('failed');

      options.callbacks = callbacks;
      await flutterConnecttrackerPlugin.init(options);
      Future.delayed(const Duration(seconds: 10));
      await flutterConnecttrackerPlugin.trackEvent("test_event_mapping", null);
      Future.delayed(const Duration(seconds: 10));

      expectLater(completer.future, completion("CI_EVENT_test_event_mapping"));
    });

    test("Track custom event with empty string", () async {
      final completer = Completer<String>();
      final options = ConnectTrackerOptions("fc8cb1dd304c1060acec8b52f5342cea",
          "5166d4ddf0c0ad2e6d84d3b100730966");
      final flutterConnecttrackerPlugin = ConnectTracker();
      final callbacks = ConnectTrackerCallbacks();

      callbacks.onEventTracked = (value) => completer.complete(value['name']);
      callbacks.onEventTrackedFailed = (value) => completer.complete('failed');

      options.callbacks = callbacks;
      await flutterConnecttrackerPlugin.init(options);
      Future.delayed(const Duration(seconds: 10));
      await flutterConnecttrackerPlugin.trackEvent("test_event_mapping", "");

      expectLater(completer.future, completion("CI_EVENT_test_event_mapping"));
    });

    test("Track custom event with value", () async {
      final completer = Completer<String>();
      final options = ConnectTrackerOptions("fc8cb1dd304c1060acec8b52f5342cea",
          "5166d4ddf0c0ad2e6d84d3b100730966");
      final flutterConnecttrackerPlugin = ConnectTracker();
      final callbacks = ConnectTrackerCallbacks();

      callbacks.onEventTracked = (value) => completer.complete(value['name']);
      callbacks.onEventTrackedFailed = (value) => completer.complete('failed');

      options.callbacks = callbacks;
      await flutterConnecttrackerPlugin.init(options);
      Future.delayed(const Duration(seconds: 10));
      await flutterConnecttrackerPlugin.trackEvent(
          "test_event_mapping", "this is from flutter");

      expectLater(completer.future, completion("CI_EVENT_test_event_mapping"));
    });
  });

  group("SDK Status State", () {
    test("Test turn off tracking", () async {
      final options = ConnectTrackerOptions("fc8cb1dd304c1060acec8b52f5342cea",
          "5166d4ddf0c0ad2e6d84d3b100730966");
      final flutterConnecttrackerPlugin = ConnectTracker();

      await flutterConnecttrackerPlugin.init(options);
      Future.delayed(const Duration(seconds: 10));
      flutterConnecttrackerPlugin.turnOffTracking();
      Future.delayed(const Duration(seconds: 10));

      var isTrackingOn = await flutterConnecttrackerPlugin.isTrackingOn();
      expect(isTrackingOn, false);
    });

    test("Test turn on tracking", () async {
      final options = ConnectTrackerOptions("fc8cb1dd304c1060acec8b52f5342cea",
          "5166d4ddf0c0ad2e6d84d3b100730966");
      final flutterConnecttrackerPlugin = ConnectTracker();

      await flutterConnecttrackerPlugin.init(options);
      Future.delayed(const Duration(seconds: 10));
      flutterConnecttrackerPlugin.turnOffTracking();
      Future.delayed(const Duration(seconds: 10));

      var isTrackingOn = await flutterConnecttrackerPlugin.isTrackingOn();
      expect(isTrackingOn, false);
      flutterConnecttrackerPlugin.turnOnTracking();
      Future.delayed(const Duration(seconds: 10));
      isTrackingOn = await flutterConnecttrackerPlugin.isTrackingOn();
      expect(isTrackingOn, true);
    });
  });
}
