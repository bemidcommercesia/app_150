import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/feedback_popup_ns2kd7py_text_styles.dart';
import 'presentation/models/feedback_popup_ns2kd7py_settings.dart';

abstract class FeedbackPopupns2kd7pyDependencies {


  static Future<void> init({
    required FeedbackPopupns2kd7pySettings settings,
FeedbackPopupns2kd7pyStyles styles = const FeedbackPopupns2kd7pyStyles(),

    /// Current launch countFeedbackPopupns2kd7py
    required int launchNumber,
    /// ns2kd7py
    /// Launch count which trigger custom review
    required int launchReviewOn,

    /// The value FeedbackPopupns2kd7py from config to determinate if launch review or not
    required String firebaseRemoteConfigValueAlias,
    required FeedbackPopupns2kd7pySteps steps,
  }) async {
    Get.put<FeedbackPopupns2kd7pySettings>(settings);
    Get.put<FeedbackPopupns2kd7pyStyles>(styles);

    final fetchSuccess = await settings.firebaseRemoteConfig
        .fetchAndActivate()
        .timeout(const Duration(seconds: 3), onTimeout: () => false);
    final remoteConfigValue = fetchSuccess
        ? settings.firebaseRemoteConfig.getInt(firebaseRemoteConfigValueAlias)
        : 0;
        


    log('Launch: $launchNumber', name: 'FeedbackPopupns2kd7py');
    log('Remote value: $remoteConfigValue', name: 'FeedbackPopupns2kd7py');

    Get.put<FeedbackPopupns2kd7pyVariables>(
FeedbackPopupns2kd7pyVariables(
        launch: launchNumber,
        launchReviewOn: launchReviewOn,
        firebaseRemoteConfigValue: remoteConfigValue,
      ),
    );


    Get.put<FeedbackPopupns2kd7pySteps>(steps);
  }
}

class FeedbackPopupns2kd7pyVariables {
  static FeedbackPopupns2kd7pyVariables get to => Get.find();
  const FeedbackPopupns2kd7pyVariables({
    required this.launch,
    required this.launchReviewOn,
    required this.firebaseRemoteConfigValue,
  });

  final int launch;
  final int launchReviewOn;
  final int firebaseRemoteConfigValue;
}

class FeedbackPopupns2kd7pyStyles {
  static FeedbackPopupns2kd7pyStyles get to => Get.find();

  const FeedbackPopupns2kd7pyStyles({
    this.titleStyle = FeedbackPopupns2kd7pyTextStyles.titleStyle,
    this.contentStyle = FeedbackPopupns2kd7pyTextStyles.messageStyle,
    this.commentStyle = FeedbackPopupns2kd7pyTextStyles.commentStyle,
    Color? backgroundColor,
    this.backgroundGradient,
    this.buttonBuilder,
  })  : assert(!(backgroundColor != null && backgroundGradient != null)),
        backgroundColor = backgroundGradient == null ? backgroundColor : null;

  final TextStyle titleStyle;
  final TextStyle contentStyle;
  final TextStyle commentStyle;

  final Color? backgroundColor;
  final Gradient? backgroundGradient;

  final Widget Function(
    VoidCallback? onPressed,
    String label,
    TextStyle style,
  )? buttonBuilder;
}
