import 'feedback_popup_ns2kd7py.dart';

export 'src/feedback_popup_ns2kd7py_dependencies.dart';
export 'src/presentation/feedback_popup_ns2kd7py_wrapper.dart';
export 'src/presentation/models/feedback_popup_ns2kd7py_settings.dart';

abstract class FeedbackPopupns2kd7py {
  static Future<void> init({
    required FeedbackPopupns2kd7pySettings settings,
FeedbackPopupns2kd7pyStyles styles = const FeedbackPopupns2kd7pyStyles(),
    required int launchNumber,
    int launchReviewOn = 0,
    required String firebaseRemoteConfigValueAlias,
    required FeedbackPopupns2kd7pySteps steps,
  }) async {

    return FeedbackPopupns2kd7pyDependencies.init(
      settings: settings,
      styles: styles,
      launchNumber: launchNumber,
      launchReviewOn: launchReviewOn,
      firebaseRemoteConfigValueAlias: firebaseRemoteConfigValueAlias,
      steps: steps,
    );
  }

}


