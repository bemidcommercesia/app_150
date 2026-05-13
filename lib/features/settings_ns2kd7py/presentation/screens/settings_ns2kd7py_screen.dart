import 'package:flutter/material.dart';

import '../../../../core/navigation_ns2kd7py/app_navigator_ns2kd7py.dart';
import '../../../../general/presentation/widgets_ns2kd7py/dark_nav_screen_ns2kd7py.dart';

class SettingsNs2kd7pyScreen extends StatelessWidget {
  const SettingsNs2kd7pyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DarkNavScreenNs2kd7py(
      title: 'Settings',
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _MenuItem(
            label: 'Privacy Policy',
            onTap: () => AppNavigationNs2kd7py.goNamed(AppRouteNs2kd7py.policy),
          ),
          const SizedBox(height: 8),
          _MenuItem(
            label: 'Terms of Use',
            onTap: () => AppNavigationNs2kd7py.goNamed(AppRouteNs2kd7py.terms),
          ),
          const SizedBox(height: 8),
          _MenuItem(
            label: 'FAQ',
            onTap: () => AppNavigationNs2kd7py.goNamed(AppRouteNs2kd7py.faq),
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  static const _radius = 16.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        foregroundPainter: const _BorderPainter(),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color(0xFF111111),
            borderRadius: BorderRadius.circular(_radius),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontFamily: 'MPLUS1',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 24 / 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BorderPainter extends CustomPainter {
  const _BorderPainter();

  static const double _r = 16;
  static const double _gap = 22;

  @override
  void paint(Canvas canvas, Size size) {
    // Left + TL corner + top  (open at BL start and TR end)
    final path1 = Path()
      ..moveTo(0.5, size.height - _gap)
      ..lineTo(0.5, _r)
      ..arcToPoint(const Offset(_r, 0.5),
          radius: const Radius.circular(_r), clockwise: true)
      ..lineTo(size.width - _gap, 0.5);

    // Right + BR corner + bottom  (open at TR start and BL end)
    final path2 = Path()
      ..moveTo(size.width - 0.5, _gap)
      ..lineTo(size.width - 0.5, size.height - _r)
      ..arcToPoint(Offset(size.width - _r, size.height - 0.5),
          radius: const Radius.circular(_r), clockwise: true)
      ..lineTo(_gap, size.height - 0.5);

    // Each path gets its own gradient rect so both open ends fade
    final rect1 = Rect.fromPoints(
      Offset(0.5, size.height - _gap),
      Offset(size.width - _gap, 0.5),
    );
    final rect2 = Rect.fromPoints(
      Offset(size.width - 0.5, _gap),
      Offset(_gap, size.height - 0.5),
    );

    Shader makeShader(Rect r, double opacity) => LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        Colors.transparent,
        Color.fromRGBO(255, 255, 255, opacity),
        Color.fromRGBO(255, 255, 255, opacity),
        Colors.transparent,
      ],
      stops: const [0.0, 0.02, 0.98, 1.0],
    ).createShader(r);

    canvas.save();
    canvas.clipPath(
      Path()..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(_r + 3),
      )),
    );
    for (final (double w, double o) in [(4.0, 0.02), (2.0, 0.03)]) {
      canvas.drawPath(path1, Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = w
        ..isAntiAlias = true
        ..shader = makeShader(rect1, o));
      canvas.drawPath(path2, Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = w
        ..isAntiAlias = true
        ..shader = makeShader(rect2, o));
    }
    canvas.restore();

    canvas.drawPath(path1, Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true
      ..shader = makeShader(rect1, 0x4D / 255));
    canvas.drawPath(path2, Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true
      ..shader = makeShader(rect2, 0x4D / 255));
  }

  @override
  bool shouldRepaint(_BorderPainter _) => false;
}
