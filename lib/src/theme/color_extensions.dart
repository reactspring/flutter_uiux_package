import 'dart:math' as math;

import 'package:flutter/material.dart';

extension AgnesColorExtensions on Color {
  Color brighten([final int amount = 10]) {
    if (amount <= 0) return this;
    if (amount > 100) return Colors.white;
    final Color color = Color.fromARGB(
      alpha,
      math.max(0, math.min(255, red - (255 * -(amount / 100)).round())),
      math.max(0, math.min(255, green - (255 * -(amount / 100)).round())),
      math.max(0, math.min(255, blue - (255 * -(amount / 100)).round())),
    );
    return color;
  }

  Color lighten([final int amount = 10]) {
    if (amount <= 0) return this;
    if (amount > 100) return Colors.white;
    final HSLColor hsl = this == const Color(0xFF000000)
        ? HSLColor.fromColor(this).withSaturation(0)
        : HSLColor.fromColor(this);
    return hsl
        .withLightness(math.min(1, math.max(0, hsl.lightness + amount / 100)))
        .toColor();
  }

  Color darken([final int amount = 10]) {
    if (amount <= 0) return this;
    if (amount > 100) return Colors.black;
    final HSLColor hsl = HSLColor.fromColor(this);
    return hsl
        .withLightness(math.min(1, math.max(0, hsl.lightness - amount / 100)))
        .toColor();
  }

  Color get onColor =>
      ThemeData.estimateBrightnessForColor(this) == Brightness.light
          ? Colors.black
          : Colors.white;
  bool get isLight =>
      ThemeData.estimateBrightnessForColor(this) == Brightness.light;
  bool get isDark =>
      ThemeData.estimateBrightnessForColor(this) == Brightness.dark;
  Color blend(final Color input, [final int amount = 10]) {
    if (amount <= 0) return this;
    if (amount >= 100) return input;
    return Color.alphaBlend(input.withAlpha(255 * amount ~/ 100), this);
  }

  Color blendAlpha(final Color input, [final int alpha = 0x0A]) {
    if (alpha <= 0) return this;
    if (alpha >= 255) return input;
    return Color.alphaBlend(input.withAlpha(alpha), this);
  }

  Color getShadeColor({
    final int shadeValue = 15,
    final bool lighten = true,
    final bool keepBlack = true,
    final bool keepWhite = true,
  }) {
    if (shadeValue <= 0) return this;
    int _shadeValue = shadeValue;
    if (_shadeValue > 100) _shadeValue = 100;
    if (this == Colors.black && !lighten) return this;
    if (this == Colors.black && keepBlack) return this;
    if (this == Colors.black) return this.lighten(_shadeValue);
    if (this == Colors.white && lighten) return this;
    if (this == Colors.white && keepWhite) return this;
    if (this == Colors.white) return darken(_shadeValue);
    if (lighten) {
      return this.lighten(_shadeValue);
    } else {
      return darken(_shadeValue);
    }
  }

  String get hexCode {
    return value.toRadixString(16).toUpperCase().padLeft(8, '0');
  }

  String get hex {
    // ignore: lines_longer_than_80_chars
    return '#${value.toRadixString(16).toUpperCase().padLeft(8, '0').substring(2)}';
  }
}

extension AgnesStringExtensions on String {
  Color get toColor {
    if (this == '') return const Color(0xFF000000);
    String hexColor = replaceAll('#', '');
    hexColor = hexColor.replaceAll('0x', '');
    hexColor = hexColor.padLeft(6, '0');
    hexColor = hexColor.padLeft(8, 'F');
    final int length = hexColor.length;
    return Color(int.tryParse('0x${hexColor.substring(length - 8, length)}') ??
        0xFF000000);
  }

  String get capitalize {
    return (length > 1) ? this[0].toUpperCase() + substring(1) : toUpperCase();
  }

  String get dotTail {
    return split('.').last;
  }
}
