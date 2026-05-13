import 'package:flutter/material.dart';

import '../../../../general/presentation/widgets_ns2kd7py/dark_nav_screen_ns2kd7py.dart';

class FaqNs2kd7pyScreen extends StatelessWidget {
  const FaqNs2kd7pyScreen({super.key});

  static const _items = [
    (
      q: '1. What is this service and how does it operate?',
      a: 'This application acts as a secure digital bridge connecting you with independent third-party lender. You complete a brief form, your data is securely encrypted, and then transmitted to our lending partner network. You may receive a loan offer based on your qualifications. Crucially, we are not a lender. We do not issue loans, make credit decisions, or set loan terms.',
    ),
    (
      q: '2. Who is eligible to use the application?',
      a: 'The platform is available to U.S. residents aged 18 or older with the legal capacity to enter into contracts. Note that specific eligibility criteria can vary by lender and state of residence.',
    ),
    (
      q: '3. Are there any fees for utilizing this platform?',
      a: 'There are no fees charged to you for using our service, including downloading the app, registering, or submitting a request. Any costs associated with a loan (like interest rates or charges) are determined solely by the lending partner and must be fully disclosed before you accept the offer. There is also no penalty for early loan repayment.',
    ),
    (
      q: '4. Will submitting a request affect my credit score?',
      a: 'Submitting an initial loan request through this application will not harm your credit score. If you choose to accept an offer, the lender may perform a formal credit check as a final approval step, which could then be reflected on your credit report.',
    ),
    (
      q: '5. What information is required for the application?',
      a: 'Generally, you will need to provide your full name, date of birth, SSN, address, contact details, employment status, proof of income, and bank information. The exact requirements may differ slightly depending on the lender.',
    ),
    (
      q: '6. How long does the application review typically take?',
      a: 'Most applications are reviewed quickly, often in just a few minutes. Processing time may vary based on the lender\'s verification requirements and current request volume. You will be instantly notified once a decision or the next steps are finalized.',
    ),
    (
      q: '7. How are loans repaid, and what if I can\'t make a payment?',
      a: 'All loan repayments are handled directly with your chosen lender, not through this application. Your lender will provide you with a detailed payment schedule and methods. If you anticipate any difficulty meeting a deadline, you must contact your lender immediately.',
    ),
    (
      q: '8. Is my private information protected?',
      a: 'Yes. All data submitted is protected by industry-standard encryption during transmission. We do not sell your personal information. Your data is shared exclusively with our lending partners and necessary service providers for the sole purpose of processing your request, as detailed in our Privacy Policy.',
    ),
    (
      q: '9. Can this service help with debt consolidation?',
      a: 'Debt consolidation is the process of combining multiple high-interest debts into a single loan with one monthly payment, potentially simplifying repayment and reducing overall interest. Our network may present suitable consolidation loan options. Whether this is a good choice for you depends on the rate you qualify for versus your existing debt obligations. We recommend consulting a qualified financial advisor.',
    ),
    (
      q: '10. What should I do if I experience technical issues?',
      a: 'Start by restarting the app, rebooting your device, and confirming the app is the latest version. If the problem persists, please contact our support team with a full description of the issue, including your device model and operating system details.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DarkNavScreenNs2kd7py(
      title: 'FAQ',
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        itemCount: _items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (_, i) => _FaqItem(
          question: _items[i].q,
          answer: _items[i].a,
        ),
      ),
    );
  }
}

class _FaqItem extends StatefulWidget {
  const _FaqItem({required this.question, required this.answer});

  final String question;
  final String answer;

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: _expanded ? const _FaqBorderPainter() : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: _expanded
              ? const Color(0x33151515)
              : const Color(0xFF161616),
          borderRadius: BorderRadius.circular(_expanded ? 16 : 10),
        ),
        child: GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: _expanded ? 24 : 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.question,
                          style: const TextStyle(
                            fontFamily: 'MPLUS1',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      AnimatedRotation(
                        turns: _expanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 250),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF1AEF0F),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  if (_expanded) ...[
                    const SizedBox(height: 20),
                    Text(
                      widget.answer,
                      style: const TextStyle(
                        fontFamily: 'MPLUS1',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        height: 1.4,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
    );
  }
}

class _FaqBorderPainter extends CustomPainter {
  const _FaqBorderPainter();

  static const double _r = 16;
  static const double _gap = 22;

  @override
  void paint(Canvas canvas, Size size) {
    final path1 = Path()
      ..moveTo(0.5, size.height - _gap)
      ..lineTo(0.5, _r)
      ..arcToPoint(const Offset(_r, 0.5),
          radius: const Radius.circular(_r), clockwise: true)
      ..lineTo(size.width - _gap, 0.5);

    final path2 = Path()
      ..moveTo(size.width - 0.5, _gap)
      ..lineTo(size.width - 0.5, size.height - _r)
      ..arcToPoint(Offset(size.width - _r, size.height - 0.5),
          radius: const Radius.circular(_r), clockwise: true)
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

    canvas.saveLayer(rect, Paint()); // master layer — gradient mask applied at restore

    // Clip glow to rounded rect so outer corners of thick strokes are rounded
    canvas.save();
    canvas.clipPath(
      Path()..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(_r + 3),
      )),
    );
    final glowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;
    const glowLayers = [
      (width: 10.0, opacity: 0.04),
      (width: 7.0,  opacity: 0.07),
      (width: 4.5,  opacity: 0.10),
      (width: 2.5,  opacity: 0.14),
    ];
    for (final layer in glowLayers) {
      glowPaint
        ..color = Color.fromRGBO(255, 255, 255, layer.opacity)
        ..strokeWidth = layer.width;
      canvas.drawPath(path1, glowPaint);
      canvas.drawPath(path2, glowPaint);
    }
    canvas.restore(); // restore clip

    // Crisp border line on top
    canvas.drawPath(path1, strokePaint);
    canvas.drawPath(path2, strokePaint);

    canvas.drawRect(rect, maskPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_FaqBorderPainter oldDelegate) => false;
}
