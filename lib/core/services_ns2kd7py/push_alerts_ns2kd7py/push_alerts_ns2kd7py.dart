import 'dart:async';
import 'dart:ui';


import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:url_launcher/url_launcher.dart';


import 'models/push_alerts_ns2kd7py_config.dart';
import 'third_party/fcmns2kd7py.dart';
import 'third_party/osns2kd7py.dart';

export 'models/push_alerts_ns2kd7py_config.dart';


class PushAlertsNs2kd7py {
  static final Completer<void> _navigatorns2kd7pyReady = Completer<void>();

  static void signalNavigatorReady() {
    if (!_navigatorns2kd7pyReady.isCompleted) {
      _navigatorns2kd7pyReady.complete();
    }
  }

  static VoidCallback _wrapns2kd7py(VoidCallback onForm) {
    return () async {
      await _navigatorns2kd7pyReady.future;
      onForm();
    };
  }

  static Future<void> init(PushAlertsNs2kd7pyConfig config) async {
    Get.put<PushAlertsNs2kd7pyConfig>(config);


    
  
    await _initOneSignal();
    await _initFcm();
    if(config.requestPermissionInstantly) {
      await requestPermissions();
    }
  }

  static Future<void> handleFCMInitMessage() =>
      Fcmns2kd7pyService.handleLaunchNotification();


  static Future<void> _initFcm() async {
    final config = PushAlertsNs2kd7pyConfig.to;

    return Fcmns2kd7pyService.init(
      onForegroundMessage: config.behaviour.onForegroundMessage,
      onMessageClickBehaviour: Fcmns2kd7pyMessageClickBehaviour(
        onMessageHasUrl: _launchPushUrl,
        onMessageWithoutUrl: _wrapns2kd7py(config.behaviour.onForm),
      ),
    );
  }

  static Future<void> _initOneSignal() async {
    final config = PushAlertsNs2kd7pyConfig.to;

    final oneSignalConfig = PushAlertsNs2kd7pyConfig(
      oneSignalId: config.oneSignalId,
      requestPermissionInstantly: config.requestPermissionInstantly,
      behaviour: PushAlertsNs2kd7pyNavigationBehaviour(
        onForm: _wrapns2kd7py(config.behaviour.onForm),
      ),
    );

    return OSns2kd7pyService.init(
      config: oneSignalConfig,
      onMessageHasUrl: _launchPushUrl,
    );
  }

  static Future<void> requestPermissions() async {
    await OSns2kd7pyService.requestPermissions();
    
    await Fcmns2kd7pyService.requestPermissions();
  }

  static Future<void> _launchPushUrl(String url) async {
    final config = PushAlertsNs2kd7pyConfig.to;
    unawaited(launchUrl(Uri.parse(url), mode: .externalApplication));
    config.behaviour.onOpenLinkAdditional?.call();
  }

  
}
