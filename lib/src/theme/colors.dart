// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class AgnesColors {
  AgnesColors._();

  static const String name = '테마 이름';
  static const String description = '테마 소개';

  static const Color lightPrimary = Color(0XFF8f0028);
  static const Color lightPrimaryContainer = Color(0XFF8f0028);
  static const Color lightSecondary = Color(0XFF8f0028);
  static const Color lightSecondaryContainer = Color(0XFF8f0028);

  static const Color darkPrimary = Color(0XFF8f0028);
  static const Color darkPrimaryContainer = Color(0XFF8f0028);
  static const Color darkSecondary = Color(0XFF8f0028);
  static const Color darkSecondaryContainer = Color(0XFF8f0028);

  static const Color lightError = Color(0xFFB00020);
  static const Color darkError = Color(0xFFCF6679);

  static const Color lightSurface = Colors.white;
  static const Color lightBackground = Color(0xFFFDFDFD);
  static const Color lightScaffoldBackground = Colors.white;

  static const Color darkSurface = Color(0xFF111111);
  static const Color darkBackground = Color(0xFF101010);
  static const Color darkScaffoldBackground = Color(0xFF121212);

  static const Color materialLightSurface = Colors.white;
  static const Color materialLightBackground = Colors.white;
  static const Color materialLightScaffoldBackground = Colors.white;
  static const Color materialDarkSurface = Color(0xFF121212);
  static const Color materialDarkBackground = Color(0xFF121212);
  static const Color materialDarkScaffoldBackground = Color(0xFF121212);
  static const Color materialLightError = Color(0xFFB00020);
  static const Color materialDarkError = Color(0xFFCF6679);
  static const String materialName = 'Material default';
  static const String materialDescription =
      'Default Material color theme, used in the design guide';
  static const Color materialLightPrimary = Color(0xff6200ee);
  static const Color materialLightPrimaryContainer = Color(0xff3700b3);
  static const Color materialLightSecondary = Color(0xff03dac6);
  static const Color materialLightSecondaryContainer = Color(0xff018786);
  static const Color materialDarkPrimary = Color(0xffbb86fc);
  static const Color materialDarkPrimaryContainer = Color(0xff3700B3);
  static const Color materialDarkSecondary = Color(0xff03dac6);
  static const Color materialDarkSecondaryContainer = Color(0xff03dac6);

  static const AgnesSchemeData material = AgnesSchemeData(
    name: materialName,
    description: materialDescription,
    light: AgnesSchemeColor(
      primary: materialLightPrimary,
      primaryContainer: materialLightPrimaryContainer,
      secondary: materialLightSecondary,
      secondaryContainer: materialLightSecondaryContainer,
      appBarColor: materialLightSecondaryContainer,
      error: materialLightError,
    ),
    dark: AgnesSchemeColor(
      primary: materialDarkPrimary,
      primaryContainer: materialDarkPrimaryContainer,
      secondary: materialDarkSecondary,
      secondaryContainer: materialDarkSecondaryContainer,
      appBarColor: materialDarkSecondaryContainer,
      error: materialDarkError,
    ),
  );

  static const AgnesSchemeData agnesScheme = AgnesSchemeData(
    name: AgnesColors.name,
    description: AgnesColors.description,
    light: AgnesSchemeColor(
      primary: AgnesColors.lightPrimary,
      primaryContainer: AgnesColors.lightPrimaryContainer,
      secondary: AgnesColors.lightSecondary,
      secondaryContainer: AgnesColors.lightSecondaryContainer,
      appBarColor: AgnesColors.lightSecondaryContainer,
      error: AgnesColors.lightError,
    ),
    dark: AgnesSchemeColor(
      primary: AgnesColors.darkPrimary,
      primaryContainer: AgnesColors.darkPrimaryContainer,
      secondary: AgnesColors.darkSecondary,
      secondaryContainer: AgnesColors.darkSecondaryContainer,
      appBarColor: AgnesColors.darkSecondaryContainer,
      error: AgnesColors.darkError,
    ),
  );

  static const Map<AgnesScheme, AgnesSchemeData> schemes =
      <AgnesScheme, AgnesSchemeData>{
    AgnesScheme.material: material,
    AgnesScheme.agnes: agnesScheme,
  };

  static const List<AgnesSchemeData> schemesList = <AgnesSchemeData>[
    material,
    agnesScheme,
  ];
}

@immutable
class AgnesSchemeData with Diagnosticable {
  const AgnesSchemeData({
    required this.name,
    required this.description,
    required this.light,
    required this.dark,
  });

  final String name;

  final String description;

  final AgnesSchemeColor light;

  final AgnesSchemeColor dark;

  AgnesSchemeData copyWith({
    final String? name,
    final String? description,
    final AgnesSchemeColor? light,
    final AgnesSchemeColor? dark,
  }) {
    return AgnesSchemeData(
      name: name ?? this.name,
      description: description ?? this.description,
      light: light ?? this.light,
      dark: dark ?? this.dark,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is AgnesSchemeData &&
        other.name == name &&
        other.description == description &&
        other.light == light &&
        other.dark == dark;
  }

  @override
  int get hashCode {
    return hashValues(
      name,
      description,
      light,
      dark,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('name', name));
    properties.add(StringProperty('description', description));
    properties.add(DiagnosticsProperty<AgnesSchemeColor>('light', light));
    properties.add(DiagnosticsProperty<AgnesSchemeColor>('dark', dark));
  }
}

@immutable
class AgnesSchemeColor with Diagnosticable {
  const AgnesSchemeColor({
    required this.primary,
    required this.primaryContainer,
    required this.secondary,
    required this.secondaryContainer,
    this.appBarColor,
    this.error,
  });

  final Color primary;

  final Color primaryContainer;

  final Color secondary;

  final Color secondaryContainer;

  final Color? appBarColor;

  final Color? error;

  factory AgnesSchemeColor.from({
    required Color primary,
    Color? primaryContainer,
    Color? secondary,
    Color? secondaryContainer,
    Color? appBarColor,
    Color? error,
  }) {
    return AgnesSchemeColor(
      primary: primary,
      primaryContainer:
          primaryContainer ?? primary.darken(kDarkenPrimaryContainer),
      secondary: secondary ?? primary.darken(kDarkenSecondary),
      secondaryContainer: secondaryContainer ??
          secondary?.darken(kDarkenSecondaryContainerFromSecondary) ??
          primary.darken(kDarkenSecondaryContainer),
      appBarColor: appBarColor ??
          secondary?.darken(kDarkenSecondaryContainerFromSecondary) ??
          primary.darken(kDarkenSecondaryContainer),
      error: error,
    );
  }

  static AgnesSchemeColor effective(
      final AgnesSchemeColor colors, final int usedColors,
      {final bool swapColors = false}) {
    assert(usedColors >= 1 && usedColors <= 4, 'usedColors must be 1 to 4.');

    final AgnesSchemeColor effectiveColors = swapColors
        ? colors.copyWith(
            primary: colors.secondary,
            primaryContainer: colors.secondaryContainer,
            secondary: colors.primary,
            secondaryContainer: colors.primaryContainer,
          )
        : colors;

    return effectiveColors.copyWith(
      primary: effectiveColors.primary,
      primaryContainer: usedColors > 2
          ? effectiveColors.primaryContainer
          : effectiveColors.primary.darken(kDarkenPrimaryContainer),
      secondary: usedColors > 1
          ? effectiveColors.secondary
          : effectiveColors.primary.darken(kDarkenSecondary),
      secondaryContainer: usedColors > 3
          ? effectiveColors.secondaryContainer
          : usedColors > 1
              ? effectiveColors.secondary
                  .darken(kDarkenSecondaryContainerFromSecondary)
              : effectiveColors.primary.darken(kDarkenSecondaryContainer),
      appBarColor: colors.appBarColor,
      error: colors.error,
    );
  }

  AgnesSchemeColor toDark([final int whiteBlend = 35]) {
    return AgnesSchemeColor.from(
      primary: primary.blend(Colors.white, whiteBlend),
      primaryContainer: primaryContainer.blend(Colors.white, whiteBlend),
      secondary: secondary.blend(Colors.white, whiteBlend),
      secondaryContainer: secondaryContainer.blend(Colors.white, whiteBlend),
      appBarColor: appBarColor?.blend(Colors.white, whiteBlend),
      error: error?.blend(Colors.white, whiteBlend),
    );
  }

  AgnesSchemeColor get defaultError {
    return AgnesSchemeColor(
      primary: primary,
      primaryContainer: primaryContainer,
      secondary: secondary,
      secondaryContainer: secondaryContainer,
      appBarColor: appBarColor,
    );
  }

  AgnesSchemeColor copyWith({
    final Color? primary,
    final Color? primaryContainer,
    final Color? secondary,
    final Color? secondaryContainer,
    final Color? appBarColor,
    final Color? error,
  }) {
    return AgnesSchemeColor(
      primary: primary ?? this.primary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      secondary: secondary ?? this.secondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      appBarColor: appBarColor ?? this.appBarColor,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is AgnesSchemeColor &&
        other.primary == primary &&
        other.primaryContainer == primaryContainer &&
        other.secondary == secondary &&
        other.secondaryContainer == secondaryContainer &&
        other.appBarColor == appBarColor &&
        other.error == error;
  }

  @override
  int get hashCode {
    return hashValues(
      primary,
      primaryContainer,
      secondary,
      secondaryContainer,
      appBarColor,
      error.hashCode,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('primary', primary));
    properties.add(ColorProperty('primaryContainer', primaryContainer));
    properties.add(ColorProperty('secondary', secondary));
    properties.add(ColorProperty('secondaryContainer', secondaryContainer));
    properties.add(ColorProperty('appBarColor', appBarColor));
    properties.add(ColorProperty('error', error));
  }
}
