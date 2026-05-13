import 'package:flutter/material.dart';

class FeedbackPopupns2kd7pyDialogButtonSettings {
  static const _textStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 17,
  );
  const FeedbackPopupns2kd7pyDialogButtonSettings({
    required this.label,
    required this.textStyle,
  });
  const FeedbackPopupns2kd7pyDialogButtonSettings.base({
    required this.label,
  }) : textStyle = FeedbackPopupns2kd7pyDialogButtonSettings._textStyle;

  const FeedbackPopupns2kd7pyDialogButtonSettings.secondButton()
      : label = 'Remind me later',
        textStyle = FeedbackPopupns2kd7pyDialogButtonSettings._textStyle;

  final String label;
  final TextStyle textStyle;
}

class FeedbackPopupns2kd7pyDialogButton extends StatelessWidget {
  const FeedbackPopupns2kd7pyDialogButton({
    super.key,
    required this.settings,
    this.onTap,
  });

  final FeedbackPopupns2kd7pyDialogButtonSettings settings;
  final VoidCallback? onTap;



  @override
  Widget build(BuildContext context) {


    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xff2050F6),
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        ),
        onPressed: onTap,
        child: Text(settings.label, style: settings.textStyle),
      ),
    );
  }
}
