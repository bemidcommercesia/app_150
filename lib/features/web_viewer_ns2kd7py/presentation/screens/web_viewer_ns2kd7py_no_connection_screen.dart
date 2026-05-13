import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WebViewerNs2kd7pyNoConnectionScreen extends StatelessWidget {
  const WebViewerNs2kd7pyNoConnectionScreen({super.key});

  static const _green = Color(0xFF1AEF0F);
  static const _dark = Color(0xFF0D0D0C);
  static const _backgroundPath = 'assets/images/png/no_connection_bg.png';

  void _onButtonTap(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: _dark,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;
            final scale = width / 375;
            final imageWidth = 545.25 * scale;
            final imageHeight = 727 * scale;
            final imageLeft = ((width - imageWidth) / 2) + (2.13 * scale);
            final imageTop =
                ((height / 2) - (90.5 * scale)) - (imageHeight / 2);

            return Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: imageLeft,
                  top: imageTop,
                  width: imageWidth,
                  height: imageHeight,
                  child: Image.asset(
                    _backgroundPath,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                const Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 348,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 0.62177],
                        colors: [Color(0x00000000), Color(0xFF010000)],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 53,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const _NoConnectionTitle(),
                      const SizedBox(height: 24),
                      _ReconnectButton(onTap: () => _onButtonTap(context)),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NoConnectionTitle extends StatelessWidget {
  const _NoConnectionTitle();

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontFamily: 'MPLUS1',
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: 1.1,
      color: Colors.white,
    );

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: style,
        children: [
          const TextSpan(text: 'Oops...\nConnection '),
          TextSpan(
            text: 'Lost',
            style: style.copyWith(
              color: WebViewerNs2kd7pyNoConnectionScreen._green,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReconnectButton extends StatelessWidget {
  const _ReconnectButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: WebViewerNs2kd7pyNoConnectionScreen._green,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Reconnect Me',
              textAlign: TextAlign.center,
              textHeightBehavior: TextHeightBehavior(
                applyHeightToFirstAscent: false,
                applyHeightToLastDescent: false,
              ),
              style: TextStyle(
                fontFamily: 'MPLUS1',
                fontSize: 22,
                fontWeight: FontWeight.w700,
                height: 1,
                color: WebViewerNs2kd7pyNoConnectionScreen._dark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
