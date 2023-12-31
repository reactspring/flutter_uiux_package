// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:flutter_uiux_package/flutter_uiux_package.dart';

extension AgnesThemeData on ThemeData {
  static ThemeData light({
    final AgnesSchemeColor? colors,
    final AgnesScheme? scheme,
    final ColorScheme? colorScheme,
    final int usedColors = 4,
    @Deprecated('Deprecated in v4.2.0, use surfaceMode and blendLevel instead.')
        final AgnesSurface surfaceStyle = AgnesSurface.material,
    final AgnesSurfaceMode? surfaceMode,
    final int blendLevel = 0,
    final AgnesAppBarStyle appBarStyle = AgnesAppBarStyle.primary,
    final double appBarOpacity = 1,
    final double appBarElevation = 0,
    final double? bottomAppBarElevation,
    final AgnesTabBarStyle tabBarStyle = AgnesTabBarStyle.forAppBar,
    final Color? primary,
    final Color? primaryContainer,
    final Color? secondary,
    final Color? secondaryContainer,
    final Color? error,
    final Color? surface,
    final Color? background,
    final Color? scaffoldBackground,
    final Color? dialogBackground,
    final Color? appBarBackground,
    final Color? onPrimary,
    final Color? onSecondary,
    final Color? onSurface,
    final Color? onBackground,
    final Color? onError,
    final bool lightIsWhite = false,
    final bool swapColors = false,
    final bool tooltipsMatchBackground = false,
    final bool transparentStatusBar = true,
    final VisualDensity? visualDensity,
    final TextTheme? textTheme,
    final TextTheme? primaryTextTheme,
    final String? fontFamily,
    final TargetPlatform? platform,
    final Typography? typography,
    final bool applyElevationOverlayColor = true,
    final bool useSubThemes = false,
    final AgnesSubThemesData? subThemesData,
  }) {
    return AgnesColorScheme.light(
      colors: colors,
      scheme: scheme,
      colorScheme: colorScheme,
      usedColors: usedColors,
      surfaceStyle: surfaceStyle,
      surfaceMode: surfaceMode,
      blendLevel: blendLevel,
      appBarStyle: appBarStyle,
      appBarOpacity: appBarOpacity,
      appBarElevation: appBarElevation,
      bottomAppBarElevation: bottomAppBarElevation,
      tabBarStyle: tabBarStyle,
      primary: primary,
      primaryContainer: primaryContainer,
      secondary: secondary,
      secondaryContainer: secondaryContainer,
      error: error,
      surface: surface,
      background: background,
      scaffoldBackground: scaffoldBackground,
      dialogBackground: dialogBackground,
      appBarBackground: appBarBackground,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
      lightIsWhite: lightIsWhite,
      swapColors: swapColors,
      tooltipsMatchBackground: tooltipsMatchBackground,
      transparentStatusBar: transparentStatusBar,
      visualDensity: visualDensity,
      textTheme: textTheme,
      primaryTextTheme: primaryTextTheme,
      fontFamily: fontFamily,
      platform: platform,
      typography: typography,
      applyElevationOverlayColor: applyElevationOverlayColor,
      useSubThemes: useSubThemes,
      subThemesData: subThemesData,
    ).toTheme;
  }

  static ThemeData dark({
    final AgnesSchemeColor? colors,
    final AgnesScheme? scheme,
    final ColorScheme? colorScheme,
    final int usedColors = 4,
    @Deprecated('Deprecated in v4.2.0, use surfaceMode and blendLevel instead.')
        final AgnesSurface surfaceStyle = AgnesSurface.material,
    final AgnesSurfaceMode? surfaceMode,
    final int blendLevel = 0,
    final AgnesAppBarStyle appBarStyle = AgnesAppBarStyle.material,
    final double appBarOpacity = 1,
    final double appBarElevation = 0,
    final double? bottomAppBarElevation,
    final AgnesTabBarStyle tabBarStyle = AgnesTabBarStyle.forAppBar,
    final Color? primary,
    final Color? primaryContainer,
    final Color? secondary,
    final Color? secondaryContainer,
    final Color? error,
    final Color? surface,
    final Color? background,
    final Color? scaffoldBackground,
    final Color? dialogBackground,
    final Color? appBarBackground,
    final Color? onPrimary,
    final Color? onSecondary,
    final Color? onSurface,
    final Color? onBackground,
    final Color? onError,
    final bool darkIsTrueBlack = false,
    final bool swapColors = false,
    final bool tooltipsMatchBackground = false,
    final bool transparentStatusBar = true,
    final VisualDensity? visualDensity,
    final TextTheme? textTheme,
    final TextTheme? primaryTextTheme,
    final String? fontFamily,
    final TargetPlatform? platform,
    final Typography? typography,
    final bool applyElevationOverlayColor = true,
    final bool useSubThemes = false,
    final AgnesSubThemesData? subThemesData,
  }) {
    return AgnesColorScheme.dark(
      colorScheme: colorScheme,
      colors: colors,
      scheme: scheme,
      usedColors: usedColors,
      surfaceStyle: surfaceStyle,
      surfaceMode: surfaceMode,
      blendLevel: blendLevel,
      appBarStyle: appBarStyle,
      appBarOpacity: appBarOpacity,
      appBarElevation: appBarElevation,
      bottomAppBarElevation: bottomAppBarElevation,
      tabBarStyle: tabBarStyle,
      primary: primary,
      primaryContainer: primaryContainer,
      secondary: secondary,
      secondaryContainer: secondaryContainer,
      error: error,
      surface: surface,
      background: background,
      scaffoldBackground: scaffoldBackground,
      dialogBackground: dialogBackground,
      appBarBackground: appBarBackground,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
      darkIsTrueBlack: darkIsTrueBlack,
      swapColors: swapColors,
      tooltipsMatchBackground: tooltipsMatchBackground,
      transparentStatusBar: transparentStatusBar,
      visualDensity: visualDensity,
      textTheme: textTheme,
      primaryTextTheme: primaryTextTheme,
      fontFamily: fontFamily,
      platform: platform,
      typography: typography,
      applyElevationOverlayColor: applyElevationOverlayColor,
      useSubThemes: useSubThemes,
      subThemesData: subThemesData,
    ).toTheme;
  }
}
