import 'package:flutter/material.dart';

import '../../../core/constants_ns2kd7py/app_colors_ns2kd7py.dart';
import '../../../core/constants_ns2kd7py/app_styles_ns2kd7py.dart';

class MainButtonNs2kd7py extends StatelessWidget {
  const MainButtonNs2kd7py({super.key, this.onTap, required this.label});

  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: AppColorsNs2kd7py.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onTap,
      child: Text(label, style: AppStylesNs2kd7py.title),
    );
  }
}
