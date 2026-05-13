import 'package:flutter/material.dart';

import 'web_input_screen_ns2kd7py_link_param.dart';
export 'web_input_screen_ns2kd7py_link_param.dart';


class LinkSettingsns2kd7py {
  const LinkSettingsns2kd7py({
    required this.baseLink,
    required this.linkParams,
  });
  final String baseLink;

  /// List of param names and function for retrieve it
  ///
  /// Ex. 'CUID' => FluterUdid.udid
  final List<LinkParamns2kd7py> linkParams;
}

class WebInputScreenns2kd7pyScreenSetting {
  const WebInputScreenns2kd7pyScreenSetting({
    this.headerSettings,
    this.loadingIndicatorSettings = const ProgressIndicatorSettingsns2kd7py(),
    this.backgroundColor,
  });

  final HeaderSettingsns2kd7py? headerSettings;
  final Color? backgroundColor;

  final ProgressIndicatorSettingsns2kd7py loadingIndicatorSettings;
}

class HeaderSettingsns2kd7py {
  HeaderSettingsns2kd7py({
    this.backButton,
    this.title,
    this.textStyle,
    this.backgroundColor,
    this.height,
    this.shape,
  }) : widget = null;

  HeaderSettingsns2kd7py.widget({required Widget this.widget})
    : backButton = null,
      title = null,
      textStyle = null,
      backgroundColor = null,
      height = null,
      shape = null;

  final Widget? backButton;
  final String? title;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? height;
  final ShapeBorder? shape;

  final Widget? widget;
}

class ProgressIndicatorSettingsns2kd7py {
  const ProgressIndicatorSettingsns2kd7py({
    this.behaviour = ProgressIndicatorBehaviourns2kd7py.alwaysSpin,
    this.foregroundColor = Colors.white,
    this.backgroundColor = Colors.black,
  });

  /// If selected [ProgressIndicatorBehaviour.percent] the indicator will be filled depending on the progress of page loading
  ///
  /// if selected [ProgressIndicatorBehaviour.alwaysSpin] - the progress of the page load will be ignored, and the indicator will be just spin
  final ProgressIndicatorBehaviourns2kd7py behaviour;

  final Color foregroundColor;
  final Color backgroundColor;
}

enum ProgressIndicatorBehaviourns2kd7py { percent, alwaysSpin }

class WebInputScreenns2kd7pyAlertSettings {
  const WebInputScreenns2kd7pyAlertSettings({
    required this.alertDialog,
    this.alertBarrierColor,
    this.blurStrength = 0,
    this.alertAfterPop = false,
    this.dismissible = false,
  });

  final Widget alertDialog;
  final Color? alertBarrierColor;
  final double blurStrength;

  /// Firstly return to previous page and then invoke alert dialog
  final bool alertAfterPop;

  final bool dismissible;
}
