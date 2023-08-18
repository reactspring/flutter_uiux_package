// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

enum AgnesInputBorderType {
  outline,

  underline,
}

enum SchemeColor {
  primary,

  onPrimary,

  primaryContainer,

  secondary,

  onSecondary,

  secondaryContainer,

  surface,

  onSurface,

  background,

  onBackground,

  error,

  onError,
}

class AgnesSubThemes {
  AgnesSubThemes._();

  static Color schemeColor(SchemeColor value, ColorScheme colorScheme) {
    switch (value) {
      case SchemeColor.primary:
        return colorScheme.primary;
      case SchemeColor.onPrimary:
        return colorScheme.onPrimary;
      case SchemeColor.primaryContainer:
        return colorScheme.primaryContainer;
      case SchemeColor.secondary:
        return colorScheme.secondary;
      case SchemeColor.onSecondary:
        return colorScheme.onSecondary;
      case SchemeColor.secondaryContainer:
        return colorScheme.secondaryContainer;
      case SchemeColor.surface:
        return colorScheme.surface;
      case SchemeColor.onSurface:
        return colorScheme.onSurface;
      case SchemeColor.background:
        return colorScheme.background;
      case SchemeColor.onBackground:
        return colorScheme.onBackground;
      case SchemeColor.error:
        return colorScheme.error;
      case SchemeColor.onError:
        return colorScheme.onError;
    }
  }

  static Color schemeColorPair(SchemeColor value, ColorScheme colorScheme) {
    switch (value) {
      case SchemeColor.primary:
        return colorScheme.onPrimary;
      case SchemeColor.onPrimary:
        return colorScheme.primary;

      case SchemeColor.primaryContainer:
        return colorScheme.onPrimary;
      case SchemeColor.secondary:
        return colorScheme.onSecondary;
      case SchemeColor.onSecondary:
        return colorScheme.secondary;

      case SchemeColor.secondaryContainer:
        return colorScheme.onSecondary;
      case SchemeColor.surface:
        return colorScheme.onSurface;
      case SchemeColor.onSurface:
        return colorScheme.surface;
      case SchemeColor.background:
        return colorScheme.onBackground;
      case SchemeColor.onBackground:
        return colorScheme.background;
      case SchemeColor.error:
        return colorScheme.onError;
      case SchemeColor.onError:
        return colorScheme.error;
    }
  }

  static TextButtonThemeData textButtonTheme({
    required final ColorScheme colorScheme,
    final double? radius,
    final EdgeInsetsGeometry? padding,
    final Size minButtonSize = kButtonMinSize,
  }) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: minButtonSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? kButtonRadius),
            ),
          ),
          padding: padding,
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledForegroundAlpha);
              }
              return colorScheme.primary;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.primary.withAlpha(kHoverBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary.withAlpha(kFocusBackgroundAlpha);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.primary.withAlpha(kPressedBackgroundAlpha);
              }
              return Colors.transparent;
            },
          ),
        ),
      );

  static ElevatedButtonThemeData elevatedButtonTheme({
    required final ColorScheme colorScheme,
    final double? radius,
    final double elevation = kElevatedButtonElevation,
    final EdgeInsetsGeometry? padding,
    final Size minButtonSize = kButtonMinSize,
  }) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: minButtonSize,
          padding: padding,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? kButtonRadius),
            ),
          ),
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledForegroundAlpha);
              }
              return colorScheme.onPrimary;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha);
              }
              return colorScheme.primary;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.onPrimary.withAlpha(kHoverBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.onPrimary.withAlpha(kFocusBackgroundAlpha);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.onPrimary.withAlpha(kPressedBackgroundAlpha);
              }
              return Colors.transparent;
            },
          ),
        ),
      );

  static OutlinedButtonThemeData outlinedButtonTheme({
    required final ColorScheme colorScheme,
    final double? radius,
    final double pressedOutlineWidth = kThickBorderWidth,
    final double outlineWidth = kThinBorderWidth,
    final EdgeInsetsGeometry? padding,
    final Size minButtonSize = kButtonMinSize,
  }) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: minButtonSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? kButtonRadius),
            ),
          ),
          padding: padding,
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledForegroundAlpha);
              }
              return colorScheme.primary;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.primary.withAlpha(kHoverBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary.withAlpha(kFocusBackgroundAlpha);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.primary.withAlpha(kPressedBackgroundAlpha);
              }
              return Colors.transparent;
            },
          ),
          side: MaterialStateProperty.resolveWith<BorderSide?>(
            (final Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                  width: outlineWidth,
                );
              }
              if (states.contains(MaterialState.error)) {
                return BorderSide(
                  color: colorScheme.error,
                  width: pressedOutlineWidth,
                );
              }
              if (states.contains(MaterialState.pressed)) {
                return BorderSide(
                  color: colorScheme.primary,
                  width: pressedOutlineWidth,
                );
              }
              return BorderSide(
                color: colorScheme.primary.withAlpha(kEnabledBorderAlpha),
                width: outlineWidth,
              );
            },
          ),
        ),
      );

  static ButtonThemeData buttonTheme({
    required final ColorScheme colorScheme,
    final double? radius,
    final EdgeInsetsGeometry padding = kButtonPadding,
    final Size minButtonSize = kButtonMinSize,
  }) =>
      ButtonThemeData(
        colorScheme: colorScheme,
        minWidth: minButtonSize.width,
        height: minButtonSize.height,
        padding: padding,
        layoutBehavior: ButtonBarLayoutBehavior.constrained,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        hoverColor: colorScheme.primary
            .blendAlpha(Colors.white, kHoverAlphaBlend)
            .withAlpha(kHoverAlpha),
        focusColor: colorScheme.primary
            .blendAlpha(Colors.white, kFocusAlphaBlend)
            .withAlpha(kFocusAlpha),
        highlightColor: colorScheme.primary
            .blendAlpha(Colors.white, kHighlightAlphaBlend)
            .withAlpha(kHighlightAlpha),
        splashColor: colorScheme.primary
            .blendAlpha(Colors.white, kSplashAlphaBlend)
            .withAlpha(kSplashAlpha),
        disabledColor: colorScheme.primary
            .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
            .withAlpha(kDisabledBackgroundAlpha),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kButtonRadius),
          ),
        ),
        textTheme: ButtonTextTheme.primary,
      );

  static ToggleButtonsThemeData toggleButtonsTheme({
    required final ColorScheme colorScheme,
    final double? radius,
    final double borderWidth = kThinBorderWidth,
    final Size minButtonSize = kButtonMinSize,
    final VisualDensity? visualDensity,
  }) {
    final VisualDensity _visualDensity =
        visualDensity ?? VisualDensity.adaptivePlatformDensity;
    return ToggleButtonsThemeData(
      borderWidth: borderWidth,
      selectedColor: colorScheme.onPrimary.withAlpha(kSelectedAlpha),
      color: colorScheme.primary,
      fillColor:
          colorScheme.primary.blendAlpha(Colors.white, kAltPrimaryAlphaBlend),
      borderColor: colorScheme.primary.withAlpha(kEnabledBorderAlpha),
      selectedBorderColor:
          colorScheme.primary.blendAlpha(Colors.white, kAltPrimaryAlphaBlend),
      hoverColor: colorScheme.primary
          .blendAlpha(Colors.white, kHoverAlphaBlend + kAltPrimaryAlphaBlend)
          .withAlpha(kHoverAlpha),
      focusColor: colorScheme.primary
          .blendAlpha(Colors.white, kFocusAlphaBlend + kAltPrimaryAlphaBlend)
          .withAlpha(kFocusAlpha),
      highlightColor: colorScheme.primary
          .blendAlpha(
              Colors.white, kHighlightAlphaBlend + kAltPrimaryAlphaBlend)
          .withAlpha(kHighlightAlpha),
      splashColor: colorScheme.primary
          .blendAlpha(Colors.white, kSplashAlphaBlend + kAltPrimaryAlphaBlend)
          .withAlpha(kSplashAlpha),
      disabledColor: colorScheme.primary
          .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
          .withAlpha(kDisabledForegroundAlpha),
      disabledBorderColor: colorScheme.primary
          .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
          .withAlpha(kDisabledBackgroundAlpha),
      borderRadius: BorderRadius.circular(radius ?? kButtonRadius),
      constraints: BoxConstraints(
        minWidth: minButtonSize.width -
            borderWidth * 2 +
            _visualDensity.baseSizeAdjustment.dx,
        minHeight: minButtonSize.height -
            borderWidth * 2 +
            _visualDensity.baseSizeAdjustment.dy,
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme({
    required final ColorScheme colorScheme,
    final SchemeColor? baseSchemeColor,
    final double? radius,
    final AgnesInputBorderType borderType = AgnesInputBorderType.outline,
    final bool filled = true,
    final Color? fillColor,
    final double focusedBorderWidth = kThickBorderWidth,
    final double unfocusedBorderWidth = kThinBorderWidth,
    final double gapPadding = 4,
    final bool unfocusedHasBorder = true,
  }) {
    final Color _baseColor = baseSchemeColor == null
        ? colorScheme.primary
        : schemeColor(baseSchemeColor, colorScheme);

    final Color _fillColor = fillColor ??
        (colorScheme.brightness == Brightness.dark
            ? _baseColor.withAlpha(kFillColorAlphaDark)
            : _baseColor.withAlpha(kFillColorAlphaLight));

    switch (borderType) {
      case AgnesInputBorderType.outline:
        return InputDecorationTheme(
          filled: filled,
          fillColor: _fillColor,
          hoverColor: _baseColor.withAlpha(kHoverBackgroundAlpha),
          focusColor: _baseColor.withAlpha(kFocusBackgroundAlpha),
          focusedBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: BorderSide(
              color: _baseColor,
              width: focusedBorderWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: unfocusedHasBorder
                ? BorderSide(
                    color: _baseColor.withAlpha(kEnabledBorderAlpha),
                    width: unfocusedBorderWidth,
                  )
                : BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: unfocusedHasBorder
                ? BorderSide(
                    color: _baseColor
                        .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                        .withAlpha(kDisabledBackgroundAlpha),
                    width: unfocusedBorderWidth,
                  )
                : BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: BorderSide(
              color: colorScheme.error,
              width: focusedBorderWidth,
            ),
          ),
          errorBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: BorderSide(
              color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
              width: unfocusedBorderWidth,
            ),
          ),
        );
      case AgnesInputBorderType.underline:
        return InputDecorationTheme(
          filled: filled,
          fillColor: _fillColor,
          hoverColor: _baseColor.withAlpha(kHoverBackgroundAlpha),
          focusColor: _baseColor.withAlpha(kFocusBackgroundAlpha),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? kButtonRadius),
              topRight: Radius.circular(radius ?? kButtonRadius),
            ),
            borderSide: BorderSide(
              color: _baseColor,
              width: focusedBorderWidth,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? kButtonRadius),
              topRight: Radius.circular(radius ?? kButtonRadius),
            ),
            borderSide: unfocusedHasBorder
                ? BorderSide(
                    color: _baseColor.withAlpha(kEnabledBorderAlpha),
                    width: unfocusedBorderWidth,
                  )
                : BorderSide.none,
          ),
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? kButtonRadius),
              topRight: Radius.circular(radius ?? kButtonRadius),
            ),
            borderSide: unfocusedHasBorder
                ? BorderSide(
                    color: _baseColor
                        .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                        .withAlpha(kDisabledBackgroundAlpha),
                    width: unfocusedBorderWidth,
                  )
                : BorderSide.none,
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? kButtonRadius),
              topRight: Radius.circular(radius ?? kButtonRadius),
            ),
            borderSide: BorderSide(
              color: colorScheme.error,
              width: focusedBorderWidth,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? kButtonRadius),
              topRight: Radius.circular(radius ?? kButtonRadius),
            ),
            borderSide: BorderSide(
              color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
              width: unfocusedBorderWidth,
            ),
          ),
        );
    }
  }

  static FloatingActionButtonThemeData floatingActionButtonTheme({
    final double? radius,
    final bool useShape = true,
  }) =>
      FloatingActionButtonThemeData(
        splashColor: Color(0XFF8f0028),
        shape: useShape
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius ?? kDefaultRadius),
                ),
              )
            : null,
      );

  static ChipThemeData chipTheme({
    required final ColorScheme colorScheme,
    final SchemeColor? baseSchemeColor,
    required TextStyle labelStyle,
    final double? radius,
  }) {
    final Color _baseColor = baseSchemeColor == null
        ? colorScheme.primary
        : schemeColor(baseSchemeColor, colorScheme);

    final Color foreground =
        _baseColor.blendAlpha(colorScheme.onSurface, kChipForegroundAlphaBlend);

    final Color selectedBackgroundColor = _baseColor.blendAlpha(
        colorScheme.surface, kChipSelectedBackgroundAlphaBlend);

    final TextStyle effectiveLabelStyle =
        labelStyle.copyWith(color: foreground);

    return ChipThemeData(
      brightness: ThemeData.estimateBrightnessForColor(colorScheme.primary),
      padding: const EdgeInsets.all(4),
      backgroundColor:
          _baseColor.blendAlpha(colorScheme.surface, kChipBackgroundAlphaBlend),
      selectedColor: selectedBackgroundColor,
      secondarySelectedColor: selectedBackgroundColor,
      checkmarkColor: foreground,
      deleteIconColor: _baseColor,
      disabledColor: _baseColor
          .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
          .withAlpha(kDisabledBackgroundAlpha),
      labelStyle: effectiveLabelStyle,
      secondaryLabelStyle: effectiveLabelStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? kChipRadius),
        ),
      ),
    );
  }

  static CardTheme cardTheme({
    final double? radius,
    final double elevation = kCardElevation,
    final Clip clipBehavior = Clip.antiAlias,
  }) =>
      CardTheme(
        clipBehavior: clipBehavior,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kCardRadius),
          ),
        ),
      );

  static PopupMenuThemeData popupMenuTheme({
    final double? radius,
    final double elevation = kPopupMenuElevation,
    final Color? color,
  }) =>
      PopupMenuThemeData(
        elevation: elevation,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kPopupRadius),
          ),
        ),
      );

  static DialogTheme dialogTheme({
    final double? radius,
    final double? elevation = kDialogElevation,
    final Color? backgroundColor,
  }) =>
      DialogTheme(
        elevation: elevation,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kDialogRadius),
          ),
        ),
      );

  static TimePickerThemeData timePickerTheme({
    final Color? backgroundColor,
    final double? radius,
    final double? elementRadius,
    final InputDecorationTheme? inputDecorationTheme,
  }) =>
      TimePickerThemeData(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kDialogRadius),
          ),
        ),
        hourMinuteShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(elementRadius ?? kCardRadius),
          ),
        ),
        dayPeriodShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(elementRadius ?? kCardRadius),
          ),
        ),
        inputDecorationTheme: inputDecorationTheme?.copyWith(
              contentPadding: EdgeInsets.zero,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ) ??
            const InputDecorationTheme().copyWith(
              contentPadding: EdgeInsets.zero,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ),
      );

  static SnackBarThemeData snackBarTheme({
    final double? elevation = kSnackBarElevation,
    final Color? backgroundColor,
  }) =>
      SnackBarThemeData(
        elevation: elevation,
        backgroundColor: backgroundColor,
      );

  static BottomSheetThemeData bottomSheetTheme({
    final double? radius,
    final double elevation = kBottomSheetElevation,
    final double modalElevation = kBottomSheetModalElevation,
    final Clip clipBehavior = Clip.antiAlias,
  }) =>
      BottomSheetThemeData(
        clipBehavior: clipBehavior,
        elevation: elevation,
        modalElevation: modalElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius ?? kDefaultRadius),
            topRight: Radius.circular(radius ?? kDefaultRadius),
          ),
        ),
      );

  static BottomNavigationBarThemeData bottomNavigationBar({
    required final ColorScheme colorScheme,
    final SchemeColor? baseSchemeColor,
    final SchemeColor? backgroundSchemeColor,
    final double elevation = kBottomNavigationBarElevation,
    final double opacity = 1,
    final int unselectedAlphaBlend = 0x00,
    final int unselectedAlpha = 0xFF,
    final BottomNavigationBarLandscapeLayout landscapeLayout =
        BottomNavigationBarLandscapeLayout.spread,
  }) {
    final Color _baseColor = baseSchemeColor == null
        ? colorScheme.primary
        : schemeColor(baseSchemeColor, colorScheme);

    final Color _backgroundColor = backgroundSchemeColor == null
        ? colorScheme.background
        : schemeColor(backgroundSchemeColor, colorScheme);

    final Color _backgroundOnColor = schemeColorPair(
        backgroundSchemeColor ?? SchemeColor.background, colorScheme);
    return BottomNavigationBarThemeData(
      elevation: elevation,
      backgroundColor: _backgroundColor.withOpacity(opacity),
      landscapeLayout: landscapeLayout,
      selectedItemColor: _baseColor,
      selectedIconTheme: IconThemeData(
        color: _baseColor,
      ),
      unselectedItemColor: _backgroundOnColor
          .blendAlpha(_baseColor, unselectedAlphaBlend)
          .withAlpha(unselectedAlpha),
      unselectedIconTheme: IconThemeData(
        color: _backgroundOnColor
            .blendAlpha(_baseColor, unselectedAlphaBlend)
            .withAlpha(unselectedAlpha),
      ),
    );
  }

  static NavigationBarThemeData navigationBarTheme({
    required final ColorScheme colorScheme,
    final TextStyle? labelTextStyle,
    final double? selectedLabelSize,
    final double? unselectedLabelSize,
    final SchemeColor? textSchemeColor,
    final bool mutedUnselectedText = false,
    final double? selectedIconSize,
    final double? unselectedIconSize,
    final SchemeColor? iconSchemeColor,
    final bool mutedUnselectedIcon = false,
    final SchemeColor? highlightSchemeColor,
    final int indicatorAlpha = kNavigationBarIndicatorAlpha,
    final SchemeColor? backgroundSchemeColor,
    final double opacity = 1,
    final double? height,
    final NavigationDestinationLabelBehavior? labelBehavior,
    final int unselectedAlphaBlend = 0x00,
    final int unselectedAlpha = 0xFF,
  }) {
    final Color _textColor = textSchemeColor == null
        ? colorScheme.onSurface
        : schemeColor(textSchemeColor, colorScheme);

    final TextStyle _textStyle =
        labelTextStyle ?? AgnesColorScheme.m3TextTheme.overline!;

    final double _selectedLabelSize =
        selectedLabelSize ?? _textStyle.fontSize ?? 11;
    final double _unselectedLabelSize =
        unselectedLabelSize ?? _textStyle.fontSize ?? 11;

    final bool _useTextStyle = labelTextStyle != null ||
        selectedLabelSize != null ||
        unselectedLabelSize != null ||
        textSchemeColor != null;

    final Color _iconColor = iconSchemeColor == null
        ? colorScheme.onSurface
        : schemeColor(iconSchemeColor, colorScheme);

    final bool _useIconTheme = selectedIconSize != null ||
        unselectedIconSize != null ||
        iconSchemeColor != null;

    return NavigationBarThemeData(
      height: height,
      labelBehavior: labelBehavior,
      backgroundColor: backgroundSchemeColor != null
          ? schemeColor(backgroundSchemeColor, colorScheme).withOpacity(opacity)
          : null,
      indicatorColor: highlightSchemeColor != null
          ? schemeColor(highlightSchemeColor, colorScheme)
              .withAlpha(indicatorAlpha)
          : null,
      labelTextStyle: _useTextStyle
          ? MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return _textStyle.copyWith(
                    fontSize: _selectedLabelSize,
                    color: _textColor,
                  );
                }
                return _textStyle.copyWith(
                  fontSize: _unselectedLabelSize,
                  color: mutedUnselectedText
                      ? _textColor
                          .blendAlpha(_textColor, unselectedAlphaBlend)
                          .withAlpha(unselectedAlpha)
                      : _textColor,
                );
              },
            )
          : null,
      iconTheme: _useIconTheme
          ? MaterialStateProperty.resolveWith<IconThemeData>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return IconThemeData(
                    size: selectedIconSize ?? 24,
                    color: _iconColor,
                  );
                }
                return IconThemeData(
                  size: unselectedIconSize ?? 24,
                  color: mutedUnselectedIcon
                      ? _iconColor
                          .blendAlpha(_iconColor, unselectedAlphaBlend)
                          .withAlpha(unselectedAlpha)
                      : _iconColor,
                );
              },
            )
          : null,
    );
  }
}
