// ignore_for_file: deprecated_member_use

import 'package:flutter_uiux_package/flutter_uiux_package.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UiUxData {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  UiUxData._();

  // Info about the package.
  // When we build new public versions, I just make sure to
  // update this info before I trigger GitHub actions CI/CD that builds them.
  static const String appName = 'AGNES';
  static const String version = '1.0.0';
  static const String packageVersion = 'AGNES UIUX package $version';
  static const String packageUrl = '';
  static const String flutterVersion = 'stable v2.8.1';
  static const String copyright = '© 2020, 2021';
  static const String author = 'Mike Rydstrom';
  static const String license = 'BSD 3-Clause License';
  static const String icon = 'assets/images/app_icon.png';
  static const double maxBodyWidth = 1000;
  static const double desktopBreakpoint = 1150;
  static const double phoneBreakpoint = 600;
  static const double edgeInsetsPhone = 8;
  static const double edgeInsetsTablet = 14;
  static const double edgeInsetsDesktop = 18;
  static const double edgeInsetsBigDesktop = 24;
  static const double popupMenuOpacity = 0.95;

  static double responsiveInsets(double width) {
    if (width < phoneBreakpoint) return edgeInsetsPhone;
    if (width < desktopBreakpoint) return edgeInsetsTablet;
    return edgeInsetsDesktop;
  }

  // 네비게이터 키
  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  static String title(BuildContext context) =>
      (context as Element).findAncestorWidgetOfExactType<MaterialApp>()!.title;
  static String? get font => GoogleFonts.notoSans().fontFamily;
  static VisualDensity get visualDensity =>
      AgnesColorScheme.comfortablePlatformDensity;
  static const TextTheme textTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 57, // Same as M3, defaults to 96 in Material2018 Typography.
    ),
    headline2: TextStyle(
      fontSize: 45, // Same as M3, defaults to 60 in Material2018 Typography.
    ),
    headline3: TextStyle(
      fontSize: 36, // Same as M3, defaults to 48 in Material2018 Typography.
    ),
    headline4: TextStyle(
      fontSize: 28, // Same as M3, defaults to 34 in Material2018 Typography.
    ),
    // I chose this, I later saw it happened to match new M3 style too - cool!
    overline: TextStyle(
      fontSize: 11, // Defaults to 10 in Material2018 Typography.
      letterSpacing: 0.5, // Defaults to 1.5 in Material2018 Typography.
    ),
  );
}
