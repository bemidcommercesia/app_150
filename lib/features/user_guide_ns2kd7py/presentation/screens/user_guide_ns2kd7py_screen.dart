import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/navigation_ns2kd7py/app_navigator_ns2kd7py.dart';
import '../user_guide_ns2kd7py_entry_ns2kd7py.dart';

class UserGuideNs2kd7pyScreen extends StatefulWidget {
  const UserGuideNs2kd7pyScreen({super.key});

  @override
  State<UserGuideNs2kd7pyScreen> createState() =>
      _UserGuideNs2kd7pyScreenState();
}

class _UserGuideNs2kd7pyScreenState extends State<UserGuideNs2kd7pyScreen> {
  static const _duration = Duration(milliseconds: 350);
  static const _curve = Curves.easeInOut;

  static const _green = Color(0xFF1AEF0F);
  static const _dark = Color(0xFF0D0D0C);
  static const _grey = Color(0xFF7C7C7C);

  final _entries = UserGuideNs2kd7pyEntry.values;
  final _pageController = PageController();
  final _pageIndex = ValueNotifier<int>(0);

  void _onPageChanged(int index) => _pageIndex.value = index;

  void _onButtonTap(int index) {
    if (index < _entries.length - 1) {
      unawaited(_pageController.nextPage(duration: _duration, curve: _curve));
    } else {
      AppNavigationNs2kd7py.replaceNamed(AppRouteNs2kd7py.home);
    }
  }

  void _onSkip() => AppNavigationNs2kd7py.replaceNamed(AppRouteNs2kd7py.home);

  @override
  void dispose() {
    _pageController.dispose();
    _pageIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _dark,
      body: ValueListenableBuilder<int>(
        valueListenable: _pageIndex,
        builder: (context, index, _) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // ─── PageView (backgrounds) ───────────────────────────
              PageView.builder(
                controller: _pageController,
                itemCount: _entries.length,
                onPageChanged: _onPageChanged,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, i) => Image.asset(
                  _entries[i].imagePath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),

              // ─── Gradient overlay ─────────────────────────────────
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 348,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.62177],
                      colors: [Color(0x00000000), Color(0xFF010000)],
                    ),
                  ),
                ),
              ),

              // ─── Bottom content (text + button) ───────────────────
              Positioned(
                left: 16,
                right: 16,
                bottom: 53,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Headline + subtitle
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _AnimatedRichTitle(
                            entries: _entries,
                            index: index,
                            green: _green,
                          ),
                          const SizedBox(height: 8),
                          _AnimatedSubtitle(
                            entries: _entries,
                            index: index,
                            grey: _grey,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Button
                    _MainButton(
                      label: _entries[index].buttonText,
                      onTap: () => _onButtonTap(index),
                      green: _green,
                      dark: _dark,
                    ),
                  ],
                ),
              ),

              // ─── Skip button ──────────────────────────────────────
              Positioned(
                top: 71,
                right: 28,
                child: AnimatedOpacity(
                  opacity: index == 0 ? 1.0 : 0.0,
                  duration: _duration,
                  child: IgnorePointer(
                    ignoring: index != 0,
                    child: GestureDetector(
                      onTap: _onSkip,
                      behavior: HitTestBehavior.opaque,
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontFamily: 'Kufam',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ─── Animated headline ─────────────────────────────────────────────────────

class _AnimatedRichTitle extends StatelessWidget {
  const _AnimatedRichTitle({
    required this.entries,
    required this.index,
    required this.green,
  });

  final List<UserGuideNs2kd7pyEntry> entries;
  final int index;
  final Color green;

  @override
  Widget build(BuildContext context) {
    final entry = entries[index];
    const style = TextStyle(
      fontFamily: 'MPLUS1',
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: 1.1,
      color: Colors.white,
    );
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, anim) =>
          FadeTransition(opacity: anim, child: child),
      child: Align(
        key: ValueKey(index),
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            style: style,
            children: [
              if (entry.titleStart.isNotEmpty)
                TextSpan(text: entry.titleStart),
              TextSpan(
                text: entry.titleHighlight,
                style: style.copyWith(color: green),
              ),
              if (entry.titleEnd.isNotEmpty) TextSpan(text: entry.titleEnd),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Animated subtitle ────────────────────────────────────────────────────

class _AnimatedSubtitle extends StatelessWidget {
  const _AnimatedSubtitle({
    required this.entries,
    required this.index,
    required this.grey,
  });

  final List<UserGuideNs2kd7pyEntry> entries;
  final int index;
  final Color grey;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, anim) =>
          FadeTransition(opacity: anim, child: child),
      child: Align(
        key: ValueKey(index),
        alignment: Alignment.centerLeft,
        child: Text(
          entries[index].subtitle,
          style: TextStyle(
            fontFamily: 'Kufam',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.4,
            color: grey,
          ),
        ),
      ),
    );
  }
}

// ─── Main button ─────────────────────────────────────────────────────────

class _MainButton extends StatelessWidget {
  const _MainButton({
    required this.label,
    required this.onTap,
    required this.green,
    required this.dark,
  });

  final String label;
  final VoidCallback onTap;
  final Color green;
  final Color dark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, anim) =>
                  FadeTransition(opacity: anim, child: child),
              child: Text(
                label,
                key: ValueKey(label),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'MPLUS1',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  height: 24 / 22,
                  color: dark,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
