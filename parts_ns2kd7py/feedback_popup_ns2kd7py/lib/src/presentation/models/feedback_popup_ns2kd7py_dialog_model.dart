import 'dart:io';
import 'package:get/get.dart';

class FeedbackPopupns2kd7pyDialogContent {
  const FeedbackPopupns2kd7pyDialogContent({
    required this.title,
    required this.content,
    required this.buttonText,
  });

  const FeedbackPopupns2kd7pyDialogContent.continueButton({
    required this.title,
    required this.content,
  }) : buttonText = 'Continue';

  const FeedbackPopupns2kd7pyDialogContent.submitButton({
    required this.title,
    required this.content,
  }) : buttonText = 'Submit';

  FeedbackPopupns2kd7pyDialogContent.rateInStore({
    required this.title,
    required this.content,
  }) : buttonText = Platform.isIOS ? 'Rate on the App Store' : 'Rate on the Play Store';

  final String title;
  final String content;
  final String buttonText;
}
/// tagns2kd7py
class FeedbackPopupns2kd7pySteps {
  static FeedbackPopupns2kd7pySteps get to => Get.find();
  const FeedbackPopupns2kd7pySteps({
    required this.howToUse,
    required this.requestStar,
    required this.badResponse,
    required this.thanksForFeedback,
    required this.goodResponse,
  });

  FeedbackPopupns2kd7pySteps.typical({
    required String howToUseTitle,
    required String howToUseContent,
    required String requestStarTitle,
    required String requestStarContent,
    required String badResponseTitle,
    required String badResponseContent,
    required String thanksForFeedbackTitle,
    required String thanksForFeedbackContent,
    required String goodResponseTitle,
    required String goodResponseContent,
  })  : howToUse = FeedbackPopupns2kd7pyDialogContent.continueButton(
          title: howToUseTitle,
          content: howToUseContent,
        ),
        requestStar = FeedbackPopupns2kd7pyDialogContent.submitButton(
          title: requestStarTitle,
          content: requestStarContent,
        ),
        badResponse = FeedbackPopupns2kd7pyDialogContent.submitButton(
          title: badResponseTitle,
          content: badResponseContent,
        ),
        thanksForFeedback = FeedbackPopupns2kd7pyDialogContent.continueButton(
          title: thanksForFeedbackTitle,
          content: thanksForFeedbackContent,
        ),
        goodResponse = FeedbackPopupns2kd7pyDialogContent.rateInStore(
          title: goodResponseTitle,
          content: goodResponseContent,
        );


        FeedbackPopupns2kd7pySteps.fourSteps({
          required this.howToUse,
          required this.requestStar,
          required this.thanksForFeedback,
          required this.goodResponse,
        }) : badResponse = FeedbackPopupns2kd7pyDialogContent.submitButton(
                title: 'badResponseTitle',
                content: 'badResponseContent',
              );

  final FeedbackPopupns2kd7pyDialogContent howToUse;
  final FeedbackPopupns2kd7pyDialogContent requestStar;
  final FeedbackPopupns2kd7pyDialogContent badResponse;
  final FeedbackPopupns2kd7pyDialogContent thanksForFeedback;
  final FeedbackPopupns2kd7pyDialogContent goodResponse;

  List<FeedbackPopupns2kd7pyDialogContent> get steps => [
        howToUse,
        requestStar,
        badResponse,
        thanksForFeedback,
        goodResponse,
      ];
}
