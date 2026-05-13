import 'package:flutter/material.dart';

import '../../../core/constants_ns2kd7py/app_colors_ns2kd7py.dart';

class CustomBackButtonNs2kd7py extends StatelessWidget {
  const CustomBackButtonNs2kd7py({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: AppColorsNs2kd7py.white,
        borderRadius: BorderRadius.circular(100),
      ),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTap?.call();
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new, color: AppColorsNs2kd7py.black),
        ),
      ),
    );
  }
}
