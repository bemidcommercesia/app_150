import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../general/presentation/screens_ns2kd7py/screen_base_ns2kd7py.dart';
import '../html_styles_ns2kd7py.dart';

class UserDocsNs2kd7pyScreenBase extends StatelessWidget {
  const UserDocsNs2kd7pyScreenBase({required this.title, required this.text, super.key});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    
    return ScreenBaseNs2kd7py(title: title, child: SingleChildScrollView(child:Html(data: text, style: htmlStylesNs2kd7py)));
    

    

  }

    

}
