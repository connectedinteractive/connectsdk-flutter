import 'package:flutter/material.dart';

import 'package:flutter_connecttracker/connecttracker.dart';
import 'package:flutter_connecttracker/connecttracker_callbacks.dart';
import 'package:flutter_connecttracker/connecttracker_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _flutterConnecttrackerPlugin = ConnectTracker();
  String _message = "";
  bool _initialized = false;
  bool _isOn = true;

  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(children: [
          const Text('Running on: Android\n'),
          Text(_message),
          if(!_initialized) TextButton(
              onPressed: () async {
                await initializeSDK();
              },
              child: const Text('Init SDK')),
          TextField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "event name to track"),
            controller: textEditingController,
            enabled: _initialized && _isOn,
          ),
          if(_isOn && _initialized) FilledButton(
              onPressed: () async => {
                    await _flutterConnecttrackerPlugin.trackEvent(
                        textEditingController.text, null)
                  },
              child: const Text("Track Event")),
          if(_isOn && _initialized) FilledButton(
            onPressed: () async {
              await _flutterConnecttrackerPlugin.turnOffTracking();
              setState(() {
                _isOn = false;
              });
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey)
              ),
            child: const Text("TurnOff SDK"),
          ),
          if(!_isOn && _initialized) FilledButton(
            onPressed: () async {
              await _flutterConnecttrackerPlugin.turnOnTracking();
              setState(() {
                _isOn = true;
              });
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.deepPurpleAccent)
              ),
            child: const Text("Turn On SDK"),
          ),
        ]),
      ),
    );
  }

  Future<void> initializeSDK() async {
    var options =
        ConnectTrackerOptions("fc8cb1dd304c1060acec8b52f5342cea");
    var callbacks = ConnectTrackerCallbacks();
    callbacks.onSessionStartSuccess =
        (value) => setState(() => _message = "Received session");
    callbacks.onEventTracked = (value) =>
        setState(() => _message = "Event Tracked $value[\"name\"]");
    
    options.callbacks = callbacks;
    
    await _flutterConnecttrackerPlugin.init(options);
    setState(() {
      _initialized = true;
    });
  }
}
