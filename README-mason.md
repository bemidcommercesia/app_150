# How to use?

---

#### [1. Generating mason code](#generate-app)
#### [2. Adding platform to project](#adding-required-platform)
#### [3. Additional Steps:](#additional-steps)
- [1 Assets](#1-assets)
    - [1.1 TextStyles](#11-textstyles)
    - [1.2 Colors](#12-appcolors)
    - [1.3 AppConstants](#13-appconstants)
- [2 SplashScreen image](#2-change-splashscreen-image-)
- [3 Onboarding](#3-then-i-change-onboardingentry-)
- [4 HomeScreen](#4-homescreen-)
- [5 Form](#5-formscreen)
    - [5.0 Link Preloader](#50-link-preloader)
    - [5.1 NoConnectionScreen](#51-noconnectionscreen)
    - [5.2 FormScreen.placeholder](#52-formscreen-placeholder)
    - [5.3 FormScreen.alert](#53-formscreen-alert)
- [6 ServiceScreen](#6-services-screen)
    - [6.1 Obtain html text](#61-obtain-html-text-in-terms--privacy-section)
    - [6.2 Setup text styles](#62-setup-text-styles)
    - [6.3 ServiceScreen UI](#63-services-screen-ui)
    - [6.4 Result](#64-as-result)

#### [4. Additional Modules:](#additional-modules)
- [AndroidRef](#1-androidref-module)
    - [Initialization](#11-initialization)
    - [Usage](#12-usage)

- [SmallScreen](#2-smallscreenadapter)
    - [Initialization](#21-initialization)
    - [Usage](#22-usage)
- [FacebookDeviceIDs](#3-facebookdeviceids)
    - [Pre-requirements](#31-pre-requirements)
        - [Preparing to creation an app in Meta](#311-preparing-to-creation-an-app-in-meta)
        - [AndroidManifest.xml](#312-androidmanifestxml)
        - [strings.xml](#313-stringsxml)
    - [Initialization](#32-initialization)
    - [Usage](#33-usage)




# Generate app:

### Inside your apps folder execute:

```shell
mason make loan
```
### and type project name, app_050 for example
> **Note**: name can`t starts with number


---
# Adding required platform

#### iOS:

```shell
flutter create . --platforms=ios
```
#### Android:

```shell
flutter create . --platforms=android
```

---

# Additional steps

## 1. Assets

I usually add assets to folders
- fonts
- images
- animations

and run:

```shell
dart run build_runner build -d
```

---

### 1.1 TextStyles:
after that configure TextStyles

```dart
abstract class AppStyles {
  static const title = TextStyle(
    fontSize: 16,
    fontFamily: FontFamily.yourVariableFont,
    /// for Variable fonts
    fontVariations: [FontVariation('wght', 400)],
    height: 20 / 16,
  );
  ...
}
```

> **Note:** HtmlWidget (see more in Paragraph 6.2) supports only static styles (fonts)
>```dart
>  static const title = TextStyle(
>    fontSize: 16,
>    fontFamily: FontFamily.yourFont,
>    /// for Static fonts
>    fontWeight: FontWeight.w400,
>    height: 20 / 16,
> );
>```

---

### 1.2 AppColors
Colors from figma design

```dart
abstract class AppColors {
  static const white = Color(0xffFFFFFF);
  static const black = Color(0xff000000);
  static const grey = Color(0x71ffffff);
}
```

---

### 1.3 AppConstants

```dart
abstract class AppConstants {
  static const formUrlAndroid = 'https:www.google.com';
  static const formUrlIos = 'https:www.google.com';

  static String get formUrl => Platform.isAndroid ? formUrlAndroid : formUrlIos;
  static const oneSignalIdAndroid = '0000';
  static const oneSignalIdIos = '0000';

  static String get oneSignalId =>
      Platform.isAndroid ? oneSignalIdAndroid : oneSignalIdIos;

  /// For Services Screens
  static const emailSupportIos = 'email';
  static const emailSupportAndroid = 'email';
  static String get email =>
      Platform.isAndroid ? emailSupportAndroid : emailSupportIos;
  static const appNameIos = 'App';
  static const appNameAndroid = 'App';
  static String get appName => Platform.isAndroid ? appNameAndroid : appNameIos;

  /// Parameters names for WebView form
  static const udIdAliace = 'unity';
  static const osIdAliace = 'odsi';
  static const fiIdAliace = 'feed';
  static const ref = 'ref';
}
```

---

## 2. Change SplashScreen image
(name can be different depends on generation)

```dart
class _BootEmip6wvnScreenState extends State<BootEmip6wvnScreen> {
  Future<void> _launchNextScreen() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    /// Here need to manually get counter from generated Module
    /// module name can be different depends on generation
    /// 
    // final launch = await UsageCounteremip6wvn.getCounter();
    // final destination =
    // launch == 1 ? AppRouteEmip6wvn.intro : AppRouteEmip6wvn.home;
    final destination = true ? AppRouteEmip6wvn.intro : AppRouteEmip6wvn.home;
    if (mounted) {
      AppNavigationEmip6wvn.replaceNamed(destination);
    }
  }

  Widget _buildBodyemip6wvn() {
    ///Here you need to change to Image i think
    /// Usually is smth like 
    // Image.assets(Assets.images.splash.path, scale: 2);
    return Center(child: FlutterLogo());
  }

  @override
  void initState() {
    super.initState();
    unawaited(_launchNextScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsEmip6wvn.white,

      body: _buildBodyemip6wvn(),
    );
  }
}
```

---

## 3. Then I change OnboardingEntry
(name can be different depends on generation)

```dart
enum FirstVisitVzq2xgotEntry {
  first,
  second;// Here you can add more entries if you need 

  String get imagePath => switch (this) {
    FirstVisitVzq2xgotEntry.first => 'Assets.images.png.onboarding1.path',
    FirstVisitVzq2xgotEntry.second => 'Assets.images.png.onboarding2.path',
  };
  /// Titles for Onboarding slides 
  /// or you also can pass here the path to titles images
  String get title => switch (this) {
    FirstVisitVzq2xgotEntry.first => '',
    FirstVisitVzq2xgotEntry.second => '',
  };
  /// Subtitles/Content for Onboarding slides 
  /// or you also can pass here the path to titles images
  String get content => switch (this) {
    FirstVisitVzq2xgotEntry.first => '',
    FirstVisitVzq2xgotEntry.second => '',
  };
  /// Same for Onboarding slides button text
  /// or:
  // String get buttonText => switch (this) {
  //   FirstVisitVzq2xgotEntry.values.last => 'Start',
  //   _ => 'Next',
  // };
  
  
  String get buttonText => switch (this) {
    FirstVisitVzq2xgotEntry.first => 'Next',
    FirstVisitVzq2xgotEntry.second => 'Start',
  };
}

```

---

## 4. HomeScreen
(name can be different depends on generation)

```dart
/// Here already created NavigatorKey for menu screen and also MenuScreen(but commented)
final menuKeyVzq2xgot = GlobalKey<ScaffoldState>();

class HubVzq2xgotScreen extends StatefulWidget {
  const HubVzq2xgotScreen({super.key});

  @override
  State<HubVzq2xgotScreen> createState() => _HubVzq2xgotScreenState();
}

class _HubVzq2xgotScreenState extends State<HubVzq2xgotScreen> {
  /// On user tap on loan button
  void _onLoan() {
    AppNavigationVzq2xgot.goNamed(AppRouteVzq2xgot.form);
  }
  // Fake function
  bool phantomBufferAlloc() {
    return DateTime.now().second % 2 == 0;
  }

  /// Vzq2xgotVzq2xgotVzq2xgot

  @override
  void initState() {
    super.initState();
    /// Request Permission
    unawaited(OneSignal.Notifications.requestPermission(false));
  }

  @override
  Widget build(BuildContext context) {
    phantomBufferAlloc();

    return Scaffold(
      key: menuKeyVzq2xgot,
      // endDrawer: MenuScreen(),
      /// Make your UI
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [MainButtonVzq2xgot(label: 'GET', onTap: _onLoan)],
      ),
    );
  }
}
```

---

## 5. FormScreen
(name can be different depends on generation)

### 5.0 Link Preloader

```dart
void main() {
  ...
  await EmbeddedFormBrowserkgzvibkoDependencies.preload(
  linkSettings: LinkSettings(
  /// Webview link
  baseLink: AppConstantsKgzvibko.formUrl,
  /// Here you need to pass form link parameters
  /// Before starting the page load, 
  /// all parameters will be obtained
  linkParams: [
  LinkParamkgzvibko(
  /// Parameter name
  name: AppConstantsKgzvibko.udIdAliace,
  /// Function for getting this parameter
  getValue: () async => FlutterUdid.udid,
  ),

  // LinkParamkgzvibko(
  //   name: AppConstantsKgzvibko.fiIdAliace,
  //   getValue: () => FirebaseAnalytics.instance.appInstanceId,
  // ),
  if (Platform.isAndroid) ...[
  LinkParamkgzvibko(
  name: AppConstantsKgzvibko.ref,
  getValue: () async => AndroidRefDatakgzvibko.details,
  ),
  ],
  ],
  ),
  );
  ...
}
```

### 5.1 NoConnectionScreen

```dart
class OnlineFormVhq1unl5NoConnectionScreen extends StatelessWidget {
  const OnlineFormVhq1unl5NoConnectionScreen({super.key});

  void _onButtonTap(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    /// Base screen if your Figma design contain it
    return ScreenBaseVhq1unl5(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          /// Usually here are some image and title
          /// Image.assets(Assets.images.noConnection.path, scale:2),
          /// Image.assets(Assets.images.noConnectionText.path, scale:2),

          /// Dummy button, usually do nothing 
          MainButtonVhq1unl5(
            label: 'Retry',
            onTap: () => _onButtonTap(context),
          ),
        ],
      ),
    );
  }
}
```

---

### 5.2 FormScreen Placeholder

```dart
class OnlineFormVhq1unl5Screen extends StatelessWidget {
  const OnlineFormVhq1unl5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConnectionGuardvhq1unl5Builder(
      builder: (isConnected) {
        return NetFormUivhq1unl5Screen.noConnectionPlaceholder(
          isConnected: isConnected,
          noConnectionPlaceholder: OnlineFormVhq1unl5NoConnectionScreen(),
          webViewScreenSetting: NetFormUivhq1unl5ScreenSetting(
            backgroundColor: Colors.blue,
            /// If you need more customization - use .widget constructor
            // headerSettings: HeaderSettingsvhq1unl5.widget(
            //   widget: Stack(
            //     children: [
            //       CustomBackButtonVhq1unl5(),
            //       Center(child: Text('WebView title')),
            //     ],
            //   ),
            // ),
            /// Customization for header (Scaffold appBar)
            headerSettings: HeaderSettingsvhq1unl5(
              textStyle: AppStylesVhq1unl5.title,
              height: 100,
              backgroundColor: AppColorsVhq1unl5.white,
              title: 'WebView title',
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              backButton: CustomBackButtonVhq1unl5(),
            ),
            loadingIndicatorSettings: ProgressIndicatorSettingsvhq1unl5(
              /// Shows page loading progress 
              // behaviour: ProgressIndicatorBehaviourvhq1unl5.alwaysSpin,
              /// Spins while page are loading
              behaviour: ProgressIndicatorBehaviourvhq1unl5.percent,
              /// Indicator value color
              foregroundColor: Colors.yellow,
              /// Indicator background color
              backgroundColor: Colors.purple,
            ),
          ),
        );
      },
    );
  }
}
```

---

### 5.3 FormScreen Alert

```dart
class OnlineFormVhq1unl5Screen extends StatelessWidget {
  const OnlineFormVhq1unl5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConnectionGuardvhq1unl5Builder(
      builder: (isConnected) {
        return NetFormUivhq1unl5Screen.noConnectionAlert(
          isConnected: isConnected,
          alertSettings: NetFormUivhq1unl5AlertSettings(
            /// Your alert widget
            alertDialog: OnlineFormVhq1unl5NoConnectionAlert(),
            /// Is it possible to close the alert by pressing outside?
            dismissible: true,
            /// Background blur strength
            blurStrength: 8,
            /// Background color
            alertBarrierColor: Colors.grey,
            /// If set to True - firstly FormScreen will be closed (.pop method)
            /// and then alert will be shown in HomeScreen
            /// 
            /// If set to False - alert will be shown on FormScreen
            alertAfterPop: false,
          ),
          webViewScreenSetting: NetFormUivhq1unl5ScreenSetting(
            backgroundColor: Colors.blue,
            /// If you need more customization - use .widget constructor
            // headerSettings: HeaderSettingsvhq1unl5.widget(
            //   widget: Stack(
            //     children: [
            //       CustomBackButtonVhq1unl5(),
            //       Center(child: Text('WebView title')),
            //     ],
            //   ),
            // ),
            /// Customization for header (Scaffold appBar)
            headerSettings: HeaderSettingsvhq1unl5(
              textStyle: AppStylesVhq1unl5.title,
              height: 100,
              backgroundColor: AppColorsVhq1unl5.white,
              title: 'WebView title',
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              backButton: CustomBackButtonVhq1unl5(),
            ),
            loadingIndicatorSettings: ProgressIndicatorSettingsvhq1unl5(
              /// Shows page loading progress 
              // behaviour: ProgressIndicatorBehaviourvhq1unl5.alwaysSpin,
              /// Spins while page are loading
              behaviour: ProgressIndicatorBehaviourvhq1unl5.percent,
              /// Indicator value color
              foregroundColor: Colors.yellow,
              /// Indicator background color
              backgroundColor: Colors.purple,
            ),
          ),
        );
      },
    );
  }
}
```

--- 

## 6. Services Screen

### 6.1 Obtain html text in Terms / Privacy section

You need to transform GDocument to Html text using build-in AI

I use this prompt:
```
transform text from this document to html code. And for titles use <strong> please
```

> NOTE! Replaced with python script
>> Possibly might be replaced with .md viewer

then paste into project variables:

```dart
final UserAgreementVhq1unl5TextUSVhq1unl5 = '''
<p>Terms of Use<p/>
''';
```

```dart
final ConfidentialityVhq1unl5TextUSVhq1unl5 = '''
<p>Privacy Policy<p/>
''';
```

---

### 6.2 Setup text styles

```dart
final htmlStylesVhq1unl5 = {
  'strong': Style.fromTextStyle(AppStylesVhq1unl5.title),
  'p': Style.fromTextStyle(AppStylesVhq1unl5.title),
  'a': Style.fromTextStyle(AppStylesVhq1unl5.title),
  'ul': Style.fromTextStyle(AppStylesVhq1unl5.title),
  'li': Style.fromTextStyle(AppStylesVhq1unl5.title),
};
```

---

### 6.3 Services Screen UI

```dart
class SupportVhq1unl5ScreenBase extends StatelessWidget {
  const SupportVhq1unl5ScreenBase({
    required this.title,
    required this.text,
    super.key,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    /// Base screen if your Figma design contain it
    return ScreenBaseVhq1unl5(
      title: title,
      /// Widget for display html text with app font styles
      child: Html(data: text, style: htmlStylesVhq1unl5),
    );
  }
}
```

---

### 6.4 As result

Policy:
```dart
class ConfidentialityVhq1unl5Screen extends StatelessWidget {
  const ConfidentialityVhq1unl5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildScreenvhq1unl5();
  }

  Widget _buildScreenvhq1unl5() {
    return SupportVhq1unl5ScreenBase(
      title: 'Privacy Policy',
      text: ConfidentialityVhq1unl5TextUSVhq1unl5,
    );
  }
}
```

Terms:

```dart
class UserAgreementVhq1unl5Screen extends StatelessWidget {
  const UserAgreementVhq1unl5Screen({super.key});

  Widget _getvhq1unl5Terms() {
    return SupportVhq1unl5ScreenBase(
      title: 'Terms of Use',
      text: UserAgreementVhq1unl5TextUSVhq1unl5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getvhq1unl5Terms();
  }
}
```


# Additional Modules:

---

## 1. AndroidRef module

### 1.1 Initialization:
Already initialized in main.dart:

```dart
if (Platform.isAndroid) {
await InstallOriginDataj0m1alkxw.init();
}
```

---

### 1.2 Usage:
Already added to FormScreen as link parameter:
> Moved to main.dart - look bottom
```dart
class WebContentJ0m1alkxwScreen extends StatelessWidget {
  const WebContentJ0m1alkxwScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConnectivityTestj0m1alkxwBuilder(
      builder: (isConnected) {
        return EmbeddedFormBrowserj0m1alkxwScreen.noConnectionPlaceholder(
        ///...
          webViewScreenSetting: EmbeddedFormBrowserj0m1alkxwScreenSetting(
            // UI settings here
            ///...
            linkParams: [
              /// Here
              if(Platform.isAndroid)
                LinkParamj0m1alkxw(
                  name: AppConstantsJ0m1alkxw.ref, /// Parameter name from constant
                  getValue: () async => InstallOriginDataj0m1alkxw.details, /// Value
                ),
            ],
          ),
        );
      },
    );
  }
}
```


Link preload (moved from FormScreen to main.dart):
```dart
await EmbeddedFormBrowserkgzvibkoDependencies.preload(
  linkSettings: LinkSettings(
    baseLink: AppConstantsKgzvibko.formUrl,
    linkParams: [
      ///...
      /// Here
      if(Platform.isAndroid)
        LinkParamj0m1alkxw(
          name: AppConstantsJ0m1alkxw.ref, /// Parameter name from constant
          getValue: () async => InstallOriginDataj0m1alkxw.details, /// Value
        ),
    ],
  ),
);
```


---

## 2. SmallScreenAdapter

### 2.1 Initialization:
Already initialized in MainApp:

```dart
class MainAppHco5enj18r extends StatelessWidget {
  const MainAppHco5enj18r({super.key});
  @override
  Widget build(BuildContext context) {
    /// Here
    SmallUiAdjusterhco5enj18r.init(context);

    return MaterialApp(
      initialRoute: AppRouteHco5enj18r.splash.path,
      routes: AppNavigationHco5enj18r.routes,
      navigatorKey: AppNavigationHco5enj18r.navKey,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
    );
  }
}
```

---

### 2.2 Usage:
Just use controller
```dart
///...
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        Image.asset(
          Assets.images.png.tsukuyomi,
          /// You can handle small screen (usually moders use small ipad)
          scale: SmallUiAdjusterhco5enj18rController.to.isIpad ? 3 : 2,
        ),
        MainButtonHco5enj18r(label: 'GET', onTap: _onLoan),
      ],
    ),
  );
}

///...
```


## 3. FacebookDeviceIDs

### 3.1 Pre-requirements:

#### 3.1.1 Preparing to creation an app in Meta

- You need to create android signing key ([Flutter docs](https://docs.flutter.dev/deployment/android#create-an-upload-keystore))

- Then you need to obtain signing key hash (replace with your key name (path) ):
- Run in project local terminal:
```shell
keytool -exportcert \
  -alias upload \ 
  -keystore android/app/_keyName_.jks \      
| openssl sha1 -binary | openssl base64

```

- Give this **hash** and **android build id** to the person who will create the application in Meta

---
#### 3.1.2 AndroidManifest.xml

- To android/app/src/main/AndroidManifest.xml add 2 lines:
```manifest
<meta-data android:name="com.facebook.sdk.ApplicationId" android:value="@string/facebook_app_id"/>
<meta-data android:name="com.facebook.sdk.ClientToken" android:value="@string/facebook_client_token"/>
```

Example:
```xml
        ...
<meta-data
        android:name="flutterEmbedding"
        android:value="2" />

<meta-data android:name="com.facebook.sdk.ApplicationId" android:value="@string/facebook_app_id"/>
<meta-data android:name="com.facebook.sdk.ClientToken" android:value="@string/facebook_client_token"/>

        </application>
```

---

#### 3.1.3 strings.xml
> Here you need to ids from Meta

- Create android/app/src/main/res/values/strings.xml if not exist and add 3 lines:

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    ...
    <string name="facebook_app_id">_YOUR_FACEBOOK_APP_ID:_</string>
    <string name="facebook_client_token">_YOUR_CLIENT_TOKEN_</string>
    <string name="fb_login_protocol_scheme">_YOUR_FACEBOOK_APP_ID</string>
    ...
</resources>
```

---
### 3.2 Initialization:
On app starts:
```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await WakelockPlus.enable();

  if (Platform.isAndroid) {
    await AndroidRefDatahco5enj18r.init();
    /// Here
    await FacebookInstallIdshco5enj18r.init();
  }
  ...
}
```

---

### 3.3 Usage:
Already added to FormScreen as link parameter:
> Moved to main.dart - look bottom

```dart
class ExternalFormHco5enj18rScreen extends StatelessWidget {
  const ExternalFormHco5enj18rScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///_
    return NetworkValidatorhco5enj18rBuilder(
      builder: (isConnected) {
        return WebviewDataEntryhco5enj18rScreen.noConnectionPlaceholder(
            ///...
            webViewScreenSetting: WebviewDataEntryhco5enj18rScreenSetting(
            linkParams: [
                ///...
                if (Platform.isAndroid) ...[
                  LinkParamhco5enj18r(
                    name: AppConstantsHco5enj18r.ref,
                    getValue: () async => AndroidRefDatahco5enj18r.details,
                  ),
                  /// facebook id
                  LinkParamhco5enj18r(
                    name: 'FCBID',
                    getValue:
                      () => FacebookInstallIdshco5enj18r.getFacebookAnonymousId,
                  ),
                  /// add id
                  LinkParamhco5enj18r(
                    name: 'ADID',
                    getValue: () => FacebookInstallIdshco5enj18r.getAdvertisingId,
                  ),
              ],
            ],
          ),
        );
      },
    );
  }
}
```



Link preload (moved from FormScreen to main.dart):
```dart
///...
await EmbeddedFormBrowserkgzvibkoDependencies.preload(
  linkSettings: LinkSettings(
    baseLink: AppConstantsKgzvibko.formUrl,
      linkParams: [
        ///...
        /// Here
        if(Platform.isAndroid) ...[
          /// facebook id
          LinkParamhco5enj18r(
            name: 'FCBID',
            getValue:
              () => FacebookInstallIdshco5enj18r.getFacebookAnonymousId,
            ),
          /// add id
          LinkParamhco5enj18r(
            name: 'ADID',
            getValue: () => FacebookInstallIdshco5enj18r.getAdvertisingId,
          ), 
        ]
    ],
  ),
);
///...
```


---