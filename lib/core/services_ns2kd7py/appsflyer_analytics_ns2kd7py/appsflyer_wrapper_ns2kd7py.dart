import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';

import '../../constants_ns2kd7py/app_constants_ns2kd7py.dart';

abstract class AppsflyerAnalyticsNs2kd7py {
  static AppsflyerSdk? _sdk;

  static final RegExp _appleAppStoreIdPattern = RegExp(r'^\d{8,11}$');

  static void logFirstOpen() => _sdk?.logEvent('custom_first_open', {});
  static void logWVOpen() => _sdk?.logEvent('web_view_open', {});

  static Future<String?> afId() async => _sdk?.getAppsFlyerUID();
  
  

  static Future<void> init() async {
    if (Platform.isIOS) {
      try {
        final status =
            await AppTrackingTransparency.trackingAuthorizationStatus;
        if (status == TrackingStatus.notDetermined) {
          await AppTrackingTransparency.requestTrackingAuthorization();
        }
      } catch (e, st) {
        log('ATT request failed: $e', stackTrace: st);
      }

      if (!_appleAppStoreIdPattern.hasMatch(AppConstantsNs2kd7py.appleId)) {
        log(
          'AppsFlyer init skipped: `appleId` must be the numeric App Store app ID '
          '(8–11 digits). Set `AppConstantsNs2kd7py.appleId` in app_constants_ns2kd7py.dart '
          '(App Store Connect → app → General → Apple ID).',
        );
        return;
      }
    }

    final appsFlyerConfig = {
      "afDevKey": AppConstantsNs2kd7py.appsflyerId,
      "afAppId": AppConstantsNs2kd7py.appleId,
      "isDebug": false,
    };

    final analyticsSdk = AppsflyerSdk(appsFlyerConfig);

    await analyticsSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );

    _sdk = analyticsSdk;
  }
}
