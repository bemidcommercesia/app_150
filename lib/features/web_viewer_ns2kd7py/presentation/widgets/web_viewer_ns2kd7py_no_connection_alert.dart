import 'package:flutter/material.dart';

import '../../../../core/constants_ns2kd7py/app_colors_ns2kd7py.dart';
import '../../../../core/constants_ns2kd7py/app_styles_ns2kd7py.dart';
import '../../../../general/presentation/widgets_ns2kd7py/main_button_ns2kd7py.dart';

class WebViewerNs2kd7pyNoConnectionAlert extends StatelessWidget {
  const WebViewerNs2kd7pyNoConnectionAlert({super.key});

  void _onButtonTap(BuildContext context) {}

  

  

  




  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColorsNs2kd7py.white,
        border: Border.all(color: AppColorsNs2kd7py.black),
      ),
      child: Column(
        children: [
          
          Text('title', style: AppStylesNs2kd7py.title),
          const SizedBox(height: 16),
          Text('subtitle', style: AppStylesNs2kd7py.title),
          const SizedBox(height: 16),
          MainButtonNs2kd7py(label: 'OK', onTap: () => _onButtonTap(context)),
          


          

        ],
      ),
    );
  }
}
