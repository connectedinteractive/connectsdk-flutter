import 'package:flutter/services.dart';
import 'package:flutter_connecttracker/connecttracker_options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_connecttracker/connecttracker_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelConnectTracker platform = MethodChannelConnectTracker();
  const MethodChannel channel = MethodChannel('flutter_connecttracker');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.init(ConnectTrackerOptions('123')), '42');
  });
}
