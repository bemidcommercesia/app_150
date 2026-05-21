import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

@pragma('vm:entry-point')
Future<void> onBackgroundOrTerminatedMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  log(
    'Handling a background or terminated message: ${message.messageId}',
    name: '✉️ FCM',
  );

  /// Put your code here
}

///Firebase Messaging wrapper
///Usage:
///
/// in [main.dart]
///
/// ```dart
/// Future<void> main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///
///   await Firebase.initializeApp();
///
///   await FcmService.requestPermission(); //if you want instantly
///   await FcmService.init();
///
///   // Handle case when user LAUNCHED app via Notification
///   // The delay only for showing HomeScreen
///   //
///   // You also can call FcmService.handleLaunchNotification() in initState()
///   // when HomeScreen will show in the application
///   Future<void>.delayed(
///     const Duration(seconds: 1),
///     FcmService.handleLaunchNotification,
///   );
///   runApp(const MainApp());
/// }
/// ```
class Fcmns2kd7pyService {
  static final Set<String> _handledLaunchMessageIds = <String>{};

  static Future<NotificationSettings> _requestPermission() =>
      FirebaseMessaging.instance.requestPermission(
        providesAppNotificationSettings: true,
        provisional: true,
      );

  /// Requests permission for display a messages
  /// if you specified
  /// ```dart
  ///  await FcmService.init(requestPermissionInstantly: true);
  /// ```
  ///
  /// there is no need to call it manually
  static Future<void> requestPermissions() => _handlePermission();

  /// If [requestPermissionInstantly] = false you must call manually
  /// ```dart
  /// await FcmService.requestPermission();
  /// ```
  /// in HomeScreen or wherever you want
  ///
  ///
  ///
  /// In [onMessageClickBehaviour] you  can specify what will happen when the user
  /// clicks on the message with or without 'url' or 'link' parameters
  static Future<void> init({
    Fcmns2kd7pyMessageClickBehaviour? onMessageClickBehaviour,
    void Function(RemoteMessage)? onForegroundMessage,
  }) async {
    Get.put<Fcmns2kd7pyMessageClickBehaviour>(
      onMessageClickBehaviour ?? Fcmns2kd7pyMessageClickBehaviour.empty(),
    );
    Get.put<Fcmns2kd7pyForegroundBehaviour>(
      onForegroundMessage == null
          ? Fcmns2kd7pyForegroundBehaviour.empty()
          : Fcmns2kd7pyForegroundBehaviour(onMessage: onForegroundMessage),
    );

    FirebaseMessaging.onMessage.listen(_onForegroundMessage);

    FirebaseMessaging.onBackgroundMessage(onBackgroundOrTerminatedMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(_onBackgroundMessageClicked);
  }

  /// Tries to find a message that LAUNCH the app, if find,
  /// calls one from the functions from [behaviour]
  static Future<void> handleLaunchNotification() =>
      _handleTerminatedMessageClicked();

  static Future<void> _handlePermission() async {
    final settings = await _requestPermission();
    _log("Permission status: ${settings.authorizationStatus}");

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (Platform.isIOS) {
        final apnsToken = await FirebaseMessaging.instance.getAPNSToken();

        if (apnsToken != null) {
          final token = await FirebaseMessaging.instance.getToken();
          _log("Token: $token");
          return;
        } else {
          _log("APNS token :null");
        }
      } else {
        final token = await FirebaseMessaging.instance.getToken();
        _log("Token: $token");
      }
    }
  }

  static void _onForegroundMessage(RemoteMessage message) {
    _log('Foreground message: ${message.data}');

    if (message.notification != null) {
      Get.find<Fcmns2kd7pyForegroundBehaviour>().onMessage(message);
      // navigatorKey.currentState?.pushNamed('/message');
      _log('Message also contained a notification: ${message.notification}');
    }
  }

  static void _onBackgroundMessageClicked(RemoteMessage message) {
    _log('Background message clicked: ${message.data}');
    unawaited(_processMessage(message));
  }

  static Future<void> _handleTerminatedMessageClicked() async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _log('Initial message clicked: ${initialMessage.data}');
      await _processMessage(initialMessage);
    }
  }

  static Future<void> _processMessage(RemoteMessage message) async {
    try {
      final messageId = message.messageId;
      if (messageId != null && !_handledLaunchMessageIds.add(messageId)) {
        _log('Message already handled: $messageId');
        return;
      }

      final url = _extractUrl(message.data);
      if (url != null && url.isNotEmpty) {
        _log('Massage has url: $url');
        Get.find<Fcmns2kd7pyMessageClickBehaviour>().onMessageHasUrl(url);
      } else {
        _log('Massage hasn`t url');
        Get.find<Fcmns2kd7pyMessageClickBehaviour>().onMessageWithoutUrl();
      }
    } catch (e, st) {
      _log('Error handling notification data: $e', st: st);
    }
  }

  static String? _extractUrl(Map<String, dynamic> data) {
    const priorityKeys = <String>[
      'url',
      'link',
      'launchUrl',
      'launch_url',
      'openUrl',
      'open_url',
      'externalUrl',
      'external_url',
    ];

    for (final key in priorityKeys) {
      final url = _normalizeUrl(data[key]);
      if (url != null) return url;
    }

    for (final value in data.values) {
      final url = _normalizeUrl(value);
      if (url != null) return url;
    }

    return null;
  }

  static String? _normalizeUrl(dynamic value) {
    if (value is! String) return null;

    final trimmed = value.trim();
    if (trimmed.isEmpty) return null;

    final uri = Uri.tryParse(trimmed);
    if (uri != null &&
        uri.hasScheme &&
        (uri.scheme == 'http' || uri.scheme == 'https')) {
      if (uri.host.isNotEmpty) return trimmed;

      final repaired = Uri.tryParse(
        '${uri.scheme}://${trimmed.substring(uri.scheme.length + 1)}',
      );
      if (repaired != null && repaired.host.isNotEmpty) {
        return repaired.toString();
      }
    }

    final canBeHost =
        !trimmed.codeUnits.any((unit) => unit <= 32) &&
        (trimmed.startsWith('www.') || trimmed.contains('.'));
    if (!canBeHost) return null;

    final withScheme = Uri.tryParse('https://$trimmed');
    if (withScheme != null &&
        withScheme.hasScheme &&
        withScheme.host.isNotEmpty) {
      return withScheme.toString();
    }

    return null;
  }

  static void _log(String message, {StackTrace? st}) {
    if (kDebugMode) {
      log(message, name: '✉️ FCM', stackTrace: st);
    }
  }
}

class Fcmns2kd7pyMessageClickBehaviour {
  Fcmns2kd7pyMessageClickBehaviour({
    required this.onMessageHasUrl,
    required this.onMessageWithoutUrl,
  });

  factory Fcmns2kd7pyMessageClickBehaviour.empty() =>
      Fcmns2kd7pyMessageClickBehaviour(
        onMessageHasUrl: (_) {},
        onMessageWithoutUrl: () {},
      );

  final void Function(String) onMessageHasUrl;
  final VoidCallback onMessageWithoutUrl;
}

class Fcmns2kd7pyForegroundBehaviour {
  Fcmns2kd7pyForegroundBehaviour({required this.onMessage});

  factory Fcmns2kd7pyForegroundBehaviour.empty() =>
      Fcmns2kd7pyForegroundBehaviour(onMessage: (_) {});

  final void Function(RemoteMessage) onMessage;
}
