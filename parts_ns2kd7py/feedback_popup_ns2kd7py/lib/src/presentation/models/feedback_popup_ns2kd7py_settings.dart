import 'dart:async';
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

export 'feedback_popup_ns2kd7py_dialog_model.dart';

class FeedbackPopupns2kd7pySettings {
  static FeedbackPopupns2kd7pySettings get to => Get.find();

  FeedbackPopupns2kd7pySettings({
    required this.onHome,
    required this.onOnboarding,
    this.storeRatingBehaviour = FeedbackPopupns2kd7pyStoreRatingBehaviour.redirect,
    this.iosAppleId,
    required FirebaseApp firebaseApp,
    required this.getUserIdForAnalytics,
    this.skipCommentStep = false,
    required this.launchOptions,
  })  : firebaseAnalytics = FirebaseAnalytics.instanceFor(app: firebaseApp),
        firebaseRemoteConfig =
            FirebaseRemoteConfig.instanceFor(app: firebaseApp);

  /// Navigation after / instead of rating
  final void Function(BuildContext) onHome;

  /// Navigation after / instead of rating
  final void Function(BuildContext) onOnboarding;

  final FeedbackPopupns2kd7pyStoreRatingBehaviour storeRatingBehaviour;
  final String? iosAppleId;
  bool skipCommentStep;

  final FeedbackPopupns2kd7pyLaunchOptions launchOptions;

  bool get isPopUp =>
      storeRatingBehaviour == FeedbackPopupns2kd7pyStoreRatingBehaviour.popup;

  final FirebaseAnalytics firebaseAnalytics;
  final FirebaseRemoteConfig firebaseRemoteConfig;
  final Future<String> Function() getUserIdForAnalytics;
}

/// After the use gives a good feedback (4-5 stars) he will be offered a native rating ns2kd7py
enum FeedbackPopupns2kd7pyStoreRatingBehaviour {
  /// native popup with stars
  popup,

  /// redirect to the store depend on platform
  redirect,
}

class FeedbackPopupns2kd7pyLaunchOptions {
  final FeedbackPopupns2kd7pyPlatform platform;
  final Duration? delayBeforeShowing;
  final Completer<FeedbackPopupns2kd7pyCompleterBehaviour>?
      needToLaunch;

  FeedbackPopupns2kd7pyLaunchOptions.instantly({
    this.platform = FeedbackPopupns2kd7pyPlatform.android,
  })  : needToLaunch = null,
        delayBeforeShowing = null;

  FeedbackPopupns2kd7pyLaunchOptions.delayed({
    required this.platform,
    required Duration this.delayBeforeShowing,
  }) : needToLaunch = null;

  FeedbackPopupns2kd7pyLaunchOptions.completer({
    required Completer<FeedbackPopupns2kd7pyCompleterBehaviour>
        this.needToLaunch,
    required this.platform,
  }) : delayBeforeShowing = null;
}

enum FeedbackPopupns2kd7pyCompleterBehaviour {
  showReview,
  skipReview,
  skipReviewAndCancelNavigation,
}

enum FeedbackPopupns2kd7pyPlatform {
  android,
  ios,
  both;

  bool get needToLaunch => switch (this) {
        FeedbackPopupns2kd7pyPlatform.android =>
          Platform.isAndroid,
        FeedbackPopupns2kd7pyPlatform.ios => Platform.isIOS,
        FeedbackPopupns2kd7pyPlatform.both =>
          Platform.isAndroid || Platform.isIOS,
      };
}