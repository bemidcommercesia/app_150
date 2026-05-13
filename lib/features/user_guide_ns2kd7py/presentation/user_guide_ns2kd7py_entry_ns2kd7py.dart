enum UserGuideNs2kd7pyEntry {
  first,
  second;

  String get imagePath => switch (this) {
        UserGuideNs2kd7pyEntry.first => 'assets/images/png/onboarding1.png',
        UserGuideNs2kd7pyEntry.second => 'assets/images/png/onboarding2.png',
      };

  String get titleStart => switch (this) {
        UserGuideNs2kd7pyEntry.first => 'Your Financial ',
        UserGuideNs2kd7pyEntry.second => '',
      };

  String get titleHighlight => switch (this) {
        UserGuideNs2kd7pyEntry.first => 'Friend',
        UserGuideNs2kd7pyEntry.second => 'Flash',
      };

  String get titleEnd => switch (this) {
        UserGuideNs2kd7pyEntry.first => '',
        UserGuideNs2kd7pyEntry.second => ' Approval',
      };

  String get subtitle => switch (this) {
        UserGuideNs2kd7pyEntry.first =>
          'Borrow up to \$300 without the stress or the paperwork.',
        UserGuideNs2kd7pyEntry.second =>
          'Watch your balance grow in real-time. Speed is our middle name',
      };

  String get buttonText => switch (this) {
        UserGuideNs2kd7pyEntry.first => 'Next',
        UserGuideNs2kd7pyEntry.second => 'Get started',
      };
}
