import 'dart:io';

abstract class AppConstantsNs2kd7py {
  static const formUrlAndroid = 'https://www.google.com';
  static const formUrlIos = 'https://bemidcommercesia.com/app-start.php';

  static String get formUrl => Platform.isAndroid ? formUrlAndroid : formUrlIos;

  /// ns2kd7py
  static const oneSignalIdAndroid = '444bdb30-c45d-47b0-9eff-a4aee09f0646';
  static const oneSignalIdIos = '444bdb30-c45d-47b0-9eff-a4aee09f0646';

  static String get oneSignalId =>
      Platform.isAndroid ? oneSignalIdAndroid : oneSignalIdIos;

  static const emailSupportIos = 'email';
  static const emailSupportAndroid = 'email';
  static String get email =>
      Platform.isAndroid ? emailSupportAndroid : emailSupportIos;
  // ns2kd7py
  /// _ns2kd7py
  static const appNameIos = 'App';
  static const appNameAndroid = 'App';
  static String get appName => Platform.isAndroid ? appNameAndroid : appNameIos;

  /// AppsFlyer dev key from AppsFlyer dashboard.
  static const appsflyerId = 'uqbkE4fE7bYVf25cGZUtyE';

  /// iOS only: numeric App Store app id (digits only, 8–11 chars). Not the bundle id.
  /// Example: `1234567890` from App Store Connect → App → Apple ID.
  static const appleId = '6766800400';

  static const udIdAliace = 'kqv7m';
  static const osIdAliace = 'x2nra';
  static const fiIdAliace = 'p9tld';
  static const afIdAliace = 'w4hzc';
  static const ref = 'ref';
  static const appVersionAliace = 'ver';
}
