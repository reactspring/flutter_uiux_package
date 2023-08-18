// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_uiux_package/flutter_uiux_package.dart';

enum AgnesSurface {
  material,
  light,
  medium,
  strong,
  heavy,
  custom,
}

enum AgnesSurfaceMode {
  level,
  highBackgroundLowScaffold,
  highSurfaceLowScaffold,
  highScaffoldLowSurface,
  highScaffoldLevelSurface,
  levelSurfacesLowScaffold,
  highScaffoldLowSurfaces,
  levelSurfacesLowScaffoldContainerDialog,
  highScaffoldLowSurfacesContainerDialog,
  custom,
}

enum AgnesAppBarStyle {
  primary,
  material,
  surface,
  background,
  custom,
}

enum AgnesSystemNavBarStyle {
  system,
  surface,
  background,
  scaffoldBackground,
  transparent,
}

enum AgnesTabBarStyle {
  forAppBar,
  forBackground,
  flutterDefault,
  universal,
}

enum AgnesScheme {
  material,
  materialHc,
  aquaBlue,
  brandBlue,
  custom,
  agnes,
}

@immutable
class AgnesColorScheme with Diagnosticable {
  const AgnesColorScheme({
    this.colorScheme,
    this.brightness,
    this.primary,
    this.primaryContainer,
    this.secondary,
    this.secondaryContainer,
    this.error,
    this.surface,
    this.background,
    this.scaffoldBackground,
    this.dialogBackground,
    this.appBarBackground,
    this.onPrimary,
    this.onSecondary,
    this.onSurface,
    this.onBackground,
    this.onError,
    this.tabBarStyle = AgnesTabBarStyle.forAppBar,
    this.appBarElevation = 0,
    this.bottomAppBarElevation = 0,
    this.tooltipsMatchBackground = false,
    this.transparentStatusBar = true,
    this.visualDensity,
    this.textTheme,
    this.primaryTextTheme,
    this.fontFamily,
    this.platform,
    this.typography,
    this.applyElevationOverlayColor = true,
    this.useSubThemes = false,
    this.subThemesData,
  })  : assert(appBarElevation >= 0.0, 'AppBar elevation must be >= 0.'),
        assert(bottomAppBarElevation >= 0.0,
            'Bottom AppBar elevation must be >= 0.');

  final ColorScheme? colorScheme;

  final Brightness? brightness;

  final Color? primary;

  final Color? primaryContainer;

  final Color? secondary;

  final Color? secondaryContainer;

  final Color? error;

  final Color? surface;

  final Color? background;

  final Color? scaffoldBackground;

  final Color? dialogBackground;

  final Color? appBarBackground;

  final Color? onPrimary;

  final Color? onSecondary;

  final Color? onSurface;

  final Color? onBackground;

  final Color? onError;

  final AgnesTabBarStyle tabBarStyle;

  final double appBarElevation;

  final double bottomAppBarElevation;

  final bool tooltipsMatchBackground;

  final bool transparentStatusBar;

  final VisualDensity? visualDensity;

  final TextTheme? textTheme;

  final TextTheme? primaryTextTheme;

  final String? fontFamily;

  final TargetPlatform? platform;

  final Typography? typography;

  final bool applyElevationOverlayColor;

  final bool useSubThemes;

  final AgnesSubThemesData? subThemesData;

  factory AgnesColorScheme.light({
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
    assert(usedColors >= 1 && usedColors <= 4, 'usedColors must be 1 to 4');
    assert(appBarOpacity >= 0 && appBarOpacity <= 1,
        'appBarOpacity must be 0 to 1');
    assert(
      blendLevel >= 0 && blendLevel <= 40,
      'Only blend levels from 0 to 40 are allowed. Very high alpha values may '
      'not produce results that are visually very appealing or useful.',
    );
    assert(appBarElevation >= 0.0, 'AppBar elevation must be >= 0.');
    assert(bottomAppBarElevation == null || bottomAppBarElevation >= 0.0,
        'Bottom AppBar elevation must be null or must be >= 0.');

    final double _bottomAppBarElevation =
        bottomAppBarElevation ?? appBarElevation;

    final AgnesScheme _scheme = scheme ?? AgnesScheme.material;

    final AgnesSchemeColor _colors =
        colors ?? AgnesColors.schemes[_scheme]!.light;

    final AgnesSchemeColor withPassedColors = _colors.copyWith(
      primary: primary ?? colorScheme?.primary,
      primaryContainer: primaryContainer ?? colorScheme?.primaryContainer,
      secondary: secondary ?? colorScheme?.secondary,
      secondaryContainer: secondaryContainer ?? colorScheme?.secondaryContainer,
      error: error ?? colorScheme?.error,
    );

    final AgnesSchemeColor effectiveColors = AgnesSchemeColor.effective(
        withPassedColors, usedColors,
        swapColors: swapColors);

    final AgnesSchemeSurfaceColors surfaceSchemeColors = surfaceMode != null
        ? AgnesSchemeSurfaceColors.blend(
            brightness: Brightness.light,
            surfaceMode: surfaceMode,
            blendLevel: blendLevel,
            schemeColors: effectiveColors,
          )
        : AgnesSchemeSurfaceColors.from(
            brightness: Brightness.light,
            surfaceStyle: surfaceStyle,
            primary: effectiveColors.primary,
          );

    final AgnesSubThemesData subTheme =
        subThemesData ?? const AgnesSubThemesData();

    final _AlphaValues _blend =
        surfaceMode != null && useSubThemes && subTheme.blendOnColors
            ? _AlphaValues.getAlphas(surfaceMode, blendLevel, Brightness.light)
            : const _AlphaValues();

    final bool _overrideScheme = blendLevel > 0 && surfaceMode != null;
    final Color _inputSurface = surface ??
        (_overrideScheme
            ? surfaceSchemeColors.surface
            : colorScheme?.surface) ??
        surfaceSchemeColors.surface;
    final Color _inputBackground = background ??
        (_overrideScheme
            ? surfaceSchemeColors.background
            : colorScheme?.background) ??
        surfaceSchemeColors.background;

    const int divN = 3;
    final AgnesSchemeOnColors onColors = AgnesSchemeOnColors.from(
      primary: effectiveColors.primary,
      secondary: effectiveColors.secondary,
      surface: _inputSurface,
      background: _inputBackground,
      error: effectiveColors.error ?? AgnesColors.materialLightError,
      onPrimary: onPrimary ?? colorScheme?.onPrimary,
      onSecondary: onSecondary ?? colorScheme?.onSecondary,
      onSurface: onSurface ?? colorScheme?.onSurface,
      onBackground: onBackground ?? colorScheme?.onBackground,
      onError: onError ?? colorScheme?.onError,
      primaryAlpha: _blend.primaryAlpha * 2 ~/ divN,
      secondaryAlpha: _blend.secondaryAlpha * 2 ~/ divN,
      surfaceAlpha: _blend.surfaceAlpha * 2 ~/ divN,
      backgroundAlpha: _blend.backgroundAlpha * 2 ~/ divN,
      errorAlpha: _blend.errorAlpha * 2 ~/ divN,
    );

    final Color effectiveSurfaceColor =
        lightIsWhite ? _inputSurface.lighten(8) : _inputSurface;

    final Color effectiveBackgroundColor =
        lightIsWhite ? _inputBackground.lighten(8) : _inputBackground;

    final Color effectiveDialogBackground = lightIsWhite
        ? dialogBackground?.lighten(8) ??
            surfaceSchemeColors.dialogBackground.lighten(8)
        : dialogBackground ?? surfaceSchemeColors.dialogBackground;

    Color? effectiveAppBarColor;
    switch (appBarStyle) {
      case AgnesAppBarStyle.primary:
        effectiveAppBarColor = effectiveColors.primary;
        break;
      case AgnesAppBarStyle.material:
        effectiveAppBarColor = AgnesColors.materialLightSurface;
        break;
      case AgnesAppBarStyle.background:
        effectiveAppBarColor = effectiveBackgroundColor;
        break;
      case AgnesAppBarStyle.surface:
        effectiveAppBarColor = effectiveSurfaceColor;
        break;
      case AgnesAppBarStyle.custom:
        effectiveAppBarColor =
            effectiveColors.appBarColor ?? effectiveColors.primary;
        break;
    }
    effectiveAppBarColor =
        appBarBackground ?? effectiveAppBarColor.withOpacity(appBarOpacity);

    return AgnesColorScheme(
      colorScheme: colorScheme,
      brightness: Brightness.light,
      primary: effectiveColors.primary,
      primaryContainer: effectiveColors.primaryContainer,
      secondary: effectiveColors.secondary,
      secondaryContainer: effectiveColors.secondaryContainer,
      surface: effectiveSurfaceColor,
      background: effectiveBackgroundColor,
      scaffoldBackground: scaffoldBackground ??
          (lightIsWhite
              ? Colors.white
              : surfaceSchemeColors.scaffoldBackground),
      dialogBackground: effectiveDialogBackground,
      appBarBackground: effectiveAppBarColor,
      error: effectiveColors.error ?? AgnesColors.materialLightError,
      onPrimary: onColors.onPrimary,
      onSecondary: onColors.onSecondary,
      onSurface: onColors.onSurface,
      onBackground: onColors.onBackground,
      onError: onColors.onError,
      tabBarStyle: tabBarStyle,
      appBarElevation: appBarElevation,
      bottomAppBarElevation: _bottomAppBarElevation,
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
    );
  }

  factory AgnesColorScheme.dark({
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
    assert(usedColors >= 1 && usedColors <= 4, 'usedColors must be 1 to 4.');
    assert(appBarOpacity >= 0 && appBarOpacity <= 1,
        'appBarOpacity must be 0 to 1');
    assert(
      blendLevel >= 0 && blendLevel <= 40,
      'Only blend levels from 0 to 40 are allowed. Very high alpha values may '
      'not produce results that are visually very appealing or useful.',
    );
    assert(appBarElevation >= 0.0, 'AppBar elevation must be >= 0.');
    assert(bottomAppBarElevation == null || bottomAppBarElevation >= 0.0,
        'Bottom AppBar elevation must be null or must be >= 0.');

    final double effectiveBottomAppBarElevation =
        bottomAppBarElevation ?? appBarElevation;

    final AgnesScheme _scheme = scheme ?? AgnesScheme.material;

    final AgnesSchemeColor _colors =
        colors ?? AgnesColors.schemes[_scheme]!.dark;

    final AgnesSchemeColor withPassedColors = _colors.copyWith(
      primary: primary ?? colorScheme?.primary,
      primaryContainer: primaryContainer ?? colorScheme?.primaryContainer,
      secondary: secondary ?? colorScheme?.secondary,
      secondaryContainer: secondaryContainer ?? colorScheme?.secondaryContainer,
      error: error ?? colorScheme?.error,
    );

    final AgnesSchemeColor effectiveColors = AgnesSchemeColor.effective(
      withPassedColors,
      usedColors,
      swapColors: swapColors,
    );

    final AgnesSchemeSurfaceColors surfaceSchemeColors = surfaceMode != null
        ? AgnesSchemeSurfaceColors.blend(
            brightness: Brightness.dark,
            surfaceMode: surfaceMode,
            blendLevel: blendLevel,
            schemeColors: effectiveColors,
          )
        : AgnesSchemeSurfaceColors.from(
            brightness: Brightness.dark,
            surfaceStyle: surfaceStyle,
            primary: effectiveColors.primary,
          );

    final AgnesSubThemesData subTheme =
        subThemesData ?? const AgnesSubThemesData();

    final _AlphaValues _blend =
        surfaceMode != null && useSubThemes && subTheme.blendOnColors
            ? _AlphaValues.getAlphas(surfaceMode, blendLevel, Brightness.dark)
            : const _AlphaValues();

    final bool _overrideScheme = blendLevel > 0 && surfaceMode != null;
    final Color _inputSurface = surface ??
        (_overrideScheme
            ? surfaceSchemeColors.surface
            : colorScheme?.surface) ??
        surfaceSchemeColors.surface;
    final Color _inputBackground = background ??
        (_overrideScheme
            ? surfaceSchemeColors.background
            : colorScheme?.background) ??
        surfaceSchemeColors.background;

    const int divN = 3;
    final AgnesSchemeOnColors onColors = AgnesSchemeOnColors.from(
      primary: effectiveColors.primary,
      secondary: effectiveColors.secondary,
      surface: _inputSurface,
      background: _inputBackground,
      error: effectiveColors.error ?? AgnesColors.materialDarkError,
      onPrimary: onPrimary ?? colorScheme?.onPrimary,
      onSecondary: onSecondary ?? colorScheme?.onSecondary,
      onSurface: onSurface ?? colorScheme?.onSurface,
      onBackground: onBackground ?? colorScheme?.onBackground,
      onError: onError ?? colorScheme?.onError,
      primaryAlpha: _blend.primaryAlpha * 2 ~/ divN,
      secondaryAlpha: _blend.secondaryAlpha * 2 ~/ divN,
      surfaceAlpha: _blend.surfaceAlpha * 2 ~/ divN,
      backgroundAlpha: _blend.backgroundAlpha * 2 ~/ divN,
      errorAlpha: _blend.errorAlpha * 2 ~/ divN,
    );

    final Color effectiveSurfaceColor =
        darkIsTrueBlack ? _inputSurface.darken(8) : _inputSurface;

    final Color effectiveBackgroundColor =
        darkIsTrueBlack ? _inputBackground.darken(8) : _inputBackground;

    final Color effectiveDialogBackground = darkIsTrueBlack
        ? dialogBackground?.darken(8) ??
            surfaceSchemeColors.dialogBackground.darken(8)
        : dialogBackground ?? surfaceSchemeColors.dialogBackground;

    Color? effectiveAppBarColor;
    switch (appBarStyle) {
      case AgnesAppBarStyle.primary:
        effectiveAppBarColor = effectiveColors.primary;
        break;
      case AgnesAppBarStyle.material:
        effectiveAppBarColor =
            darkIsTrueBlack ? Colors.black : AgnesColors.materialDarkSurface;
        break;
      case AgnesAppBarStyle.background:
        effectiveAppBarColor = effectiveBackgroundColor;
        break;
      case AgnesAppBarStyle.surface:
        effectiveAppBarColor = effectiveSurfaceColor;
        break;
      case AgnesAppBarStyle.custom:
        effectiveAppBarColor = effectiveColors.appBarColor ??
            (darkIsTrueBlack ? Colors.black : AgnesColors.materialDarkSurface);
        break;
    }
    effectiveAppBarColor =
        appBarBackground ?? effectiveAppBarColor.withOpacity(appBarOpacity);

    return AgnesColorScheme(
      colorScheme: colorScheme,
      brightness: Brightness.dark,
      primary: effectiveColors.primary,
      primaryContainer: effectiveColors.primaryContainer,
      secondary: effectiveColors.secondary,
      secondaryContainer: effectiveColors.secondaryContainer,
      surface: effectiveSurfaceColor,
      background: effectiveBackgroundColor,
      scaffoldBackground: scaffoldBackground ??
          (darkIsTrueBlack
              ? Colors.black
              : surfaceSchemeColors.scaffoldBackground),
      dialogBackground: effectiveDialogBackground,
      appBarBackground: effectiveAppBarColor,
      error: effectiveColors.error ?? AgnesColors.materialDarkError,
      onPrimary: onColors.onPrimary,
      onSecondary: onColors.onSecondary,
      onSurface: onColors.onSurface,
      onBackground: onColors.onBackground,
      onError: onColors.onError,
      tabBarStyle: tabBarStyle,
      appBarElevation: appBarElevation,
      bottomAppBarElevation: effectiveBottomAppBarElevation,
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
    );
  }

  static const TextTheme m3TextTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    headline2: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    headline3: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    headline4: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    headline5: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    headline6: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subtitle2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    button: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    overline: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
  );

  static VisualDensity get comfortablePlatformDensity {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        break;
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return VisualDensity.comfortable;
    }
    return VisualDensity.standard;
  }

  static SystemUiOverlayStyle themedSystemNavigationBar(
    BuildContext? context, {
    final bool? useDivider,
    final double opacity = 1,
    final bool noAppBar = false,
    final bool invertStatusIcons = false,
    final AgnesSystemNavBarStyle systemNavBarStyle =
        AgnesSystemNavBarStyle.background,
    final Color? systemNavigationBarColor,
    final Color? systemNavigationBarDividerColor,
    final Brightness nullContextBrightness = Brightness.light,
    @Deprecated('This property is deprecated use systemNavigationBarColor '
        'instead. Deprecated in v2.0.0.')
        Color? nullContextBackground,
  }) {
    double _opacity = opacity;
    if (_opacity < 0) _opacity = 0;
    if (_opacity > 1) _opacity = 1;

    final Color? _systemNavigationBarColor =
        systemNavigationBarColor ?? nullContextBackground;

    if (systemNavBarStyle == AgnesSystemNavBarStyle.transparent) {
      _opacity = 0.01;
    }

    final bool isDark = context != null
        ? Theme.of(context).brightness == Brightness.dark
        : nullContextBrightness == Brightness.dark;

    final Color agnesBackground = (context != null)
        ? systemNavBarStyle == AgnesSystemNavBarStyle.system
            ? (isDark ? Colors.black : Colors.white)
            : systemNavBarStyle == AgnesSystemNavBarStyle.background
                ? Theme.of(context).colorScheme.background
                : systemNavBarStyle == AgnesSystemNavBarStyle.surface
                    ? Theme.of(context).colorScheme.surface
                    : systemNavBarStyle ==
                            AgnesSystemNavBarStyle.scaffoldBackground
                        ? Theme.of(context).scaffoldBackgroundColor
                        : Theme.of(context).scaffoldBackgroundColor
        : (isDark ? Colors.black : Colors.white);

    final Color background = _systemNavigationBarColor ?? agnesBackground;

    Color? dividerColor;

    final double dividerOpacity = _opacity < 1 ? 0.8 : 1;

    if (useDivider == null) {
      dividerColor = null;
    } else if (useDivider && systemNavigationBarDividerColor == null) {
      dividerColor = isDark
          ? const Color(0xFF2C2C2C).withOpacity(dividerOpacity)
          : const Color(0xFFDDDDDD).withOpacity(dividerOpacity);
    } else if (useDivider && systemNavigationBarDividerColor != null) {
      dividerColor =
          systemNavigationBarDividerColor.withOpacity(dividerOpacity);
    } else {
      dividerColor = background.withOpacity(_opacity);
    }

    if (_opacity < 1) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
    return SystemUiOverlayStyle(
      statusBarColor: noAppBar ? Colors.transparent : null,
      statusBarBrightness:
          noAppBar ? (isDark ? Brightness.dark : Brightness.light) : null,
      statusBarIconBrightness: noAppBar
          ? invertStatusIcons
              ? (isDark ? Brightness.dark : Brightness.light)
              : (isDark ? Brightness.light : Brightness.dark)
          : null,
      systemNavigationBarContrastEnforced: false,
      systemNavigationBarColor: background.withOpacity(_opacity),
      systemNavigationBarDividerColor: dividerColor,
      systemNavigationBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,
    );
  }

  static MaterialColor createPrimarySwatch(final Color? color) {
    final Color _color = color ?? AgnesColors.materialLightPrimary;
    const List<double> strengths = <double>[
      0.05,
      0.1,
      0.2,
      0.3,
      0.4,
      0.5,
      0.6,
      0.7,
      0.8,
      0.9
    ];
    final Map<int, Color> swatch = <int, Color>{};
    final int r = _color.red;
    final int g = _color.green;
    final int b = _color.blue;
    for (final double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(_color.value, swatch);
  }

  ThemeData get toTheme {
    final AgnesSubThemesData subTheme =
        subThemesData ?? const AgnesSubThemesData();

    final ColorScheme colorScheme = toScheme;

    final bool isDark = colorScheme.brightness == Brightness.dark;

    final TargetPlatform effectivePlatform = platform ?? defaultTargetPlatform;

    final Typography effectiveTypography =
        typography ?? Typography.material2018(platform: effectivePlatform);

    TextTheme defTextTheme =
        isDark ? effectiveTypography.white : effectiveTypography.black;

    final bool primaryIsDark =
        ThemeData.estimateBrightnessForColor(colorScheme.primary) ==
            Brightness.dark;
    TextTheme defPrimaryTextTheme =
        primaryIsDark ? effectiveTypography.white : effectiveTypography.black;

    if (fontFamily != null) {
      defTextTheme = defTextTheme.apply(fontFamily: fontFamily);
      defPrimaryTextTheme = defPrimaryTextTheme.apply(fontFamily: fontFamily);
    }

    if (useSubThemes && subTheme.blendTextTheme) {
      final Color _onColor = isDark
          ? (colorScheme.onBackground.red < colorScheme.onSurface.red)
              ? colorScheme.onSurface
              : colorScheme.onBackground
          : (colorScheme.onBackground.red > colorScheme.onSurface.red)
              ? colorScheme.onSurface
              : colorScheme.onBackground;

      final Color _head = isDark
          ? _onColor.blend(colorScheme.primary, 40)
          : _onColor.blend(colorScheme.primary, 50);
      final Color _medium = isDark
          ? _onColor.blend(colorScheme.primary, 22)
          : _onColor.blend(colorScheme.primary, 40);
      final Color _small = isDark
          ? _onColor.blend(colorScheme.primary, 20)
          : _onColor.blend(colorScheme.primary, 30);

      defTextTheme = defTextTheme.copyWith(
        headline1: defTextTheme.headline1!.copyWith(color: _head),
        headline2: defTextTheme.headline2!.copyWith(color: _head),
        headline3: defTextTheme.headline3!.copyWith(color: _head),
        headline4: defTextTheme.headline4!.copyWith(color: _head),
        headline5: defTextTheme.headline5!.copyWith(color: _medium),
        headline6: defTextTheme.headline6!.copyWith(color: _medium),
        subtitle1: defTextTheme.subtitle1!.copyWith(color: _medium),
        subtitle2: defTextTheme.subtitle2!.copyWith(color: _small),
        bodyText1: defTextTheme.bodyText1!.copyWith(color: _medium),
        bodyText2: defTextTheme.bodyText2!.copyWith(color: _medium),
        button: defTextTheme.button!.copyWith(color: _medium),
        caption: defTextTheme.caption!
            .copyWith(color: _medium.withAlpha(isDark ? 0xCC : 0xBF)),
        overline: defTextTheme.overline!.copyWith(color: _small),
      );

      final Color _headP = primaryIsDark
          ? colorScheme.onPrimary.blend(colorScheme.primary, 16)
          : colorScheme.onPrimary.blend(colorScheme.primary, 10);
      final Color _mediumP = primaryIsDark
          ? colorScheme.onPrimary.blend(colorScheme.primary, 8)
          : colorScheme.onPrimary.blend(colorScheme.primary, 5);
      final Color _smallP = primaryIsDark
          ? colorScheme.onPrimary.blend(colorScheme.primary, 7)
          : colorScheme.onPrimary.blend(colorScheme.primary, 4);
      defPrimaryTextTheme = defPrimaryTextTheme.copyWith(
        headline1: defPrimaryTextTheme.headline1!.copyWith(color: _headP),
        headline2: defPrimaryTextTheme.headline2!.copyWith(color: _headP),
        headline3: defPrimaryTextTheme.headline3!.copyWith(color: _headP),
        headline4: defPrimaryTextTheme.headline4!.copyWith(color: _headP),
        headline5: defPrimaryTextTheme.headline5!.copyWith(color: _mediumP),
        headline6: defPrimaryTextTheme.headline6!.copyWith(color: _mediumP),
        subtitle1: defPrimaryTextTheme.subtitle1!.copyWith(color: _mediumP),
        subtitle2: defPrimaryTextTheme.subtitle2!.copyWith(color: _smallP),
        bodyText1: defPrimaryTextTheme.bodyText1!.copyWith(color: _mediumP),
        bodyText2: defPrimaryTextTheme.bodyText2!.copyWith(color: _mediumP),
        button: defPrimaryTextTheme.button!.copyWith(color: _mediumP),
        caption: defPrimaryTextTheme.caption!
            .copyWith(color: _mediumP.withAlpha(primaryIsDark ? 0xD8 : 0xCC)),
        overline: defPrimaryTextTheme.overline!.copyWith(color: _smallP),
      );
    }

    if (useSubThemes && subTheme.useTextTheme) {
      defTextTheme = defTextTheme.merge(m3TextTheme);
      defPrimaryTextTheme = defPrimaryTextTheme.merge(m3TextTheme);
    }

    final TextTheme effectiveTextTheme = defTextTheme.merge(textTheme);
    final TextTheme effectivePrimaryTextTheme =
        defPrimaryTextTheme.merge(primaryTextTheme);

    final MaterialColor primarySwatch =
        createPrimarySwatch(colorScheme.primary);

    final Color primaryColorDark =
        isDark ? primarySwatch[700]! : primarySwatch[800]!;
    final Color primaryColorLight = primarySwatch[100]!;
    final Color secondaryHeaderColor = primarySwatch[50]!;

    final Color effectiveAppBarColor = appBarBackground ??
        (isDark ? colorScheme.surface : colorScheme.primary);
    final Brightness appBarBrightness =
        ThemeData.estimateBrightnessForColor(effectiveAppBarColor);
    Color appBarForeground =
        appBarBrightness == Brightness.dark ? Colors.white : Colors.black;

    Color appBarIconColor =
        appBarBrightness == Brightness.dark ? Colors.white : Colors.black87;

    if (useSubThemes && subTheme.blendTextTheme) {
      if (appBarBrightness == Brightness.dark) {
        appBarForeground =
            AgnesColors.lightSurface.blend(effectiveAppBarColor, 12);
      } else {
        appBarForeground =
            AgnesColors.darkSurface.blend(effectiveAppBarColor, 12);
      }
      appBarIconColor = appBarForeground;
    }

    Color selectedTabColor() {
      switch (tabBarStyle) {
        case AgnesTabBarStyle.flutterDefault:
          return isDark ? Colors.white : colorScheme.onPrimary;
        case AgnesTabBarStyle.forBackground:
          return colorScheme.primary;
        case AgnesTabBarStyle.forAppBar:
          return appBarBrightness == Brightness.light
              ? Colors.black87
              : Colors.white;
        case AgnesTabBarStyle.universal:
          return isDark
              ? colorScheme.primary.blendAlpha(Colors.white, 0xE6)
              : colorScheme.primary.blendAlpha(Colors.white, 0xB2);
      }
    }

    Color unselectedTabColor() {
      switch (tabBarStyle) {
        case AgnesTabBarStyle.flutterDefault:
          return selectedTabColor().withAlpha(0xB2);
        case AgnesTabBarStyle.forBackground:
          return useSubThemes
              ? colorScheme.onSurface
                  .blendAlpha(colorScheme.primary,
                      kUnselectedBackgroundPrimaryAlphaBlend)
                  .withAlpha(kUnselectedAlphaBlend)
              : colorScheme.onSurface.withAlpha(0x99);
        case AgnesTabBarStyle.forAppBar:
          return (appBarBrightness == Brightness.light &&
                  (effectiveAppBarColor == Colors.white ||
                      effectiveAppBarColor == colorScheme.surface ||
                      effectiveAppBarColor == colorScheme.background))
              ? colorScheme.onSurface.withAlpha(0x99)
              : selectedTabColor().withAlpha(0xB2);
        case AgnesTabBarStyle.universal:
          return isDark
              ? colorScheme.primary
                  .blendAlpha(Colors.white, 0xE6)
                  .withAlpha(0xB2)
              : colorScheme.primary
                  .blendAlpha(Colors.white, 0x7F)
                  .withAlpha(0x7F);
      }
    }

    double tooltipFontSize() {
      switch (effectivePlatform) {
        case TargetPlatform.macOS:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return 12;
        case TargetPlatform.iOS:
        case TargetPlatform.fuchsia:
        case TargetPlatform.android:
          return 14;
      }
    }

    EdgeInsets tooltipPadding() {
      switch (effectivePlatform) {
        case TargetPlatform.macOS:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return const EdgeInsets.fromLTRB(8, 3, 8, 4);
        case TargetPlatform.iOS:
        case TargetPlatform.fuchsia:
        case TargetPlatform.android:
          return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      }
    }

    final Color dividerColor = colorScheme.onSurface.withAlpha(0x1E);

    final InputDecorationTheme effectiveInputDecorationTheme = useSubThemes
        ? AgnesSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            baseSchemeColor: subTheme.inputDecoratorSchemeColor,
            radius: subTheme.inputDecorationRadius ??
                subTheme.defaultRadius ??
                kButtonRadius,
            borderType: subTheme.inputDecoratorBorderType,
            filled: subTheme.inputDecoratorIsFilled,
            fillColor: subTheme.inputDecoratorFillColor,
            focusedBorderWidth: subTheme.thickBorderWidth,
            unfocusedBorderWidth: subTheme.thinBorderWidth,
            unfocusedHasBorder: subTheme.inputDecoratorUnfocusedHasBorder,
          )
        : InputDecorationTheme(
            filled: subTheme.inputDecoratorIsFilled,
            fillColor: isDark
                ? colorScheme.primary.withAlpha(0x0F)
                : colorScheme.primary.withAlpha(0x09),
          );

    final bool themedEffects = useSubThemes && subTheme.interactionEffects;

    return ThemeData(
      fontFamily: fontFamily,
      visualDensity: visualDensity,
      textTheme: effectiveTextTheme,
      primaryTextTheme: effectivePrimaryTextTheme,
      typography: effectiveTypography,
      platform: effectivePlatform,
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: scaffoldBackground ?? colorScheme.background,
      cardColor: colorScheme.surface,
      dividerColor: dividerColor,
      backgroundColor: colorScheme.background,
      disabledColor: themedEffects
          ? colorScheme.primary
              .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
              .withAlpha(kDisabledBackgroundAlpha)
          : isDark
              ? Colors.white38
              : Colors.black38,
      hintColor: isDark ? Colors.white60 : Colors.black.withAlpha(0x99),
      hoverColor: themedEffects
          ? colorScheme.primary
              .blendAlpha(Colors.white, kHoverAlphaBlend)
              .withAlpha(kHoverAlpha)
          : null,
      focusColor: themedEffects
          ? colorScheme.primary
              .blendAlpha(Colors.white, kFocusAlphaBlend)
              .withAlpha(kFocusAlpha)
          : null,
      highlightColor: themedEffects
          ? colorScheme.primary
              .blendAlpha(Colors.white, kHighlightAlphaBlend)
              .withAlpha(kHighlightAlpha)
          : null,
      splashColor: themedEffects
          ? Color(0xff8f0028)
              .blendAlpha(Colors.white, kSplashAlphaBlend)
              .withAlpha(kSplashAlpha)
          : null,
      dialogBackgroundColor: dialogBackground ?? colorScheme.background,
      errorColor: colorScheme.error,
      indicatorColor: subTheme.tabBarIndicatorSchemeColor == null
          ? selectedTabColor()
          : AgnesSubThemes.schemeColor(
              subTheme.tabBarIndicatorSchemeColor!, colorScheme),
      applyElevationOverlayColor: isDark && applyElevationOverlayColor,
      colorScheme: colorScheme,
      toggleableActiveColor: colorScheme.secondary,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      secondaryHeaderColor: secondaryHeaderColor,
      appBarTheme: AppBarTheme(
        backgroundColor: effectiveAppBarColor,
        foregroundColor: appBarForeground,
        iconTheme: IconThemeData(color: appBarIconColor),
        actionsIconTheme: IconThemeData(color: appBarIconColor),
        elevation: appBarElevation,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: transparentStatusBar
              ? Colors.transparent
              : const Color(0x40000000),
          statusBarBrightness: appBarBrightness,
          statusBarIconBrightness: appBarBrightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
          systemNavigationBarColor: const Color(0xFF000000),
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: null,
        ),
      ),
      bottomAppBarColor: colorScheme.background,
      bottomAppBarTheme: BottomAppBarTheme(
        color: colorScheme.background,
        elevation: bottomAppBarElevation,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: isDark
            ? colorScheme.primary.withAlpha(0xB2)
            : colorScheme.primary.withAlpha(0x4C),
        selectionHandleColor: primaryColorDark,
      ),
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: effectiveTextTheme.bodyText1,
        labelColor: selectedTabColor(),
        unselectedLabelStyle: effectiveTextTheme.bodyText1,
        unselectedLabelColor: unselectedTabColor(),
      ),
      iconTheme: useSubThemes
          ? IconThemeData(color: effectiveTextTheme.headline6!.color)
          : null,
      primaryIconTheme: useSubThemes
          ? IconThemeData(color: effectivePrimaryTextTheme.headline6!.color)
          : null,
      tooltipTheme: TooltipThemeData(
        padding: tooltipPadding(),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        textStyle: effectiveTextTheme.bodyText2!.copyWith(
          inherit: false,
          color: tooltipsMatchBackground
              ? isDark
                  ? Colors.white
                  : Colors.black
              : isDark
                  ? Colors.black
                  : Colors.white,
          fontSize: tooltipFontSize(),
        ),
        decoration: useSubThemes
            ? tooltipsMatchBackground
                ? BoxDecoration(
                    color: isDark
                        ? AgnesColors.darkSurface
                            .blendAlpha(colorScheme.primary, 0x28)
                            .withAlpha(0xF2)
                        : AgnesColors.lightSurface
                            .blendAlpha(colorScheme.primary, 0x0A)
                            .withAlpha(0xF2),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: dividerColor),
                  )
                : BoxDecoration(
                    color: isDark
                        ? AgnesColors.lightSurface
                            .blendAlpha(colorScheme.primary, 0x63)
                            .withAlpha(0xF2)
                        : AgnesColors.darkSurface
                            .blendAlpha(colorScheme.primary, 0x72)
                            .withAlpha(0xF2),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: dividerColor),
                  )
            : tooltipsMatchBackground
                ? BoxDecoration(
                    color: isDark
                        ? const Color(0xED444444)
                        : const Color(0xF0FCFCFC),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(color: dividerColor),
                  )
                : null,
      ),
      textButtonTheme: useSubThemes
          ? AgnesSubThemes.textButtonTheme(
              colorScheme: colorScheme,
              radius: subTheme.textButtonRadius ?? subTheme.defaultRadius,
              padding: subTheme.buttonPadding,
              minButtonSize: subTheme.buttonMinSize,
            )
          : null,
      elevatedButtonTheme: useSubThemes
          ? AgnesSubThemes.elevatedButtonTheme(
              colorScheme: colorScheme,
              radius: subTheme.elevatedButtonRadius ?? subTheme.defaultRadius,
              elevation: subTheme.elevatedButtonElevation,
              padding: subTheme.buttonPadding,
              minButtonSize: subTheme.buttonMinSize,
            )
          : null,
      outlinedButtonTheme: useSubThemes
          ? AgnesSubThemes.outlinedButtonTheme(
              colorScheme: colorScheme,
              radius: subTheme.outlinedButtonRadius ?? subTheme.defaultRadius,
              pressedOutlineWidth: subTheme.thickBorderWidth,
              outlineWidth: subTheme.thinBorderWidth,
              padding: subTheme.buttonPadding,
              minButtonSize: subTheme.buttonMinSize,
            )
          : null,
      buttonTheme: useSubThemes
          ? AgnesSubThemes.buttonTheme(
              colorScheme: colorScheme,
              radius: subTheme.textButtonRadius ?? subTheme.defaultRadius,
              padding: subTheme.buttonPadding,
              minButtonSize: subTheme.buttonMinSize,
            )
          : ButtonThemeData(
              colorScheme: colorScheme,
              textTheme: ButtonTextTheme.primary,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
      toggleButtonsTheme: useSubThemes
          ? AgnesSubThemes.toggleButtonsTheme(
              colorScheme: colorScheme,
              borderWidth: subTheme.thinBorderWidth,
              radius: subTheme.toggleButtonsRadius ?? subTheme.defaultRadius,
              minButtonSize: subTheme.buttonMinSize,
              visualDensity: visualDensity,
            )
          : null,
      inputDecorationTheme: effectiveInputDecorationTheme,
      floatingActionButtonTheme: useSubThemes
          ? AgnesSubThemes.floatingActionButtonTheme(
              radius: subTheme.dialogRadius ?? subTheme.defaultRadius,
              useShape: subTheme.fabUseShape,
            )
          : null,
      chipTheme: useSubThemes
          ? AgnesSubThemes.chipTheme(
              colorScheme: colorScheme,
              baseSchemeColor: subTheme.chipSchemeColor,
              labelStyle: effectiveTextTheme.button!,
              radius: subTheme.chipRadius ?? subTheme.defaultRadius,
            )
          : ChipThemeData.fromDefaults(
              secondaryColor: colorScheme.primary,
              brightness: colorScheme.brightness,
              labelStyle: effectiveTextTheme.bodyText1!,
            ),
      cardTheme: useSubThemes
          ? AgnesSubThemes.cardTheme(
              radius: subTheme.cardRadius ?? subTheme.defaultRadius,
              elevation: subTheme.cardElevation,
            )
          : null,
      popupMenuTheme: useSubThemes
          ? AgnesSubThemes.popupMenuTheme(
              radius: subTheme.popupMenuRadius ??
                  ((subTheme.defaultRadius ?? 16) > 10
                      ? 10
                      : subTheme.defaultRadius),
              elevation: subTheme.popupMenuElevation,
              color: subTheme.popupMenuOpacity == null
                  ? null
                  : colorScheme.surface.withOpacity(subTheme.popupMenuOpacity!),
            )
          : null,
      dialogTheme: useSubThemes
          ? AgnesSubThemes.dialogTheme(
              radius: subTheme.dialogRadius ?? subTheme.defaultRadius,
              elevation: subTheme.dialogElevation,
              backgroundColor: dialogBackground ?? colorScheme.background,
            )
          : null,
      timePickerTheme: useSubThemes
          ? AgnesSubThemes.timePickerTheme(
              backgroundColor: dialogBackground ?? colorScheme.background,
              radius: subTheme.timePickerDialogRadius ?? subTheme.defaultRadius,
              elementRadius: subTheme.cardRadius ?? subTheme.defaultRadius,
              inputDecorationTheme: effectiveInputDecorationTheme)
          : null,
      snackBarTheme: useSubThemes
          ? AgnesSubThemes.snackBarTheme(
              elevation: subTheme.snackBarElevation,
              backgroundColor: isDark
                  ? colorScheme.onSurface
                      .blendAlpha(colorScheme.primary, 0x63)
                      .withAlpha(0xF2)
                  : colorScheme.onSurface
                      .blendAlpha(colorScheme.primary, 0x72)
                      .withAlpha(0xED))
          : null,
      bottomSheetTheme: useSubThemes
          ? AgnesSubThemes.bottomSheetTheme(
              radius: subTheme.bottomSheetRadius ?? subTheme.defaultRadius,
              elevation: subTheme.bottomSheetElevation,
              modalElevation: subTheme.bottomSheetModalElevation,
            )
          : null,
      bottomNavigationBarTheme: useSubThemes
          ? AgnesSubThemes.bottomNavigationBar(
              colorScheme: colorScheme,
              baseSchemeColor: subTheme.bottomNavigationBarSchemeColor,
              backgroundSchemeColor:
                  subTheme.bottomNavigationBarBackgroundSchemeColor,
              elevation: subTheme.bottomNavigationBarElevation,
              opacity: subTheme.bottomNavigationBarOpacity,
              unselectedAlphaBlend: kUnselectedBackgroundPrimaryAlphaBlend,
              unselectedAlpha: kUnselectedAlphaBlend,
            )
          : BottomNavigationBarThemeData(
              selectedIconTheme: IconThemeData(
                color: colorScheme.primary,
              ),
              selectedItemColor: colorScheme.primary,
            ),
      navigationBarTheme: useSubThemes
          ? AgnesSubThemes.navigationBarTheme(
              colorScheme: colorScheme,
              labelTextStyle: subTheme.navigationBarIsStyled
                  ? effectiveTextTheme.overline
                  : null,
              selectedLabelSize: subTheme.navigationBarSelectedLabelSize,
              unselectedLabelSize: subTheme.navigationBarUnselectedLabelSize,
              textSchemeColor: subTheme.navigationBarTextSchemeColor ??
                  (subTheme.navigationBarIsStyled ? SchemeColor.primary : null),
              mutedUnselectedText: subTheme.navigationBarMutedUnselectedText ??
                  subTheme.navigationBarIsStyled,
              selectedIconSize: subTheme.navigationBarSelectedIconSize,
              unselectedIconSize: subTheme.navigationBarUnselectedIconSize,
              iconSchemeColor: subTheme.navigationBarIconSchemeColor ??
                  (subTheme.navigationBarIsStyled ? SchemeColor.primary : null),
              mutedUnselectedIcon: subTheme.navigationBarMutedUnselectedIcon ??
                  subTheme.navigationBarIsStyled,
              highlightSchemeColor: subTheme
                      .navigationBarHighlightSchemeColor ??
                  (subTheme.navigationBarIsStyled ? SchemeColor.primary : null),
              indicatorAlpha: kNavigationBarIndicatorAlpha,
              backgroundSchemeColor:
                  subTheme.navigationBarBackgroundSchemeColor ??
                      (subTheme.navigationBarIsStyled
                          ? SchemeColor.background
                          : null),
              opacity: subTheme.navigationBarOpacity,
              height: subTheme.navigationBarHeight ??
                  (subTheme.navigationBarIsStyled
                      ? kNavigationBarHeight
                      : null),
              labelBehavior: subTheme.navigationBarLabelBehavior,
              unselectedAlphaBlend: kUnselectedBackgroundPrimaryAlphaBlend,
              unselectedAlpha: kUnselectedAlphaBlend,
            )
          : null,
    );
  }

  ColorScheme get toScheme {
    final Brightness _brightness =
        brightness ?? colorScheme?.brightness ?? Brightness.light;
    final bool isDark = _brightness == Brightness.dark;

    final Color _primary = primary ??
        colorScheme?.primary ??
        (isDark
            ? AgnesColors.materialDarkPrimary
            : AgnesColors.materialLightPrimary);

    final AgnesSchemeColor _fallbacks = AgnesSchemeColor.from(
      primary: _primary,
      primaryContainer: primaryContainer,
      secondary: secondary,
      secondaryContainer: secondaryContainer,
    );

    final Color _primaryContainer = primaryContainer ??
        colorScheme?.primaryContainer ??
        _fallbacks.primaryContainer;
    final Color _secondary =
        secondary ?? colorScheme?.secondary ?? _fallbacks.secondary;
    final Color _secondaryContainer = secondaryContainer ??
        colorScheme?.secondaryContainer ??
        _fallbacks.secondaryContainer;

    final Color _surface = surface ??
        colorScheme?.surface ??
        (isDark
            ? AgnesColors.materialDarkSurface
            : AgnesColors.materialLightSurface);
    final Color _background = background ??
        colorScheme?.background ??
        (isDark
            ? AgnesColors.materialDarkBackground
            : AgnesColors.materialLightBackground);
    final Color _error = error ??
        colorScheme?.error ??
        (isDark
            ? AgnesColors.materialDarkError
            : AgnesColors.materialLightError);

    final AgnesSchemeOnColors onColors = AgnesSchemeOnColors.from(
      primary: _primary,
      secondary: _secondary,
      surface: _surface,
      background: _background,
      error: _error,
      onPrimary: onPrimary ?? colorScheme?.onPrimary,
      onSecondary: onSecondary ?? colorScheme?.onSecondary,
      onSurface: onSurface ?? colorScheme?.onSurface,
      onBackground: onBackground ?? colorScheme?.onBackground,
      onError: onError ?? colorScheme?.onError,
    );

    return colorScheme?.copyWith(
          primary: _primary,
          primaryContainer: _primaryContainer,
          secondary: _secondary,
          secondaryContainer: _secondaryContainer,
          surface: _surface,
          background: _background,
          error: _error,
          onPrimary: onColors.onPrimary,
          onSecondary: onColors.onSecondary,
          onSurface: onColors.onSurface,
          onBackground: onColors.onBackground,
          onError: onColors.onError,
          brightness: _brightness,
        ) ??
        ColorScheme(
          primary: _primary,
          primaryContainer: _primaryContainer,
          secondary: _secondary,
          secondaryContainer: _secondaryContainer,
          surface: _surface,
          background: _background,
          error: _error,
          onPrimary: onColors.onPrimary,
          onSecondary: onColors.onSecondary,
          onSurface: onColors.onSurface,
          onBackground: onColors.onBackground,
          onError: onColors.onError,
          brightness: _brightness,
        );
  }

  AgnesColorScheme copyWith({
    ColorScheme? colorScheme,
    Brightness? brightness,
    Color? primary,
    Color? primaryContainer,
    Color? secondary,
    Color? secondaryContainer,
    Color? surface,
    Color? background,
    Color? error,
    Color? scaffoldBackground,
    Color? dialogBackground,
    Color? appBarBackground,
    Color? onPrimary,
    Color? onSecondary,
    Color? onSurface,
    Color? onBackground,
    Color? onError,
    AgnesTabBarStyle? tabBarStyle,
    double? appBarElevation,
    double? bottomAppBarElevation,
    bool? tooltipsMatchBackground,
    bool? transparentStatusBar,
    VisualDensity? visualDensity,
    TextTheme? textTheme,
    TextTheme? primaryTextTheme,
    String? fontFamily,
    TargetPlatform? platform,
    Typography? typography,
    bool? applyElevationOverlayColor,
    bool? useSubThemes,
    AgnesSubThemesData? subThemesData,
  }) {
    return AgnesColorScheme(
      colorScheme: colorScheme ?? this.colorScheme,
      brightness: brightness ?? this.brightness,
      primary: primary ?? this.primary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      secondary: secondary ?? this.secondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      surface: surface ?? this.surface,
      background: background ?? this.background,
      error: error ?? this.error,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      dialogBackground: dialogBackground ?? this.dialogBackground,
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      onSurface: onSurface ?? this.onSurface,
      onBackground: onBackground ?? this.onBackground,
      onError: onError ?? this.onError,
      tabBarStyle: tabBarStyle ?? this.tabBarStyle,
      appBarElevation: appBarElevation ?? this.appBarElevation,
      bottomAppBarElevation:
          bottomAppBarElevation ?? this.bottomAppBarElevation,
      tooltipsMatchBackground:
          tooltipsMatchBackground ?? this.tooltipsMatchBackground,
      transparentStatusBar: transparentStatusBar ?? this.transparentStatusBar,
      visualDensity: visualDensity ?? this.visualDensity,
      textTheme: textTheme ?? this.textTheme,
      primaryTextTheme: primaryTextTheme ?? this.primaryTextTheme,
      fontFamily: fontFamily ?? this.fontFamily,
      platform: platform ?? this.platform,
      typography: typography ?? this.typography,
      applyElevationOverlayColor:
          applyElevationOverlayColor ?? this.applyElevationOverlayColor,
      useSubThemes: useSubThemes ?? this.useSubThemes,
      subThemesData: subThemesData ?? this.subThemesData,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is AgnesColorScheme &&
        other.colorScheme == colorScheme &&
        other.brightness == brightness &&
        other.primary == primary &&
        other.primaryContainer == primaryContainer &&
        other.secondary == secondary &&
        other.secondaryContainer == secondaryContainer &&
        other.surface == surface &&
        other.background == background &&
        other.error == error &&
        other.scaffoldBackground == scaffoldBackground &&
        other.appBarBackground == appBarBackground &&
        other.dialogBackground == dialogBackground &&
        other.onPrimary == onPrimary &&
        other.onSecondary == onSecondary &&
        other.onSurface == onSurface &&
        other.onBackground == onBackground &&
        other.onError == onError &&
        other.tabBarStyle == tabBarStyle &&
        other.appBarElevation == appBarElevation &&
        other.bottomAppBarElevation == bottomAppBarElevation &&
        other.tooltipsMatchBackground == tooltipsMatchBackground &&
        other.transparentStatusBar == transparentStatusBar &&
        other.visualDensity == visualDensity &&
        other.textTheme == textTheme &&
        other.primaryTextTheme == primaryTextTheme &&
        other.fontFamily == fontFamily &&
        other.platform == platform &&
        other.typography == typography &&
        other.applyElevationOverlayColor == applyElevationOverlayColor &&
        other.useSubThemes == useSubThemes &&
        other.subThemesData == subThemesData;
  }

  @override
  int get hashCode {
    final List<Object?> values = <Object?>[
      colorScheme,
      brightness,
      primary,
      primaryContainer,
      secondary,
      secondaryContainer,
      surface,
      background,
      error,
      scaffoldBackground,
      appBarBackground,
      dialogBackground,
      onPrimary,
      onSecondary,
      onSurface,
      onBackground,
      onError,
      tabBarStyle,
      appBarElevation,
      bottomAppBarElevation,
      tooltipsMatchBackground,
      transparentStatusBar,
      visualDensity,
      textTheme,
      primaryTextTheme,
      fontFamily,
      platform,
      typography,
      applyElevationOverlayColor,
      useSubThemes,
      subThemesData,
    ];
    return hashList(values);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<ColorScheme>('colorScheme', colorScheme));
    properties.add(EnumProperty<Brightness>('brightness', brightness));
    properties.add(ColorProperty('primary', primary));
    properties.add(ColorProperty('primaryContainer', primaryContainer));
    properties.add(ColorProperty('secondary', secondary));
    properties.add(ColorProperty('secondaryContainer', secondaryContainer));
    properties.add(ColorProperty('surface', surface));
    properties.add(ColorProperty('background', background));
    properties.add(ColorProperty('error', error));
    properties.add(ColorProperty('scaffoldBackground', scaffoldBackground));
    properties.add(ColorProperty('appBarBackground', appBarBackground));
    properties.add(ColorProperty('dialogBackground', dialogBackground));
    properties.add(ColorProperty('onPrimary', onPrimary));
    properties.add(ColorProperty('onSecondary', onSecondary));
    properties.add(ColorProperty('onSurface', onSurface));
    properties.add(ColorProperty('onBackground', onBackground));
    properties.add(ColorProperty('onError', onError));
    properties.add(EnumProperty<AgnesTabBarStyle>('tabBarStyle', tabBarStyle));
    properties
        .add(DiagnosticsProperty<double>('appBarElevation', appBarElevation));
    properties.add(DiagnosticsProperty<double>(
        'bottomAppBarElevation', bottomAppBarElevation));
    properties.add(DiagnosticsProperty<bool>(
        'tooltipsMatchBackground', tooltipsMatchBackground));
    properties.add(DiagnosticsProperty<bool>(
        'transparentStatusBar', transparentStatusBar));
    properties.add(EnumProperty<VisualDensity>('visualDensity', visualDensity));
    properties.add(DiagnosticsProperty<TextTheme>('textTheme', textTheme));
    properties.add(
        DiagnosticsProperty<TextTheme>('primaryTextTheme', primaryTextTheme));
    properties.add(DiagnosticsProperty<String>('fontFamily', fontFamily));
    properties.add(EnumProperty<TargetPlatform>('platform', platform));
    properties.add(DiagnosticsProperty<Typography>('typography', typography));
    properties.add(DiagnosticsProperty<bool>(
        'applyElevationOverlayColor', applyElevationOverlayColor));
    properties.add(DiagnosticsProperty<bool>('useSubThemes', useSubThemes));
    properties.add(DiagnosticsProperty<AgnesSubThemesData>(
        'subThemesData', subThemesData));
  }
}

@immutable
class AgnesSchemeSurfaceColors with Diagnosticable {
  const AgnesSchemeSurfaceColors({
    required this.surface,
    required this.dialogBackground,
    required this.background,
    required this.scaffoldBackground,
  });

  final Color surface;

  final Color dialogBackground;

  final Color background;

  final Color scaffoldBackground;

  factory AgnesSchemeSurfaceColors.blend({
    final Brightness brightness = Brightness.light,
    final AgnesSurfaceMode surfaceMode =
        AgnesSurfaceMode.highBackgroundLowScaffold,
    final int blendLevel = 0,
    AgnesSchemeColor? schemeColors,
    AgnesSchemeSurfaceColors? blendColors,
    AgnesSchemeSurfaceColors? surfaceColors,
  }) {
    assert(
        blendLevel >= 0 && blendLevel <= 40,
        'Only blend levels from 0 to 40 '
        'are allowed. Very high alpha blend levels may not produce results '
        'that are visually very appealing or useful.');
    int _blendLevel = blendLevel;

    if (blendLevel < 0 || blendLevel > 40) _blendLevel = 0;

    final bool isLight = brightness == Brightness.light;

    final AgnesSchemeColor scheme = schemeColors ??
        (isLight ? AgnesColors.material.light : AgnesColors.material.dark);

    AgnesSchemeSurfaceColors blendColor = blendColors ??
        AgnesSchemeSurfaceColors(
          surface: scheme.primary,
          dialogBackground: scheme.primary,
          background: scheme.primary,
          scaffoldBackground: scheme.primary,
        );

    if (surfaceMode ==
            AgnesSurfaceMode.levelSurfacesLowScaffoldContainerDialog ||
        surfaceMode ==
            AgnesSurfaceMode.highScaffoldLowSurfacesContainerDialog) {
      blendColor =
          blendColor.copyWith(dialogBackground: scheme.secondaryContainer);
    }

    AgnesSchemeSurfaceColors surface = surfaceColors ??
        (isLight
            ? const AgnesSchemeSurfaceColors(
                surface: AgnesColors.materialLightSurface,
                background: AgnesColors.materialLightBackground,
                scaffoldBackground: AgnesColors.materialLightScaffoldBackground,
                dialogBackground: AgnesColors.materialLightSurface,
              )
            : const AgnesSchemeSurfaceColors(
                surface: AgnesColors.materialDarkSurface,
                background: AgnesColors.materialDarkBackground,
                scaffoldBackground: AgnesColors.materialDarkScaffoldBackground,
                dialogBackground: AgnesColors.materialDarkSurface,
              ));

    if (surfaceMode == AgnesSurfaceMode.highBackgroundLowScaffold ||
        surfaceMode == AgnesSurfaceMode.highSurfaceLowScaffold ||
        surfaceMode == AgnesSurfaceMode.highScaffoldLevelSurface) {
      if (_blendLevel == 0) {
        if (isLight) {
          surface = const AgnesSchemeSurfaceColors(
            surface: AgnesColors.materialLightSurface,
            background: AgnesColors.materialLightBackground,
            scaffoldBackground: AgnesColors.materialLightScaffoldBackground,
            dialogBackground: AgnesColors.materialLightSurface,
          );
        } else {
          surface = const AgnesSchemeSurfaceColors(
            surface: AgnesColors.materialDarkSurface,
            background: AgnesColors.materialDarkBackground,
            scaffoldBackground: AgnesColors.materialDarkScaffoldBackground,
            dialogBackground: AgnesColors.materialDarkSurface,
          );
        }
      } else {
        if (isLight) {
          surface = const AgnesSchemeSurfaceColors(
            surface: AgnesColors.lightSurface,
            background: AgnesColors.lightBackground,
            scaffoldBackground: AgnesColors.lightScaffoldBackground,
            dialogBackground: AgnesColors.lightSurface,
          );
        } else {
          surface = const AgnesSchemeSurfaceColors(
            surface: AgnesColors.darkSurface,
            background: AgnesColors.darkBackground,
            scaffoldBackground: AgnesColors.darkScaffoldBackground,
            dialogBackground: AgnesColors.darkSurface,
          );
        }
      }
    }

    if (surfaceMode == AgnesSurfaceMode.level ||
        surfaceMode == AgnesSurfaceMode.highScaffoldLowSurface ||
        surfaceMode == AgnesSurfaceMode.levelSurfacesLowScaffold ||
        surfaceMode ==
            AgnesSurfaceMode.levelSurfacesLowScaffoldContainerDialog) {
      if (isLight) {
        surface = const AgnesSchemeSurfaceColors(
          surface: AgnesColors.lightSurface,
          background: AgnesColors.lightSurface,
          scaffoldBackground: AgnesColors.lightSurface,
          dialogBackground: AgnesColors.lightSurface,
        );
      } else {
        surface = const AgnesSchemeSurfaceColors(
          surface: AgnesColors.darkSurface,
          background: AgnesColors.darkSurface,
          scaffoldBackground: AgnesColors.darkSurface,
          dialogBackground: AgnesColors.darkSurface,
        );
      }
    }

    if (surfaceMode == AgnesSurfaceMode.highScaffoldLowSurfaces ||
        surfaceMode ==
            AgnesSurfaceMode.highScaffoldLowSurfacesContainerDialog) {
      if (isLight) {
        surface = const AgnesSchemeSurfaceColors(
          surface: AgnesColors.lightBackground,
          background: AgnesColors.lightBackground,
          scaffoldBackground: AgnesColors.lightBackground,
          dialogBackground: AgnesColors.lightBackground,
        );
      } else {
        surface = const AgnesSchemeSurfaceColors(
          surface: AgnesColors.darkBackground,
          background: AgnesColors.darkBackground,
          scaffoldBackground: AgnesColors.darkBackground,
          dialogBackground: AgnesColors.darkBackground,
        );
      }
    }

    final _AlphaValues _blend =
        _AlphaValues.getAlphas(surfaceMode, _blendLevel, brightness);

    return AgnesSchemeSurfaceColors(
      surface:
          surface.surface.blendAlpha(blendColor.surface, _blend.surfaceAlpha),
      dialogBackground: surface.dialogBackground
          .blendAlpha(blendColor.dialogBackground, _blend.dialogAlpha),
      background: surface.background
          .blendAlpha(blendColor.background, _blend.backgroundAlpha),
      scaffoldBackground: surface.scaffoldBackground
          .blendAlpha(blendColor.scaffoldBackground, _blend.scaffoldAlpha),
    );
  }

  factory AgnesSchemeSurfaceColors.from({
    Brightness brightness = Brightness.light,
    AgnesSurface surfaceStyle = AgnesSurface.material,
    Color? primary,
  }) {
    primary ??= brightness == Brightness.light
        ? AgnesColors.materialLightPrimary
        : AgnesColors.materialDarkPrimary;

    switch (brightness) {
      case Brightness.light:
        {
          switch (surfaceStyle) {
            case AgnesSurface.material:
              return const AgnesSchemeSurfaceColors(
                surface: AgnesColors.materialLightSurface,
                background: AgnesColors.materialLightBackground,
                scaffoldBackground: AgnesColors.materialLightScaffoldBackground,
                dialogBackground: AgnesColors.materialLightSurface,
              );
            case AgnesSurface.light:
              return AgnesSchemeSurfaceColors(
                  surface: AgnesColors.lightSurface
                      .blend(primary, kLightBlendSurfaceLight),
                  background: AgnesColors.lightBackground
                      .blend(primary, kLightBlendBackgroundLight),
                  scaffoldBackground: AgnesColors.lightScaffoldBackground,
                  dialogBackground: AgnesColors.lightSurface);
            case AgnesSurface.medium:
              return AgnesSchemeSurfaceColors(
                surface: AgnesColors.lightSurface
                    .blend(primary, kLightBlendSurfaceMedium),
                background: AgnesColors.lightBackground
                    .blend(primary, kLightBlendBackgroundMedium),
                scaffoldBackground: AgnesColors.lightScaffoldBackground,
                dialogBackground: AgnesColors.lightSurface
                    .blend(primary, kLightBlendSurfaceMedium),
              );
            case AgnesSurface.strong:
              return AgnesSchemeSurfaceColors(
                surface: AgnesColors.lightSurface
                    .blend(primary, kLightBlendSurfaceStrong),
                background: AgnesColors.lightBackground
                    .blend(primary, kLightBlendBackgroundStrong),
                scaffoldBackground: AgnesColors.lightScaffoldBackground,
                dialogBackground: AgnesColors.lightSurface
                    .blend(primary, kLightBlendSurfaceStrong),
              );
            case AgnesSurface.heavy:
              return AgnesSchemeSurfaceColors(
                surface: AgnesColors.lightSurface
                    .blend(primary, kLightBlendSurfaceHeavy),
                background: AgnesColors.lightBackground
                    .blend(primary, kLightBlendBackgroundHeavy),
                scaffoldBackground: AgnesColors.lightScaffoldBackground
                    .blend(primary, kLightBlendScaffoldHeavy),
                dialogBackground: AgnesColors.lightSurface
                    .blend(primary, kLightBlendSurfaceHeavy),
              );
            case AgnesSurface.custom:
              return const AgnesSchemeSurfaceColors(
                surface: AgnesColors.materialLightSurface,
                background: AgnesColors.materialLightBackground,
                scaffoldBackground: AgnesColors.materialLightScaffoldBackground,
                dialogBackground: AgnesColors.materialLightSurface,
              );
          }
        }

      case Brightness.dark:
        {
          switch (surfaceStyle) {
            case AgnesSurface.material:
              return const AgnesSchemeSurfaceColors(
                surface: AgnesColors.materialDarkSurface,
                background: AgnesColors.materialDarkBackground,
                scaffoldBackground: AgnesColors.materialDarkScaffoldBackground,
                dialogBackground: AgnesColors.materialDarkSurface,
              );
            case AgnesSurface.light:
              return AgnesSchemeSurfaceColors(
                surface: AgnesColors.darkSurface
                    .blend(primary, kDarkBlendSurfaceLight),
                background: AgnesColors.darkBackground
                    .blend(primary, kDarkBlendBackgroundLight),
                scaffoldBackground: AgnesColors.darkScaffoldBackground,
                dialogBackground: AgnesColors.darkSurface
                    .blend(primary, kDarkBlendSurfaceLight),
              );
            case AgnesSurface.medium:
              return AgnesSchemeSurfaceColors(
                surface: AgnesColors.darkSurface
                    .blend(primary, kDarkBlendSurfaceMedium),
                background: AgnesColors.darkBackground
                    .blend(primary, kDarkBlendBackgroundMedium),
                scaffoldBackground: AgnesColors.darkScaffoldBackground,
                dialogBackground: AgnesColors.darkSurface
                    .blend(primary, kDarkBlendSurfaceMedium),
              );
            case AgnesSurface.strong:
              return AgnesSchemeSurfaceColors(
                surface: AgnesColors.darkSurface
                    .blend(primary, kDarkBlendSurfaceStrong),
                background: AgnesColors.darkBackground
                    .blend(primary, kDarkBlendBackgroundStrong),
                scaffoldBackground: AgnesColors.darkScaffoldBackground,
                dialogBackground: AgnesColors.darkSurface
                    .blend(primary, kDarkBlendSurfaceStrong),
              );
            case AgnesSurface.heavy:
              return AgnesSchemeSurfaceColors(
                surface: AgnesColors.darkSurface
                    .blend(primary, kDarkBlendSurfaceHeavy),
                background: AgnesColors.darkBackground
                    .blend(primary, kDarkBlendBackgroundHeavy),
                scaffoldBackground: AgnesColors.darkScaffoldBackground
                    .blend(primary, kDarkBlendScaffoldHeavy),
                dialogBackground: AgnesColors.darkSurface
                    .blend(primary, kDarkBlendSurfaceHeavy),
              );
            case AgnesSurface.custom:
              return const AgnesSchemeSurfaceColors(
                surface: AgnesColors.materialDarkSurface,
                background: AgnesColors.materialDarkBackground,
                scaffoldBackground: AgnesColors.materialDarkScaffoldBackground,
                dialogBackground: AgnesColors.materialDarkSurface,
              );
          }
        }
    }
  }

  AgnesSchemeSurfaceColors copyWith({
    Color? surface,
    Color? background,
    Color? scaffoldBackground,
    Color? dialogBackground,
  }) {
    return AgnesSchemeSurfaceColors(
      surface: surface ?? this.surface,
      background: background ?? this.background,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      dialogBackground: dialogBackground ?? this.dialogBackground,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('surface', surface));
    properties.add(ColorProperty('background', background));
    properties.add(ColorProperty('scaffoldBackground', scaffoldBackground));
    properties.add(ColorProperty('dialogBackground', dialogBackground));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is AgnesSchemeSurfaceColors &&
        other.surface == surface &&
        other.background == background &&
        other.scaffoldBackground == scaffoldBackground &&
        other.dialogBackground == dialogBackground;
  }

  @override
  int get hashCode {
    return hashValues(
      surface,
      background,
      scaffoldBackground,
      dialogBackground,
    );
  }
}

@immutable
class AgnesSchemeOnColors with Diagnosticable {
  const AgnesSchemeOnColors({
    required this.onPrimary,
    required this.onSecondary,
    required this.onSurface,
    required this.onBackground,
    required this.onError,
  });

  final Color onPrimary;

  final Color onSecondary;

  final Color onSurface;

  final Color onBackground;

  final Color onError;

  factory AgnesSchemeOnColors.from({
    required Color primary,
    required Color secondary,
    required Color surface,
    required Color background,
    required Color error,
    Color? onPrimary,
    Color? onSecondary,
    Color? onSurface,
    Color? onBackground,
    Color? onError,
    int primaryAlpha = 0,
    int secondaryAlpha = 0,
    int surfaceAlpha = 0,
    int backgroundAlpha = 0,
    int errorAlpha = 0,
  }) {
    final Color _onPrimary = onPrimary ??
        (ThemeData.estimateBrightnessForColor(primary) == Brightness.dark
            ? Colors.white.blendAlpha(primary, primaryAlpha)
            : Colors.black.blendAlpha(primary, primaryAlpha));
    final Color _onSecondary = onSecondary ??
        (ThemeData.estimateBrightnessForColor(secondary) == Brightness.dark
            ? Colors.white.blendAlpha(secondary, secondaryAlpha)
            : Colors.black.blendAlpha(secondary, secondaryAlpha));
    final Color _onSurface = onSurface ??
        (ThemeData.estimateBrightnessForColor(surface) == Brightness.dark
            ? Colors.white.blendAlpha(surface, surfaceAlpha)
            : Colors.black.blendAlpha(surface, surfaceAlpha));
    final Color _onBackground = onBackground ??
        (ThemeData.estimateBrightnessForColor(background) == Brightness.dark
            ? Colors.white.blendAlpha(background, backgroundAlpha)
            : Colors.black.blendAlpha(background, backgroundAlpha));
    final Color _onError = onError ??
        (ThemeData.estimateBrightnessForColor(error) == Brightness.dark
            ? Colors.white.blendAlpha(error, errorAlpha)
            : Colors.black.blendAlpha(error, errorAlpha));

    return AgnesSchemeOnColors(
      onPrimary: _onPrimary,
      onSecondary: _onSecondary,
      onSurface: _onSurface,
      onBackground: _onBackground,
      onError: _onError,
    );
  }

  AgnesSchemeOnColors copyWith({
    Color? onPrimary,
    Color? onSecondary,
    Color? onSurface,
    Color? onBackground,
    Color? onError,
  }) {
    return AgnesSchemeOnColors(
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      onSurface: onSurface ?? this.onSurface,
      onBackground: onBackground ?? this.onBackground,
      onError: onError ?? this.onError,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is AgnesSchemeOnColors &&
        other.onPrimary == onPrimary &&
        other.onSecondary == onSecondary &&
        other.onSurface == onSurface &&
        other.onBackground == onBackground &&
        other.onError == onError;
  }

  @override
  int get hashCode {
    return hashValues(
      onPrimary,
      onSecondary,
      onSurface,
      onBackground,
      onError,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('onPrimary', onPrimary));
    properties.add(ColorProperty('onSecondary', onSecondary));
    properties.add(ColorProperty('onSurface', onSurface));
    properties.add(ColorProperty('onBackground', onBackground));
    properties.add(ColorProperty('onError', onError));
  }
}

@immutable
class _AlphaValues {
  const _AlphaValues({
    this.primaryAlpha = 0,
    this.secondaryAlpha = 0,
    this.errorAlpha = 0,
    this.surfaceAlpha = 0,
    this.dialogAlpha = 0,
    this.backgroundAlpha = 0,
    this.scaffoldAlpha = 0,
  });

  final int primaryAlpha;

  final int secondaryAlpha;

  final int errorAlpha;

  final int surfaceAlpha;

  final int dialogAlpha;

  final int backgroundAlpha;

  final int scaffoldAlpha;

  static _AlphaValues getAlphas(
    final AgnesSurfaceMode mode,
    final int blendLevel,
    final Brightness brightness,
  ) {
    switch (mode) {
      case AgnesSurfaceMode.level:
      case AgnesSurfaceMode.custom:
        return _AlphaValues(
          primaryAlpha: blendLevel,
          secondaryAlpha: blendLevel,
          errorAlpha: blendLevel,
          surfaceAlpha: blendLevel,
          dialogAlpha: blendLevel,
          backgroundAlpha: blendLevel,
          scaffoldAlpha: blendLevel,
        );

      case AgnesSurfaceMode.highBackgroundLowScaffold:
        return _AlphaValues(
          primaryAlpha: blendLevel,
          secondaryAlpha: blendLevel,
          errorAlpha: blendLevel,
          surfaceAlpha: blendLevel,
          dialogAlpha: blendLevel,
          backgroundAlpha: blendLevel * 3 ~/ 2,
          scaffoldAlpha: blendLevel ~/ 2,
        );

      case AgnesSurfaceMode.highSurfaceLowScaffold:
        return _AlphaValues(
          primaryAlpha: blendLevel,
          secondaryAlpha: blendLevel,
          errorAlpha: blendLevel,
          surfaceAlpha: blendLevel * 3 ~/ 2,
          dialogAlpha: blendLevel * 3 ~/ 2,
          backgroundAlpha: blendLevel,
          scaffoldAlpha: blendLevel ~/ 2,
        );

      case AgnesSurfaceMode.highScaffoldLowSurface:
        return _AlphaValues(
          primaryAlpha: blendLevel,
          secondaryAlpha: blendLevel,
          errorAlpha: blendLevel,
          surfaceAlpha: blendLevel ~/ 2,
          dialogAlpha: blendLevel ~/ 2,
          backgroundAlpha: blendLevel,
          scaffoldAlpha: blendLevel * 3,
        );

      case AgnesSurfaceMode.highScaffoldLevelSurface:
        return _AlphaValues(
          primaryAlpha: blendLevel,
          secondaryAlpha: blendLevel,
          errorAlpha: blendLevel,
          surfaceAlpha: blendLevel,
          dialogAlpha: blendLevel,
          backgroundAlpha: blendLevel * 3 ~/ 2,
          scaffoldAlpha: blendLevel * 3,
        );

      case AgnesSurfaceMode.levelSurfacesLowScaffold:
      case AgnesSurfaceMode.levelSurfacesLowScaffoldContainerDialog:
        return _AlphaValues(
          primaryAlpha: blendLevel,
          secondaryAlpha: blendLevel,
          errorAlpha: blendLevel,
          surfaceAlpha: blendLevel,
          dialogAlpha: blendLevel,
          backgroundAlpha: blendLevel,
          scaffoldAlpha: blendLevel ~/ 2,
        );

      case AgnesSurfaceMode.highScaffoldLowSurfaces:
      case AgnesSurfaceMode.highScaffoldLowSurfacesContainerDialog:
        return _AlphaValues(
          primaryAlpha: blendLevel,
          secondaryAlpha: blendLevel,
          errorAlpha: blendLevel,
          surfaceAlpha: blendLevel ~/ 2,
          dialogAlpha: blendLevel ~/ 2,
          backgroundAlpha: blendLevel ~/ 2,
          scaffoldAlpha: blendLevel * 3,
        );
    }
  }
}
