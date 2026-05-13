import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../core/constants_ns2kd7py/app_colors_ns2kd7py.dart';
import '../html_styles_ns2kd7py.dart';

class UserDocsNs2kd7pyParagraphTileNs2kd7py extends StatelessWidget {
  const UserDocsNs2kd7pyParagraphTileNs2kd7py({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColorsNs2kd7py.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Html(data: text, style: htmlStylesNs2kd7py),
    );
  }
}
