import 'package:flutter/widgets.dart';
import 'package:flutter_connecttracker/connecttracker.dart';

class Second extends StatelessWidget {
  const Second({
    super.key,
    this.color = const Color(0xFF2DBD3A),
    this.child,
  });

  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    ConnectTracker.instance.trackEvent('test_event_new_app', 'Test second screen')
;    return ColoredBox(color: color, child: child);
  }
}