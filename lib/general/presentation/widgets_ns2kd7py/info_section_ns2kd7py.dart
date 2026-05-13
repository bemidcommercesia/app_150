import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final _glassBorder = SweepGradient(
  startAngle: math.pi / 4,
  endAngle: math.pi / 4 + 2 * math.pi,
  colors: const [
    Color(0x99FFFFFF),
    Color(0x99FFFFFF),
    Color(0x00FFFFFF),
    Color(0x99FFFFFF),
    Color(0x99FFFFFF),
    Color(0x00FFFFFF),
    Color(0x99FFFFFF),
    Color(0x99FFFFFF),
  ],
  stops: const [0.0, 0.18, 0.25, 0.32, 0.68, 0.75, 0.82, 1.0],
);

class InfoSectionNs2kd7py extends StatelessWidget {
  const InfoSectionNs2kd7py({
    super.key,
    required this.iconPath,
    required this.title,
    required this.body,
  });

  final String iconPath;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: _glassBorder,
            ),
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0xFF111111),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(9),
                  child: SvgPicture.asset(iconPath),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'MPLUS1',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                body,
                style: const TextStyle(
                  fontFamily: 'MPLUS1',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  color: Color(0xFFA8A5A8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
