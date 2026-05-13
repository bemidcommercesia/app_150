import 'dart:ui';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class PushAlertsNs2kd7pyConfig {
  static PushAlertsNs2kd7pyConfig get to => Get.find();

  final String oneSignalId;
  final bool requestPermissionInstantly;
  final PushAlertsNs2kd7pyNavigationBehaviour behaviour;

  const PushAlertsNs2kd7pyConfig({
    required this.oneSignalId,
    required this.requestPermissionInstantly,
    required this.behaviour,
  });
}

class PushAlertsNs2kd7pyNavigationBehaviour {
  final VoidCallback onForm;
  final VoidCallback? onOpenLinkAdditional;
  final void Function(dynamic)? onForegroundMessage;

  const PushAlertsNs2kd7pyNavigationBehaviour({
    required this.onForm,
    this.onOpenLinkAdditional,
    this.onForegroundMessage,
  });
}
