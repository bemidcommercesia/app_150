import 'dart:async';

import 'package:flutter/material.dart';

import '../../features/faq_ns2kd7py/presentation/screens/faq_ns2kd7py_screen.dart';
import '../../features/launch_ns2kd7py/presentation/screens/launch_ns2kd7py_screen.dart';
import '../../features/main_page_ns2kd7py/presentation/screens/main_page_ns2kd7py_screen.dart';
import '../../features/settings_ns2kd7py/presentation/screens/settings_ns2kd7py_screen.dart';
import '../../features/user_docs_ns2kd7py/screens/data_protection_ns2kd7py/data_protection_ns2kd7py_screen.dart';
import '../../features/user_docs_ns2kd7py/screens/terms_conditions_ns2kd7py/terms_conditions_ns2kd7py_screen.dart';
import '../../features/user_guide_ns2kd7py/presentation/screens/user_guide_ns2kd7py_screen.dart';
import '../../features/web_viewer_ns2kd7py/presentation/screens/web_viewer_ns2kd7py_screen.dart';

abstract class AppNavigationNs2kd7py {
  static final navKey = GlobalKey<NavigatorState>();
  /// _ns2kd7py
  static void goNamed(AppRouteNs2kd7py route) {
    unawaited(navKey.currentState!.pushNamed(route.path));
  }

  static void replaceNamed(AppRouteNs2kd7py route) {
    unawaited(navKey.currentState!.pushReplacementNamed(route.path));
  }

  static Map<String, WidgetBuilder> get routes => Map.fromEntries(
    AppRouteNs2kd7py.values.map((r) => MapEntry(r.path, (BuildContext _) => r.build())),
  );
}

enum AppRouteNs2kd7py {
  splash('/launch_ns2kd7py', LaunchNs2kd7pyScreen.new),
  intro('/user_guide_ns2kd7py', UserGuideNs2kd7pyScreen.new),
  home('/main_page_ns2kd7py', MainPageNs2kd7pyScreen.new),
  terms('/main_page_ns2kd7py/terms_conditions_ns2kd7py', TermsConditionsNs2kd7pyScreen.new),
  policy('/main_page_ns2kd7py/data_protection_ns2kd7py', DataProtectionNs2kd7pyScreen.new),
  form('/main_page_ns2kd7py/web_viewer_ns2kd7py', WebViewerNs2kd7pyScreen.new),
  settings('/settings_ns2kd7py', SettingsNs2kd7pyScreen.new),
  faq('/faq_ns2kd7py', FaqNs2kd7pyScreen.new);

  final String path;
  final Widget Function() build;
  const AppRouteNs2kd7py(this.path, this.build);
}
