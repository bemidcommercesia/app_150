import 'package:feedback_popup_ns2kd7py/feedback_popup_ns2kd7py.dart';
import 'package:flutter/material.dart';

class LaunchNs2kd7pyScreen extends StatelessWidget {
  const LaunchNs2kd7pyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeedbackPopupns2kd7pyWrapper(
      child: SizedBox.expand(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage('assets/images/png/splash_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
