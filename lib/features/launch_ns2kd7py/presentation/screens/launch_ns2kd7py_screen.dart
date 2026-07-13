import 'dart:async';

import 'package:feedback_popup_ns2kd7py/feedback_popup_ns2kd7py.dart';
import 'package:flutter/material.dart';

import '../../../../core/services_ns2kd7py/appsflyer_analytics_ns2kd7py/appsflyer_wrapper_ns2kd7py.dart';

class LaunchNs2kd7pyScreen extends StatefulWidget {
  const LaunchNs2kd7pyScreen({super.key});

  @override
  State<LaunchNs2kd7pyScreen> createState() => _LaunchNs2kd7pyScreenState();
}

class _LaunchNs2kd7pyScreenState extends State<LaunchNs2kd7pyScreen> {
  @override
  void initState() {
    super.initState();
    // Request ATT only once the UI is on screen and the app is in the active
    // (foreground) state — iOS silently drops the prompt otherwise.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(AppsflyerAnalyticsNs2kd7py.requestTrackingAuthorizationIfNeeded());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const FeedbackPopupns2kd7pyWrapper(
      child: SizedBox.expand(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage('assets/images/png/splash_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
