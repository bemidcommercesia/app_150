import 'dart:async';
import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

import '../constants/feedback_popup_ns2kd7py_text_styles.dart';
import '../feedback_popup_ns2kd7py_dependencies.dart';
import 'models/feedback_popup_ns2kd7py_settings.dart';
import 'widgets/feedback_popup_ns2kd7py_dialog.dart';
import 'widgets/feedback_popup_ns2kd7py_dialog_button.dart';
import 'widgets/feedback_popup_ns2kd7py_dialog_stars_section.dart';

class FeedbackPopupns2kd7pyWrapper extends StatefulWidget {
  const FeedbackPopupns2kd7pyWrapper({super.key, required this.child});

  final Widget child;

  @override
  State<FeedbackPopupns2kd7pyWrapper> createState() => _FeedbackPopupns2kd7pyWrapperState();
}

class _FeedbackPopupns2kd7pyWrapperState extends State<FeedbackPopupns2kd7pyWrapper> {
  final setting = FeedbackPopupns2kd7pySettings.to;
  final variables = FeedbackPopupns2kd7pyVariables.to;
  final steps = FeedbackPopupns2kd7pySteps.to;

  final _stepNotifier = ValueNotifier<int>(0);
  final _starNotifier = ValueNotifier<int?>(null);

  late final String userId;

  @override
  void initState() {
    super.initState();

    _stepNotifier.addListener(() {
      _showDialog(steps.steps[_stepNotifier.value]);
    });

   WidgetsBinding.instance.addPostFrameCallback((_) async {
      /// Verify platform (android / ios / both)
      if (!setting.launchOptions.platform.needToLaunch) {
        log('Unsupported platform', name: 'FeedbackPopupns2kd7pyWrapper');
        _finishReview();
      }

      /// Wait if has delay or completer
      final needToContinue = await _waitBeforeStart();
      if (needToContinue == null) {
        log('Navigation cancelled', name: 'FeedbackPopupns2kd7pyWrapper');

        return; //cancel navigation
      } else if (!needToContinue) {
        log('Skipped Review', name: 'FeedbackPopupns2kd7pyWrapper');

        return _finishReview();
      }

      /// Verify launch counter
      if (variables.launch != variables.launchReviewOn) {
        return _finishReview();
      }

      /// Verify InAppReview
      if (!await InAppReview.instance.isAvailable()) {
        log('Skipped Review InAppReview unavailable', name: 'FeedbackPopupns2kd7pyWrapper');
        return _finishReview();
      }

      /// Random seed for review availability
      int rndSeed = Random().nextInt(101);

      ///If rndSeed > needShowReview from FIREBASE REMOTE CONFIG => redirect to home
      if (variables.firebaseRemoteConfigValue < rndSeed) {
        return _finishReview();
      }

      /// Show review dialog
      _showDialog(steps.steps.first);
      userId = await setting.getUserIdForAnalytics();
      _sendEvent('review', {'CUID': userId});
    });
  }

  Future<bool?> _waitBeforeStart() async {
    final launchOptions = setting.launchOptions;

    if (launchOptions.delayBeforeShowing != null) {
      return Future<bool>.delayed(
        launchOptions.delayBeforeShowing!,
        () => true,
      );
    } else if (launchOptions.needToLaunch != null) {
      final res = await launchOptions.needToLaunch!.future;
      return switch (res) {
        FeedbackPopupns2kd7pyCompleterBehaviour.showReview =>
          true,
        FeedbackPopupns2kd7pyCompleterBehaviour.skipReview =>
          false,
        FeedbackPopupns2kd7pyCompleterBehaviour
              .skipReviewAndCancelNavigation =>
          null,
      };
    }
    return Future.value(true);
  }
  

  void _showDialog(FeedbackPopupns2kd7pyDialogContent content) {
    unawaited(
      showDialog(
        useSafeArea: false,
        context: context,
        barrierDismissible: false,
        builder: (context) => _getDialogByStep(_stepNotifier.value),
      ),
    );
  }



  Widget _getDialogByStep(int step) => switch (step) {
        1 => _StarsDialog(content: steps.requestStar, onRate: _onRate),
        2 => _CommentDialog(
            content: steps.badResponse,
            onSubmit: _onComment,
          ),
        _ => _SimpleDialog(content: steps.steps[step], onTap: _onButtonTap),
      };

  Future<void> _onRate(int stars) async {
    _starNotifier.value = stars;

    _changeStep();



    final nameSuffix = stars > 3 ? 'good' : 'bad';

    _sendEvent('rating_${nameSuffix}_$stars', {'CUID': userId});
  }

  Future<void> _onComment(String comment) async {
    _changeStep();

    _sendEvent('review_comment', {'CUID': userId, 'comment': comment});
  }

  void _onButtonTap() {
    if (_stepNotifier.value == 3) {
      /// Bad rating = exit

      _finishReview();
      return;
    } else if (_stepNotifier.value == 4) {
      /// Good rating = request review
      _requestMarketReview();
      _finishReview();
      return;
    }
    _changeStep();
  }

  void _changeStep() {
    final step = _stepNotifier.value;
    final stars = _starNotifier.value;



    final nextStep = step != 1

        /// !step with starsns2kd7py
        ? step + 1
        : stars! < 4

            /// bad rating => show thanksForFeedback dialog,
            ? setting.skipCommentStep
                ? 3
                : 2

            /// good rating => show goodResponse dialog
            : 4;

    _stepNotifier.value = nextStep;

    /// sdf _ns2kd7py12wq
  }

  void _finishReview() {
    if (variables.launch > variables.launchReviewOn) {
      setting.onHome(context);
    } else {
      setting.onOnboarding(context);
    }
  }

  /// tools
  void _requestMarketReview() {
    final inAppReview = InAppReview.instance;
    setting.isPopUp
        ? inAppReview.requestReview()
        : inAppReview.openStoreListing(
            appStoreId: setting.iosAppleId,
          );
  }

  void _sendEvent(String name, Map<String, Object> data) {
    log(name, name: 'feedback_popup_ns2kd7py EVENT');
    setting.firebaseAnalytics.logEvent(name: name, parameters: data);

  }

  @override
  Widget build(BuildContext context) {


    return Material(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: widget.child),
      ),
    );
  }
}

class _SimpleDialog extends StatelessWidget {
  const _SimpleDialog({
    required this.content,
    required this.onTap,
  });

  final FeedbackPopupns2kd7pyDialogContent content;
  final VoidCallback onTap;




@override
  Widget build(BuildContext context) {
    final styles = FeedbackPopupns2kd7pyStyles.to;



    return FeedbackPopupns2kd7pyRatingDialog(
      title: Text(
        content.title,
        textAlign: TextAlign.center,
        style: styles.titleStyle,
      ),
      message: Text(
        content.content,
        textAlign: TextAlign.left,
        style: styles.contentStyle,
      ),
      buttonBuilder: styles.buttonBuilder,
      submitButtonSettings: FeedbackPopupns2kd7pyDialogButtonSettings(
        label: content.buttonText,
        textStyle: FeedbackPopupns2kd7pyTextStyles.submitButtonStyle,
      ),
      onSubmitted: (response) => onTap(),
      backgroundColor: styles.backgroundColor,
      backgroundGradient: styles.backgroundGradient,
    );
  }
}

class _StarsDialog extends StatelessWidget {
  const _StarsDialog({
    required this.content,
    required this.onRate,
  });

  final FeedbackPopupns2kd7pyDialogContent content;
  final Function(int starsCount) onRate;

  @override
  Widget build(BuildContext context) {
    final styles = FeedbackPopupns2kd7pyStyles.to;

    return FeedbackPopupns2kd7pyRatingDialog.withStars(
      title: Text(
        content.title,
        textAlign: TextAlign.center,
        style: styles.titleStyle,
      ),
      message: Text(
        content.content,
        textAlign: TextAlign.left,
        style: styles.contentStyle,
      ),
      buttonBuilder: styles.buttonBuilder,
      starDialogSettings: FeedbackPopupns2kd7pyStarDialogSettings.base(),
      submitButtonSettings: FeedbackPopupns2kd7pyDialogButtonSettings(
        label: content.buttonText,
        textStyle: FeedbackPopupns2kd7pyTextStyles.submitButtonStyle,
      ),
      onSubmitted: (response) => onRate(response.rating.toInt()),
      backgroundColor: styles.backgroundColor,
      backgroundGradient: styles.backgroundGradient,
    );
  }
}

class _CommentDialog extends StatelessWidget {
  const _CommentDialog({
    required this.content,
    required this.onSubmit,
  });

  final FeedbackPopupns2kd7pyDialogContent content;
  final Function(String comment) onSubmit;

  @override
  Widget build(BuildContext context) {
    final styles = FeedbackPopupns2kd7pyStyles.to;

    return FeedbackPopupns2kd7pyRatingDialog.comment(
      title: Text(
        content.title,
        textAlign: TextAlign.center,
        style: styles.titleStyle,
      ),
      message: Text(
        content.content,
        textAlign: TextAlign.left,
        style: styles.contentStyle,
      ),
      commentStyle: styles.commentStyle,
      buttonBuilder: styles.buttonBuilder,
      submitButtonSettings: FeedbackPopupns2kd7pyDialogButtonSettings(
        label: content.buttonText,
        textStyle: FeedbackPopupns2kd7pyTextStyles.submitButtonStyle,
      ),
      onSubmitted: (response) => onSubmit(response.comment),
      backgroundColor: styles.backgroundColor,
      backgroundGradient: styles.backgroundGradient,
    );
  }
}
