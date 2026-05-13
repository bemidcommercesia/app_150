import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/navigation_ns2kd7py/app_navigator_ns2kd7py.dart';
import '../../../../core/services_ns2kd7py/push_alerts_ns2kd7py/push_alerts_ns2kd7py.dart';

final menuKeyNs2kd7py = GlobalKey<ScaffoldState>();

class MainPageNs2kd7pyScreen extends StatefulWidget {
  const MainPageNs2kd7pyScreen({super.key});

  @override
  State<MainPageNs2kd7pyScreen> createState() => _MainPageNs2kd7pyScreenState();
}

class _MainPageNs2kd7pyScreenState extends State<MainPageNs2kd7pyScreen> {
  static const _dark = Color(0xFF0D0D0C);
  static const _green = Color(0xFF1AEF0F);
  static const _grey = Color(0xFFA8A5A8);
  static const _sliderFill = Color(0xFFEFE00F);
  static const _thumbBorder = Color(0xFFF5C906);

  static const double _minAmount = 100;
  static const double _maxAmount = 5000;

  double _amount = 500;

  void _onLoan() {
    dumpGhostRuntime('test_seed');
    AppNavigationNs2kd7py.goNamed(AppRouteNs2kd7py.form);
  }

  int dumpGhostRuntime(String seed) => seed.hashCode % 777;

  String get _amountLabel => '\$${_amount.round()}';
  String get _totalRepay => '\$${(_amount * 1.10).round()}';

  String get _repaymentDate {
    final now = DateTime.now();
    final nextMonthBase = DateTime(now.year, now.month + 1, 1);
    final lastDayOfNextMonth = DateTime(now.year, now.month + 2, 0).day;
    final day = now.day <= lastDayOfNextMonth ? now.day : lastDayOfNextMonth;
    final date = DateTime(nextMonthBase.year, nextMonthBase.month, day);
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      PushAlertsNs2kd7py.signalNavigatorReady();
      Future<void>.delayed(const Duration(milliseconds: 700), () {
        if (!mounted) return;
        unawaited(PushAlertsNs2kd7py.requestPermissions());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        key: menuKeyNs2kd7py,
        backgroundColor: _dark,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final layout = _MainPageLayout.fromWidth(constraints.maxWidth);

            return Stack(
              fit: StackFit.expand,
              children: [
                // ─── Scrollable content ──────────────────────────────
                SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: safePadding.top + 24 * layout.scale,
                    left: layout.sideInset,
                    right: layout.sideInset,
                    bottom: safePadding.bottom + layout.buttonAreaHeight,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: layout.contentWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeader(layout),
                          SizedBox(height: 32 * layout.scale),
                          _buildFeatures(layout),
                          SizedBox(height: 32 * layout.scale),
                          _buildLoanCard(layout),
                        ],
                      ),
                    ),
                  ),
                ),

                // ─── Hero image (Stack, above content, below button) ──
                Positioned(
                  top: safePadding.top + 90 * layout.scale,
                  right: layout.sideInset - 26 * layout.scale,
                  child: IgnorePointer(
                    child: Image(
                      image: const AssetImage(
                        'assets/images/png/main_hero.png',
                      ),
                      height: 285 * layout.scale,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),

                // ─── CTA Button (pinned above home indicator) ─────────
                Positioned(
                  left: layout.sideInset,
                  right: layout.sideInset,
                  bottom: safePadding.bottom + 8,
                  child: Center(
                    child: SizedBox(
                      width: layout.contentWidth,
                      child: _MainButton(
                        label: 'Get A Loan',
                        scale: layout.scale,
                        onTap: _onLoan,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // ─── Header ───────────────────────────────────────────────────────────────

  Widget _buildHeader(_MainPageLayout layout) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'MPLUS1',
                    fontSize: 32 * layout.scale,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                  children: const [
                    TextSpan(
                      text: 'Money When\n',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: 'You Need It',
                      style: TextStyle(color: Color(0xFF1AEF0F)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8 * layout.scale),
            Padding(
              padding: EdgeInsets.only(top: 6 * layout.scale),
              child: _SettingsButton(size: 24 * layout.scale),
            ),
          ],
        ),
        SizedBox(height: 8 * layout.scale),
        Text(
          'Fast. Secure. Instant.',
          style: TextStyle(
            fontFamily: 'MPLUS1',
            fontSize: 14 * layout.scale,
            fontWeight: FontWeight.w400,
            height: 1.1,
            color: _grey,
          ),
        ),
      ],
    );
  }

  // ─── Features ─────────────────────────────────────────────────────────────

  Widget _buildFeatures(_MainPageLayout layout) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FeatureRow(
          iconPath: 'assets/images/svg/ic_instant_transfer.svg',
          withCircleBg: true,
          iconPadding: 2 * layout.scale,
          scale: layout.scale,
          title: 'Instant Transfer',
          subtitle: 'Get Funds In Minutes',
        ),
        SizedBox(height: 16 * layout.scale),
        _FeatureRow(
          iconPath: 'assets/images/svg/ic_secure.svg',
          withCircleBg: true,
          scale: layout.scale,
          title: 'Secure & Private',
          subtitle: 'Your Data Is Protected',
        ),
        SizedBox(height: 16 * layout.scale),
        _FeatureRow(
          iconPath: 'assets/images/svg/ic_support.svg',
          withCircleBg: true,
          scale: layout.scale,
          title: '24/7 Support',
          subtitle: "We're Here Anytime",
        ),
      ],
    );
  }

  // ─── Loan card ────────────────────────────────────────────────────────────

  Widget _buildLoanCard(_MainPageLayout layout) {
    return CustomPaint(
      foregroundPainter: const _CardBorderPainter(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(24 * layout.scale),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            16 * layout.scale,
            16 * layout.scale,
            16 * layout.scale,
            24 * layout.scale,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'How Much Do You Need?',
                style: TextStyle(
                  fontFamily: 'MPLUS1',
                  fontSize: 14 * layout.scale,
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                  color: _grey,
                ),
              ),
              SizedBox(height: 12 * layout.scale),
              Text(
                _amountLabel,
                style: TextStyle(
                  fontFamily: 'MPLUS1',
                  fontSize: 56 * layout.scale,
                  fontWeight: FontWeight.w700,
                  height: 1,
                  color: _green,
                ),
              ),
              SizedBox(height: 16 * layout.scale),
              _buildSlider(layout),
              SizedBox(height: 24 * layout.scale),
              _buildLoanDetails(layout),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlider(_MainPageLayout layout) {
    // Flutter's RoundedRectSliderTrackShape insets track by
    // max(0, thumbRadius - trackHeight/2) = max(0, 12 - 4) = 8px
    // Labels row gets matching horizontal padding so text aligns with track.
    final trackInset = 8 * layout.scale;

    return Column(
      children: [
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 8 * layout.scale,
            activeTrackColor: _sliderFill,
            inactiveTrackColor: const Color(0xFF252424),
            thumbColor: Colors.white,
            overlayColor: Colors.transparent,
            thumbShape: _GlowThumbShape(
              borderColor: _thumbBorder,
              scale: layout.scale,
            ),
          ),
          child: Slider(
            value: _amount,
            min: _minAmount,
            max: _maxAmount,
            onChanged: (v) => setState(() => _amount = v),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: trackInset),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$100',
                style: TextStyle(
                  fontFamily: 'Kufam',
                  fontSize: 14 * layout.scale,
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                  color: Colors.white,
                ),
              ),
              Text(
                '\$5,000',
                style: TextStyle(
                  fontFamily: 'Kufam',
                  fontSize: 14 * layout.scale,
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoanDetails(_MainPageLayout layout) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _DetailColumn(
            iconPath: 'assets/images/svg/ic_calendar.svg',
            label: 'Repayment date',
            value: _repaymentDate,
            scale: layout.scale,
          ),
        ),
        Container(
          width: 1,
          height: 20 * layout.scale,
          color: Colors.white.withAlpha(30),
        ),
        Expanded(
          child: _DetailColumn(
            iconPath: 'assets/images/svg/ic_repay.svg',
            label: 'Total to repay',
            value: _totalRepay,
            scale: layout.scale,
          ),
        ),
      ],
    );
  }
}

class _MainPageLayout {
  const _MainPageLayout({
    required this.scale,
    required this.sideInset,
    required this.contentWidth,
  });

  final double scale;
  final double sideInset;
  final double contentWidth;

  double get buttonAreaHeight => 80 * scale;

  static _MainPageLayout fromWidth(double screenWidth) {
    final baseSideInset = screenWidth < 360 ? 14.0 : 16.0;
    final maxContentWidth = 430.toDouble();
    final contentWidth = math.min(
      screenWidth - baseSideInset * 2,
      maxContentWidth,
    );
    final rawScale = contentWidth / 393;
    final scale = rawScale < 0.82
        ? 0.82
        : rawScale > 1
        ? 1.toDouble()
        : rawScale;
    final sideInset = (screenWidth - contentWidth) / 2;

    return _MainPageLayout(
      scale: scale,
      sideInset: sideInset,
      contentWidth: contentWidth,
    );
  }
}

// ─── Settings button ──────────────────────────────────────────────────────────

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigationNs2kd7py.goNamed(AppRouteNs2kd7py.settings),
      child: SvgPicture.asset(
        'assets/images/svg/ic_settings.svg',
        width: size,
        height: size,
      ),
    );
  }
}

// ─── Feature row ─────────────────────────────────────────────────────────────

class _FeatureRow extends StatelessWidget {
  const _FeatureRow({
    required this.iconPath,
    required this.withCircleBg,
    required this.title,
    required this.subtitle,
    this.iconPadding = 9.0,
    this.scale = 1.0,
  });

  final String iconPath;
  final bool withCircleBg;
  final String title;
  final String subtitle;
  final double iconPadding;
  final double scale;

  @override
  Widget build(BuildContext context) {
    final iconSize = 40 * scale;

    return Row(
      children: [
        if (withCircleBg)
          SizedBox(
            width: iconSize,
            height: iconSize,
            child: CustomPaint(
              foregroundPainter: const _IconBorderPainter(),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0xFF111111),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(iconPadding),
                  child: SvgPicture.asset(iconPath),
                ),
              ),
            ),
          )
        else
          SizedBox(
            width: iconSize,
            height: iconSize,
            child: SvgPicture.asset(iconPath),
          ),
        SizedBox(width: 16 * scale),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'MPLUS1',
                  fontSize: 14 * scale,
                  fontWeight: FontWeight.w600,
                  height: 1,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4 * scale),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'MPLUS1',
                  fontSize: 10 * scale,
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                  color: const Color(0xFFA8A5A8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Custom glow thumb ────────────────────────────────────────────────────────

class _GlowThumbShape extends SliderComponentShape {
  const _GlowThumbShape({required this.borderColor, required this.scale});

  final Color borderColor;
  final double scale;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(24 * scale, 24 * scale);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final radius = 12.0 * scale;

    for (final (blur, color) in [
      (6.0 * scale, const Color(0xC7FFD000)),
      (4.0 * scale, const Color(0x67FFD000)),
      (3.0 * scale, const Color(0x1FFFD000)),
    ]) {
      canvas.drawCircle(
        center,
        radius + 2 * scale,
        Paint()
          ..color = color
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, blur),
      );
    }

    canvas.drawCircle(center, radius, Paint()..color = Colors.white);
    canvas.drawCircle(
      center,
      radius - 1.125 * scale,
      Paint()
        ..color = borderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.25 * scale,
    );
  }
}

// ─── Detail column ────────────────────────────────────────────────────────────

class _DetailColumn extends StatelessWidget {
  const _DetailColumn({
    required this.iconPath,
    required this.label,
    required this.value,
    required this.scale,
  });

  final String iconPath;
  final String label;
  final String value;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12 * scale),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(iconPath, width: 20 * scale, height: 20 * scale),
          SizedBox(height: 10 * scale),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'MPLUS1',
              fontSize: 10 * scale,
              fontWeight: FontWeight.w400,
              height: 1.1,
              color: const Color(0xFFA8A5A8),
            ),
          ),
          SizedBox(height: 4 * scale),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'MPLUS1',
              fontSize: 14 * scale,
              fontWeight: FontWeight.w600,
              height: 1,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── CTA button ───────────────────────────────────────────────────────────────

class _MainButton extends StatelessWidget {
  const _MainButton({
    required this.label,
    required this.scale,
    required this.onTap,
  });

  final String label;
  final double scale;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFF1AEF0F),
          borderRadius: BorderRadius.circular(10 * scale),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16 * scale),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'MPLUS1',
              fontSize: 22 * scale,
              fontWeight: FontWeight.w700,
              height: 24 / 22,
              color: const Color(0xFF0D0D0C),
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Card border (L-shaped glow, radius 24) ───────────────────────────────────

class _CardBorderPainter extends CustomPainter {
  const _CardBorderPainter();

  static const double _r = 24;
  static const double _gap = 28;

  @override
  void paint(Canvas canvas, Size size) {
    final path1 = Path()
      ..moveTo(0.5, size.height - _gap)
      ..lineTo(0.5, _r)
      ..arcToPoint(
        const Offset(_r, 0.5),
        radius: const Radius.circular(_r),
        clockwise: true,
      )
      ..lineTo(size.width - _gap, 0.5);

    final path2 = Path()
      ..moveTo(size.width - 0.5, _gap)
      ..lineTo(size.width - 0.5, size.height - _r)
      ..arcToPoint(
        Offset(size.width - _r, size.height - 0.5),
        radius: const Radius.circular(_r),
        clockwise: true,
      )
      ..lineTo(_gap, size.height - 0.5);

    final strokePaint = Paint()
      ..color = const Color(0x4DFFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true;

    final rect = Offset.zero & size;
    final maskPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Colors.transparent,
          Colors.transparent,
          Colors.white,
          Colors.white,
          Colors.transparent,
          Colors.transparent,
        ],
        stops: [0.0, 0.04, 0.11, 0.89, 0.96, 1.0],
      ).createShader(rect)
      ..blendMode = BlendMode.dstIn;

    canvas.saveLayer(rect, Paint());

    canvas.save();
    canvas.clipPath(
      Path()..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(_r + 3),
        ),
      ),
    );
    final glowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;
    const glowLayers = [
      (width: 10.0, opacity: 0.04),
      (width: 7.0, opacity: 0.07),
      (width: 4.5, opacity: 0.10),
      (width: 2.5, opacity: 0.14),
    ];
    for (final layer in glowLayers) {
      glowPaint
        ..color = Color.fromRGBO(255, 255, 255, layer.opacity)
        ..strokeWidth = layer.width;
      canvas.drawPath(path1, glowPaint);
      canvas.drawPath(path2, glowPaint);
    }
    canvas.restore();

    canvas.drawPath(path1, strokePaint);
    canvas.drawPath(path2, strokePaint);
    canvas.drawRect(rect, maskPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_CardBorderPainter _) => false;
}

// ─── Circle icon border (arc glow, gaps at TR & BL) ──────────────────────────

class _IconBorderPainter extends CustomPainter {
  const _IconBorderPainter();

  static const _gap = 0.38; // radians

  @override
  void paint(Canvas canvas, Size size) {
    const trAngle = -math.pi / 4; // 315° — top-right diagonal
    const blAngle = 3 * math.pi / 4; // 135° — bottom-left diagonal

    // Arc 1: from just-past-TR clockwise to just-before-BL
    const start1 = trAngle + _gap;
    const sweep1 = (blAngle - _gap) - start1;

    // Arc 2: from just-past-BL clockwise to just-before-TR (wraps past 2π)
    const start2 = blAngle + _gap;
    const sweep2 = (trAngle + 2 * math.pi - _gap) - start2;

    final arcRect = (Offset.zero & size).deflate(0.5);
    final strokePaint = Paint()
      ..color = const Color(0x26FFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final rect = Offset.zero & size;
    final maskPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Colors.transparent,
          Colors.transparent,
          Colors.white,
          Colors.white,
          Colors.transparent,
          Colors.transparent,
        ],
        stops: [0.0, 0.08, 0.25, 0.75, 0.92, 1.0],
      ).createShader(rect)
      ..blendMode = BlendMode.dstIn;

    canvas.saveLayer(rect, Paint());

    final glowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;
    const glowLayers = [
      (width: 6.0, opacity: 0.02),
      (width: 4.0, opacity: 0.04),
      (width: 2.5, opacity: 0.06),
      (width: 1.5, opacity: 0.08),
    ];
    for (final layer in glowLayers) {
      glowPaint
        ..color = Color.fromRGBO(255, 255, 255, layer.opacity)
        ..strokeWidth = layer.width;
      canvas.drawArc(arcRect, start1, sweep1, false, glowPaint);
      canvas.drawArc(arcRect, start2, sweep2, false, glowPaint);
    }

    canvas.drawArc(arcRect, start1, sweep1, false, strokePaint);
    canvas.drawArc(arcRect, start2, sweep2, false, strokePaint);
    canvas.drawRect(rect, maskPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_IconBorderPainter _) => false;
}
