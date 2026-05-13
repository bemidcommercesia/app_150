import 'package:flutter/material.dart';

import '../../../core/constants_ns2kd7py/app_colors_ns2kd7py.dart';
import '../../../core/constants_ns2kd7py/app_styles_ns2kd7py.dart';
import '../widgets_ns2kd7py/custom_back_button_ns2kd7py.dart';

class ScreenBaseNs2kd7py extends StatelessWidget {
  const ScreenBaseNs2kd7py({super.key, this.title, required this.child});

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsNs2kd7py.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: CustomBackButtonNs2kd7py(),
        title: title == null ? null : Text(title!, style: AppStylesNs2kd7py.title),
        centerTitle: true,
      ),
      body: child,
    );
  }
}
