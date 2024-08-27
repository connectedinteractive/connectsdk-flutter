
import 'package:flutter/material.dart';
import 'package:flutter_connecttracker/connecttracker.dart';
import 'package:flutter_connecttracker/connecttracker_callbacks.dart';
import 'package:flutter_connecttracker/connecttracker_options.dart';
import 'package:flutter_connecttracker_example/second.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<StatefulWidget> createState() {
    return FirstScreenState();
  }

}

class FirstScreenState extends State<First> {

  final textEditingController = TextEditingController();

  String _message = "";
  bool _initialized = false;
  bool _isOn = true;


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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(children: [
          const Text('Running on: Android\n'),
          Text(_message),
          if (!_initialized)
            TextButton(
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
          if (_isOn && _initialized)
            FilledButton(
                onPressed: () async => {
                      ConnectTracker.instance.trackEvent(
                          textEditingController.text, null)
                    },
                child: const Text("Track Event")),
          if (_isOn && _initialized)
            FilledButton(
              onPressed: () async {
                ConnectTracker.instance.turnOffTracking();
                setState(() {
                  _isOn = false;
                });
              },
              style: const ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll<Color>(Colors.grey)),
              child: const Text("TurnOff SDK"),
            ),
          if (!_isOn && _initialized)
            FilledButton(
              onPressed: () async {
                ConnectTracker.instance.turnOnTracking();
                setState(() {
                  _isOn = true;
                });
              },
              style: const ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll<Color>(Colors.deepPurpleAccent)),
              child: const Text("Turn On SDK"),
            ),
          if (_isOn && _initialized)
            FilledButton(onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Second()),
              );
            }, child: const Text("Second Screen"))

        ]),
      );
  }

Future<void> initializeSDK() async {
    var options = ConnectTrackerOptions("", "");
    var callbacks = ConnectTrackerCallbacks();
    callbacks.onSessionStartSuccess =
        (value) => setState(() => _message = "Received session");
    callbacks.onEventTracked =
        (value) => setState(() => _message = "Event Tracked $value");
    callbacks.onEventTrackedFailed =
        (value) => setState(() => _message = "Event failed $value");
    
    callbacks.onDeeplinkResolved = (deepLinkd) {
      ConnectTracker.instance.appWillOpenUrl(deepLinkd);
    };
    
    options.callbacks = callbacks;
    final initialized =
        await ConnectTracker.instance.init(options) ?? false;

    setState(() {
      _initialized = initialized;
    });
  }
}