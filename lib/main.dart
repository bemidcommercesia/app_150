import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:conn_ping_tool_ns2kd7py/conn_ping_tool_ns2kd7py.dart';
import 'package:feedback_popup_ns2kd7py/feedback_popup_ns2kd7py.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:layout_scaling_tool_ns2kd7py/layout_scaling_tool_ns2kd7py.dart';
import 'package:run_count_stat_ns2kd7py/run_count_stat_ns2kd7py.dart';
import 'package:track_source_ns2kd7py/track_source_ns2kd7py.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:web_input_screen_ns2kd7py/web_input_screen_ns2kd7py.dart';

import 'core/constants_ns2kd7py/app_colors_ns2kd7py.dart';
import 'core/constants_ns2kd7py/app_constants_ns2kd7py.dart';
import 'core/navigation_ns2kd7py/app_navigator_ns2kd7py.dart';
import 'core/services_ns2kd7py/app_version/app_version_service_.dart';
import 'core/services_ns2kd7py/appsflyer_analytics_ns2kd7py/appsflyer_wrapper_ns2kd7py.dart';
import 'core/services_ns2kd7py/push_alerts_ns2kd7py/push_alerts_ns2kd7py.dart';

/// !!! Delete README-mason.md before build your app for release

/*ty to xcode

__________APPLE_______________ty to identifier
create key for codemagic

____CODEMAGIC_(README-CM.md)_____

change CM flow from GUI to yaml

insert ios build id to codemagic.yaml (bundle_identifier)
    if didnt provide when generating app

create cert in CM + fetch
create profile in AppleDev + fetch in CM



________________________
moders check ?

git table
ids table
*/

// final remoteRatingCompleter =
//     Completer<FeedbackPopupns2kd7pyCompleterBehaviour>();

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      await WakelockPlus.enable();

      final firebaseApp = await Firebase.initializeApp();
      FirebaseAnalytics.instanceFor(app: firebaseApp);
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      if (Platform.isIOS) {
        await AppsflyerAnalyticsNs2kd7py.init();
      }
      await PushAlertsNs2kd7py.init(
        PushAlertsNs2kd7pyConfig(
          oneSignalId: AppConstantsNs2kd7py.oneSignalId,
          requestPermissionInstantly: false,
          behaviour: PushAlertsNs2kd7pyNavigationBehaviour(
            onForm: () => AppNavigationNs2kd7py.goNamed(AppRouteNs2kd7py.form),
          ),
        ),
      );

      ///Make modules init separated
      // if(Platform.isAndroid){
      //     await FbTrackingIdsns2kd7py.init();

      // }

      if (Platform.isAndroid) {
        await TrackSourcens2kd7py.init();
      }

      await RunCountStatns2kd7py.init();
      final launchCount = RunCountStatns2kd7py.counter;
      await RunCountStatns2kd7py.increaseCounter();
      if (launchCount + 1 == 6) {
        final inAppReview = InAppReview.instance;
        if (await inAppReview.isAvailable()) {
          unawaited(inAppReview.requestReview());
        }
      }

      await ConnPingToolns2kd7py.init();

      await FeedbackPopupns2kd7py.init(
        settings: FeedbackPopupns2kd7pySettings(
          iosAppleId: AppConstantsNs2kd7py.appleId,
          firebaseApp: firebaseApp,
          getUserIdForAnalytics: () => FlutterUdid.udid,
          onHome: (context) {
            AppNavigationNs2kd7py.replaceNamed(AppRouteNs2kd7py.home);
          },
          onOnboarding: (context) {
            AppNavigationNs2kd7py.replaceNamed(AppRouteNs2kd7py.intro);
          },
          storeRatingBehaviour:
              FeedbackPopupns2kd7pyStoreRatingBehaviour.redirect,
          skipCommentStep: true,
          launchOptions: FeedbackPopupns2kd7pyLaunchOptions.instantly(
            platform: FeedbackPopupns2kd7pyPlatform.both,
          ),
        ),
        launchNumber: launchCount,
        firebaseRemoteConfigValueAlias: 'needShowReview',
        steps: FeedbackPopupns2kd7pySteps.fourSteps(
          howToUse: FeedbackPopupns2kd7pyDialogContent(
            title: "Let's Keep It Easy",
            content:
                'Fill out the request form in just a few moments.\n\n'
                'Review your details and sign to move ahead.\n\n'
                'Once approved, the funds will be sent to your account.',
            buttonText: 'Keep Going',
          ),
          requestStar: FeedbackPopupns2kd7pyDialogContent(
            title: "How's it Going So Far?",
            content:
                "We'd love a quick rating from you.\n"
                'Your opinion helps us make the app better.',
            buttonText: 'Submit Feedback',
          ),
          thanksForFeedback: FeedbackPopupns2kd7pyDialogContent(
            title: 'Thanks for Telling Us',
            content:
                'We appreciate your feedback and\n'
                'will use it to improve the experience.',
            buttonText: 'Continue',
          ),
          goodResponse: FeedbackPopupns2kd7pyDialogContent(
            title: 'Thanks for the Great Feedback',
            content:
                "We're happy to hear that.\n"
                "If you'd like, please share\n"
                'your experience on App Store',
            buttonText: 'Leave a Review',
          ),
        ),
        styles: FeedbackPopupns2kd7pyStyles(
          backgroundColor: AppColorsNs2kd7py.white,
          buttonBuilder: (onTap, label, _) => SizedBox(
            width: double.infinity,
            child: GestureDetector(
              onTap: onTap,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xFF1AEF0F),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  height: 56,
                  child: Center(
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'MPLUS1',
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        height: 1,
                        color: Color(0xFF0D0D0C),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      if (launchCount == 0) {
        AppsflyerAnalyticsNs2kd7py.logFirstOpen();
      }

      await WebInputScreenns2kd7pyDependencies.preload(
        linkSettings: LinkSettingsns2kd7py(
          baseLink: AppConstantsNs2kd7py.formUrl,
          linkParams: [
            LinkParamns2kd7py(
              name: AppConstantsNs2kd7py.udIdAliace,
              getValue: () async => FlutterUdid.udid,
            ),
            LinkParamns2kd7py(
              name: AppConstantsNs2kd7py.fiIdAliace,
              getValue: () => FirebaseAnalytics.instance.appInstanceId,
            ),
            LinkParamns2kd7py(
              name: AppConstantsNs2kd7py.appVersionAliace,
              getValue: () async => AppBuildVersionNs2kd7py.value,
            ),

            if (Platform.isIOS) ...[
              LinkParamns2kd7py(
                name: AppConstantsNs2kd7py.afIdAliace,
                getValue: AppsflyerAnalyticsNs2kd7py.afId,
              ),
            ],

            if (Platform.isAndroid) ...[
              LinkParamns2kd7py(
                name: AppConstantsNs2kd7py.ref,
                getValue: () async => TrackSourcens2kd7py.details,
              ),
            ],
          ],
        ),
      );

      runApp(const MainAppNs2kd7py());
    },
    (error, stackTrace) {
      unawaited(FirebaseCrashlytics.instance.recordError(error, stackTrace));
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}

class MainAppNs2kd7py extends StatelessWidget {
  const MainAppNs2kd7py({super.key});
  //_ns2kd7py_ns2kd7py
  ///_
  @override
  Widget build(BuildContext context) {
    LayoutScalingToolns2kd7py.init(context);

    return MaterialApp(
      initialRoute: AppRouteNs2kd7py.splash.path,
      routes: AppNavigationNs2kd7py.routes,
      navigatorKey: AppNavigationNs2kd7py.navKey,
      theme: ThemeData(),
    );
  }
}
