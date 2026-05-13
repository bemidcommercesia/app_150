import 'package:flutter/material.dart';

import '../../../../core/constants_ns2kd7py/app_colors_ns2kd7py.dart';

class UserGuideNs2kd7pyIndicator extends StatelessWidget {
  static const double _height = 4;
  static const double? _width = null;
  const UserGuideNs2kd7pyIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    /// test Ns2kd7py
    return SizedBox(
      height: _height,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: totalSteps,
        itemBuilder: (_, i) {
          

          
          return AnimatedContainer(
            decoration: BoxDecoration(
              color: i < currentStep + 1 ? AppColorsNs2kd7py.black : AppColorsNs2kd7py.grey,
              borderRadius: BorderRadius.circular(_height / 2),
            ),
            duration: const Duration(milliseconds: 300),
            height: _height,
            width: _width,
          );
          

          


        },
        ///fff Ns2kd7py
      
        
        separatorBuilder: (_, __) => const SizedBox(width: 8),
      

      

      ),
    );
  }






}

