import 'dart:async';
import 'dart:developer';

import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../models/push_alerts_ns2kd7py_config.dart';

class OSns2kd7pyService {
  static Future<void> init({
    required PushAlertsNs2kd7pyConfig config,
    required void Function(String) onMessageHasUrl,
  }) async {
    await OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    

    await OneSignal.initialize(config.oneSignalId);

    await OneSignal.Location.setShared(false);

    OneSignal.Notifications.addClickListener((res) async {
      final url = res.notification.additionalData?.values.firstOrNull as String?;
      
      if (url != null && url.isNotEmpty) {
        onMessageHasUrl(url);
      } else if (res.notification.launchUrl == null ||
          (res.notification.launchUrl?.isEmpty ?? true)) {
        Timer(const Duration(milliseconds: 600), config.behaviour.onForm);
      }
    });
  }

  static Future<void> requestPermissions() async {
    final canRequest = await OneSignal.Notifications.canRequest();
    log('OneSignal canRequest permission: $canRequest', name: '🔔 OneSignal');
    if (!canRequest) return;

    final granted = await OneSignal.Notifications.requestPermission(true);
    log('OneSignal permission granted: $granted', name: '🔔 OneSignal');
    if (granted) {
      await OneSignal.User.pushSubscription.optIn();
    }
  }

  
}
