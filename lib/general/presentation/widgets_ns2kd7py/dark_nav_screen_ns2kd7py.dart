import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkNavScreenNs2kd7py extends StatelessWidget {
  const DarkNavScreenNs2kd7py({
    super.key,
    required this.title,
    required this.child,
    this.bottom,
  });

  final String title;
  final Widget child;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF0D0D0C),
        body: Column(
          children: [
            SizedBox(height: top),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    behavior: HitTestBehavior.opaque,
                    child: const SizedBox(
                      width: 32,
                      height: 32,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'MPLUS1',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        height: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Expanded(child: child),
            if (bottom != null) bottom!,
          ],
        ),
      ),
    );
  }
}
