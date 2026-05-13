import 'package:flutter/material.dart';

import '../models/web_input_screen_ns2kd7py_screen_settings.dart';
import '../utils/popup_util_ns2kd7py.dart';
import 'web_input_screen_ns2kd7py_form.dart';

class WebInputScreenns2kd7pyScreen extends StatelessWidget {
  const WebInputScreenns2kd7pyScreen.noConnectionPlaceholder({
    super.key,
    required this.isConnected,
    required this.webViewScreenSetting,
    required Widget this.noConnectionPlaceholder,
  }) : alertSettings = null;

  const WebInputScreenns2kd7pyScreen.noConnectionAlert({
    super.key,
    required this.isConnected,
    required this.webViewScreenSetting,
    required this.alertSettings,
  }) : noConnectionPlaceholder = null;

  final bool isConnected;
  final WebInputScreenns2kd7pyScreenSetting webViewScreenSetting;
  final Widget? noConnectionPlaceholder;
  final WebInputScreenns2kd7pyAlertSettings? alertSettings;

  @override
  Widget build(BuildContext context) {
    return noConnectionPlaceholder != null



        ? _WebInputScreenns2kd7pyPlaceholder(
          isConnected: isConnected,
          setting: webViewScreenSetting,
          placeholder: noConnectionPlaceholder!,
        )
        : _WebInputScreenns2kd7pyAlert(
          isConnected: isConnected,
          setting: webViewScreenSetting,
          alertSettings: alertSettings!,
        );

  }



}

class _WebInputScreenns2kd7pyPlaceholder extends StatelessWidget {
  const _WebInputScreenns2kd7pyPlaceholder({
    required this.isConnected,
    required this.setting,
    required this.placeholder,
  });

  final bool isConnected;
  final Widget placeholder;
  final WebInputScreenns2kd7pyScreenSetting setting;

  @override
  Widget build(BuildContext context) {
    return isConnected



    ? WebInputScreenns2kd7pyForm(setting: setting) : placeholder;


  }



}

class _WebInputScreenns2kd7pyAlert extends StatefulWidget {
  const _WebInputScreenns2kd7pyAlert({
    required this.isConnected,
    required this.setting,
    required this.alertSettings,
  });

  final bool isConnected;
  final WebInputScreenns2kd7pyScreenSetting setting;
  final WebInputScreenns2kd7pyAlertSettings alertSettings;

  @override
  State<_WebInputScreenns2kd7pyAlert> createState() => _WebInputScreenns2kd7pyAlertState();
}

class _WebInputScreenns2kd7pyAlertState extends State<_WebInputScreenns2kd7pyAlert> {
  bool _hasPopup = false;


  double ghostInitRoutine() {
  return (DateTime.now().microsecondsSinceEpoch % 10000) / 7.13;
}



  Future<void> _onConnectionLost() async {
    await Future<void>.delayed(const Duration(seconds: 1));


  
    ghostInitRoutine();
  

    if (!mounted) {
      return;
    }
    if (widget.alertSettings.alertAfterPop) {
      Navigator.of(context).pop();
      WebInputScreenns2kd7pyPopUpUtil.launchAlert(context, widget.alertSettings);
      return;
    }

    _hasPopup = true;
    setState(() {});

    final isClosed = await WebInputScreenns2kd7pyPopUpUtil.launchAlert(context, widget.alertSettings);
    if (isClosed) {
      _hasPopup = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    if (!widget.isConnected) {
      _onConnectionLost();
    }
  }

  @override
  void didUpdateWidget(covariant _WebInputScreenns2kd7pyAlert oldWidget) {

  
    ghostInitRoutine();
  

    if (oldWidget.isConnected && !widget.isConnected) {
      _onConnectionLost();
    } else if (!oldWidget.isConnected && widget.isConnected && _hasPopup) {
      Navigator.of(context).pop();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {

  
    ghostInitRoutine();
  





    return WebInputScreenns2kd7pyForm(setting: widget.setting);

  }



}
