import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackPopupns2kd7pyStarDialogSettings {
  const FeedbackPopupns2kd7pyStarDialogSettings({
    required this.initialRating,
    required this.starColor,
    required this.starSize,
    required this.ignore,
  });

  const FeedbackPopupns2kd7pyStarDialogSettings.base()
      : initialRating = 0,
        starColor = Colors.amber,
        starSize = 40.0,
        ignore = false;

  /// The initial rating of the rating bar
  final double initialRating;

  /// The rating bar (star icon & glow) color
  final Color starColor;

  /// The size of the star
  final double starSize;

  /// Ignore horizontal swipe gesture
  final bool ignore;
}

class FeedbackPopupns2kd7pyDialogStarsSection extends StatelessWidget {
  const FeedbackPopupns2kd7pyDialogStarsSection({
    super.key,
    required this.settings,
    required this.onChange,
  });

  final FeedbackPopupns2kd7pyStarDialogSettings settings;
  final ValueChanged<double> onChange;




@override
  Widget build(BuildContext context) {


    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: RatingBar.builder(
        initialRating: settings.initialRating,
        glowColor: settings.starColor,
        unratedColor: const Color(0xFF808080),
        minRating: 0,
        itemSize: settings.starSize,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 5,
        ignoreGestures: settings.ignore,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        onRatingUpdate: onChange,
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: settings.starColor,
        ),
      ),
    );
  }
}
