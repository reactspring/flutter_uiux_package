// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uiux_package/flutter_uiux_package.dart';

@immutable
class AgnesSubThemesData with Diagnosticable {
  const AgnesSubThemesData({
    this.interactionEffects = true,
    this.blendOnColors = true,
    this.blendTextTheme = true,
    this.useTextTheme = true,
    this.defaultRadius,
    this.buttonMinSize = kButtonMinSize,
    this.buttonPadding = kButtonPadding,
    this.thickBorderWidth = kThickBorderWidth,
    this.thinBorderWidth = kThinBorderWidth,
    this.textButtonRadius,
    this.elevatedButtonRadius,
    this.elevatedButtonElevation = kElevatedButtonElevation,
    this.outlinedButtonRadius,
    this.toggleButtonsRadius,
    this.inputDecorationRadius,
    this.inputDecoratorSchemeColor,
    this.inputDecoratorIsFilled = true,
    this.inputDecoratorFillColor,
    this.inputDecoratorBorderType = AgnesInputBorderType.outline,
    this.inputDecoratorUnfocusedHasBorder = true,
    this.chipRadius,
    this.chipSchemeColor,
    this.fabRadius,
    this.fabUseShape = true,
    this.cardRadius,
    this.cardElevation = kCardElevation,
    this.popupMenuRadius,
    this.popupMenuElevation = kPopupMenuElevation,
    this.popupMenuOpacity = 1,
    this.dialogRadius,
    this.dialogElevation = kDialogElevation,
    this.timePickerDialogRadius,
    this.snackBarElevation = kSnackBarElevation,
    this.tabBarIndicatorSchemeColor,
    this.bottomSheetRadius,
    this.bottomSheetElevation = kBottomSheetElevation,
    this.bottomSheetModalElevation = kBottomSheetModalElevation,
    this.bottomNavigationBarElevation = kBottomNavigationBarElevation,
    this.bottomNavigationBarOpacity = 1,
    this.bottomNavigationBarSchemeColor,
    this.bottomNavigationBarBackgroundSchemeColor,
    this.bottomNavigationBarLandscapeLayout,
    this.navigationBarIsStyled = true,
    this.navigationBarHeight,
    this.navigationBarOpacity = 1,
    this.navigationBarIconSchemeColor,
    this.navigationBarTextSchemeColor,
    this.navigationBarHighlightSchemeColor,
    this.navigationBarBackgroundSchemeColor,
    this.navigationBarMutedUnselectedIcon,
    this.navigationBarMutedUnselectedText,
    this.navigationBarSelectedLabelSize,
    this.navigationBarUnselectedLabelSize,
    this.navigationBarSelectedIconSize,
    this.navigationBarUnselectedIconSize,
    this.navigationBarLabelBehavior,
  });

  final bool interactionEffects;

  final bool blendOnColors;

  final bool blendTextTheme;

  final bool useTextTheme;

  final double? defaultRadius;

  final Size buttonMinSize;

  final EdgeInsetsGeometry buttonPadding;

  final double thickBorderWidth;

  final double thinBorderWidth;

  final double? textButtonRadius;

  final double? elevatedButtonRadius;

  final double elevatedButtonElevation;

  final double? outlinedButtonRadius;

  final double? toggleButtonsRadius;

  final double? inputDecorationRadius;

  final SchemeColor? inputDecoratorSchemeColor;

  final bool inputDecoratorIsFilled;

  final Color? inputDecoratorFillColor;

  final AgnesInputBorderType inputDecoratorBorderType;

  final bool inputDecoratorUnfocusedHasBorder;

  final double? fabRadius;

  final bool fabUseShape;

  final double? chipRadius;

  final SchemeColor? chipSchemeColor;

  final double? cardRadius;

  final double cardElevation;

  final double? popupMenuRadius;

  final double popupMenuElevation;

  final double? popupMenuOpacity;

  final double? dialogRadius;

  final double dialogElevation;

  final double? timePickerDialogRadius;

  final double snackBarElevation;

  final SchemeColor? tabBarIndicatorSchemeColor;

  final double? bottomSheetRadius;

  final double bottomSheetElevation;

  final double bottomSheetModalElevation;

  final double bottomNavigationBarElevation;

  final double bottomNavigationBarOpacity;

  final SchemeColor? bottomNavigationBarSchemeColor;

  final SchemeColor? bottomNavigationBarBackgroundSchemeColor;

  final BottomNavigationBarLandscapeLayout? bottomNavigationBarLandscapeLayout;

  final bool navigationBarIsStyled;

  final double? navigationBarHeight;

  final double navigationBarOpacity;

  final SchemeColor? navigationBarIconSchemeColor;

  final SchemeColor? navigationBarTextSchemeColor;

  final SchemeColor? navigationBarHighlightSchemeColor;

  final SchemeColor? navigationBarBackgroundSchemeColor;

  final bool? navigationBarMutedUnselectedIcon;

  final bool? navigationBarMutedUnselectedText;
  final double? navigationBarSelectedLabelSize;

  final double? navigationBarUnselectedLabelSize;

  final double? navigationBarSelectedIconSize;

  final double? navigationBarUnselectedIconSize;

  final NavigationDestinationLabelBehavior? navigationBarLabelBehavior;

  AgnesSubThemesData copyWith({
    final bool? interactionEffects,
    final bool? blendOnColors,
    final bool? blendTextTheme,
    final bool? useTextTheme,
    final double? defaultRadius,
    final Size? buttonMinSize,
    final EdgeInsetsGeometry? buttonPadding,
    final double? thickBorderWidth,
    final double? thinBorderWidth,
    final double? textButtonRadius,
    final double? elevatedButtonRadius,
    final double? elevatedButtonElevation,
    final double? outlinedButtonRadius,
    final double? toggleButtonsRadius,
    final double? inputDecorationRadius,
    final SchemeColor? inputDecoratorSchemeColor,
    final bool? inputDecoratorIsFilled,
    final Color? inputDecoratorFillColor,
    final AgnesInputBorderType? inputDecoratorBorderType,
    final bool? inputDecoratorUnfocusedHasBorder,
    final double? fabRadius,
    final bool? fabUseShape,
    final double? chipRadius,
    final SchemeColor? chipSchemeColor,
    final double? cardRadius,
    final double? cardElevation,
    final double? popupMenuRadius,
    final double? popupMenuElevation,
    final double? popupMenuOpacity,
    final double? dialogElevation,
    final double? dialogRadius,
    final double? timePickerDialogRadius,
    final double? snackBarElevation,
    final SchemeColor? tabBarIndicatorSchemeColor,
    final double? bottomSheetRadius,
    final double? bottomSheetElevation,
    final double? bottomSheetModalElevation,
    final double? bottomNavigationBarElevation,
    final double? bottomNavigationBarOpacity,
    final SchemeColor? bottomNavigationBarSchemeColor,
    final SchemeColor? bottomNavigationBarBackgroundSchemeColor,
    final BottomNavigationBarLandscapeLayout?
        bottomNavigationBarLandscapeLayout,
    final bool? navigationBarIsStyled,
    final double? navigationBarHeight,
    final double? navigationBarOpacity,
    final SchemeColor? navigationBarIconSchemeColor,
    final SchemeColor? navigationBarTextSchemeColor,
    final SchemeColor? navigationBarHighlightSchemeColor,
    final SchemeColor? navigationBarBackgroundSchemeColor,
    final bool? navigationBarMutedUnselectedIcon,
    final bool? navigationBarMutedUnselectedText,
    final double? navigationBarSelectedLabelSize,
    final double? navigationBarUnselectedLabelSize,
    final double? navigationBarSelectedIconSize,
    final double? navigationBarUnselectedIconSize,
    final NavigationDestinationLabelBehavior? navigationBarLabelBehavior,
  }) {
    return AgnesSubThemesData(
      interactionEffects: interactionEffects ?? this.interactionEffects,
      blendOnColors: blendOnColors ?? this.blendOnColors,
      blendTextTheme: blendTextTheme ?? this.blendTextTheme,
      useTextTheme: useTextTheme ?? this.useTextTheme,
      defaultRadius: defaultRadius ?? this.defaultRadius,
      buttonMinSize: buttonMinSize ?? this.buttonMinSize,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      thickBorderWidth: thickBorderWidth ?? this.thickBorderWidth,
      thinBorderWidth: thinBorderWidth ?? this.thinBorderWidth,
      textButtonRadius: textButtonRadius ?? this.textButtonRadius,
      elevatedButtonRadius: elevatedButtonRadius ?? this.elevatedButtonRadius,
      elevatedButtonElevation:
          elevatedButtonElevation ?? this.elevatedButtonElevation,
      outlinedButtonRadius: outlinedButtonRadius ?? this.outlinedButtonRadius,
      toggleButtonsRadius: toggleButtonsRadius ?? this.toggleButtonsRadius,
      inputDecorationRadius:
          inputDecorationRadius ?? this.inputDecorationRadius,
      inputDecoratorSchemeColor:
          inputDecoratorSchemeColor ?? this.inputDecoratorSchemeColor,
      inputDecoratorIsFilled:
          inputDecoratorIsFilled ?? this.inputDecoratorIsFilled,
      inputDecoratorFillColor:
          inputDecoratorFillColor ?? this.inputDecoratorFillColor,
      inputDecoratorBorderType:
          inputDecoratorBorderType ?? this.inputDecoratorBorderType,
      inputDecoratorUnfocusedHasBorder: inputDecoratorUnfocusedHasBorder ??
          this.inputDecoratorUnfocusedHasBorder,
      fabRadius: fabRadius ?? this.fabRadius,
      fabUseShape: fabUseShape ?? this.fabUseShape,
      chipRadius: chipRadius ?? this.chipRadius,
      chipSchemeColor: chipSchemeColor ?? this.chipSchemeColor,
      cardRadius: cardRadius ?? this.cardRadius,
      cardElevation: cardElevation ?? this.cardElevation,
      dialogRadius: dialogRadius ?? this.dialogRadius,
      dialogElevation: dialogElevation ?? this.dialogElevation,
      popupMenuRadius: popupMenuRadius ?? this.popupMenuRadius,
      popupMenuElevation: popupMenuElevation ?? this.popupMenuElevation,
      popupMenuOpacity: popupMenuOpacity ?? this.popupMenuOpacity,
      timePickerDialogRadius:
          timePickerDialogRadius ?? this.timePickerDialogRadius,
      snackBarElevation: snackBarElevation ?? this.snackBarElevation,
      tabBarIndicatorSchemeColor:
          tabBarIndicatorSchemeColor ?? this.tabBarIndicatorSchemeColor,
      bottomSheetRadius: bottomSheetRadius ?? this.bottomSheetRadius,
      bottomSheetElevation: bottomSheetElevation ?? this.bottomSheetElevation,
      bottomSheetModalElevation:
          bottomSheetModalElevation ?? this.bottomSheetModalElevation,
      bottomNavigationBarElevation:
          bottomNavigationBarElevation ?? this.bottomNavigationBarElevation,
      bottomNavigationBarOpacity:
          bottomNavigationBarOpacity ?? this.bottomNavigationBarOpacity,
      bottomNavigationBarSchemeColor:
          bottomNavigationBarSchemeColor ?? this.bottomNavigationBarSchemeColor,
      bottomNavigationBarBackgroundSchemeColor:
          bottomNavigationBarBackgroundSchemeColor ??
              this.bottomNavigationBarBackgroundSchemeColor,
      bottomNavigationBarLandscapeLayout: bottomNavigationBarLandscapeLayout ??
          this.bottomNavigationBarLandscapeLayout,
      navigationBarIsStyled:
          navigationBarIsStyled ?? this.navigationBarIsStyled,
      navigationBarHeight: navigationBarHeight ?? this.navigationBarHeight,
      navigationBarOpacity: navigationBarOpacity ?? this.navigationBarOpacity,
      navigationBarIconSchemeColor:
          navigationBarIconSchemeColor ?? this.navigationBarIconSchemeColor,
      navigationBarTextSchemeColor:
          navigationBarTextSchemeColor ?? this.navigationBarTextSchemeColor,
      navigationBarHighlightSchemeColor: navigationBarHighlightSchemeColor ??
          this.navigationBarHighlightSchemeColor,
      navigationBarBackgroundSchemeColor: navigationBarBackgroundSchemeColor ??
          this.navigationBarBackgroundSchemeColor,
      navigationBarMutedUnselectedIcon: navigationBarMutedUnselectedIcon ??
          this.navigationBarMutedUnselectedIcon,
      navigationBarMutedUnselectedText: navigationBarMutedUnselectedText ??
          this.navigationBarMutedUnselectedText,
      navigationBarSelectedLabelSize:
          navigationBarSelectedLabelSize ?? this.navigationBarSelectedLabelSize,
      navigationBarUnselectedLabelSize: navigationBarUnselectedLabelSize ??
          this.navigationBarUnselectedLabelSize,
      navigationBarSelectedIconSize:
          navigationBarSelectedIconSize ?? this.navigationBarSelectedIconSize,
      navigationBarUnselectedIconSize: navigationBarUnselectedIconSize ??
          this.navigationBarUnselectedIconSize,
      navigationBarLabelBehavior:
          navigationBarLabelBehavior ?? this.navigationBarLabelBehavior,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is AgnesSubThemesData &&
        other.interactionEffects == interactionEffects &&
        other.blendOnColors == blendOnColors &&
        other.blendTextTheme == blendTextTheme &&
        other.useTextTheme == useTextTheme &&
        other.defaultRadius == defaultRadius &&
        other.buttonMinSize == buttonMinSize &&
        other.buttonPadding == buttonPadding &&
        other.thickBorderWidth == thickBorderWidth &&
        other.thinBorderWidth == thinBorderWidth &&
        other.textButtonRadius == textButtonRadius &&
        other.elevatedButtonRadius == elevatedButtonRadius &&
        other.elevatedButtonElevation == elevatedButtonElevation &&
        other.outlinedButtonRadius == outlinedButtonRadius &&
        other.toggleButtonsRadius == toggleButtonsRadius &&
        other.inputDecorationRadius == inputDecorationRadius &&
        other.inputDecoratorSchemeColor == inputDecoratorSchemeColor &&
        other.inputDecoratorIsFilled == inputDecoratorIsFilled &&
        other.inputDecoratorFillColor == inputDecoratorFillColor &&
        other.inputDecoratorBorderType == inputDecoratorBorderType &&
        other.inputDecoratorUnfocusedHasBorder ==
            inputDecoratorUnfocusedHasBorder &&
        other.fabRadius == fabRadius &&
        other.fabUseShape == fabUseShape &&
        other.chipRadius == chipRadius &&
        other.chipSchemeColor == chipSchemeColor &&
        other.cardRadius == cardRadius &&
        other.cardElevation == cardElevation &&
        other.popupMenuRadius == popupMenuRadius &&
        other.popupMenuElevation == popupMenuElevation &&
        other.popupMenuOpacity == popupMenuOpacity &&
        other.dialogRadius == dialogRadius &&
        other.dialogElevation == dialogElevation &&
        other.timePickerDialogRadius == timePickerDialogRadius &&
        other.snackBarElevation == snackBarElevation &&
        other.tabBarIndicatorSchemeColor == tabBarIndicatorSchemeColor &&
        other.bottomSheetRadius == bottomSheetRadius &&
        other.bottomSheetElevation == bottomSheetElevation &&
        other.bottomSheetModalElevation == bottomSheetModalElevation &&
        other.bottomNavigationBarElevation == bottomNavigationBarElevation &&
        other.bottomNavigationBarOpacity == bottomNavigationBarOpacity &&
        other.bottomNavigationBarSchemeColor ==
            bottomNavigationBarSchemeColor &&
        other.bottomNavigationBarBackgroundSchemeColor ==
            bottomNavigationBarBackgroundSchemeColor &&
        other.bottomNavigationBarLandscapeLayout ==
            bottomNavigationBarLandscapeLayout &&
        other.navigationBarIsStyled == navigationBarIsStyled &&
        other.navigationBarHeight == navigationBarHeight &&
        other.navigationBarOpacity == navigationBarOpacity &&
        other.navigationBarIconSchemeColor == navigationBarIconSchemeColor &&
        other.navigationBarTextSchemeColor == navigationBarTextSchemeColor &&
        other.navigationBarHighlightSchemeColor ==
            navigationBarHighlightSchemeColor &&
        other.navigationBarBackgroundSchemeColor ==
            navigationBarBackgroundSchemeColor &&
        other.navigationBarMutedUnselectedIcon ==
            navigationBarMutedUnselectedIcon &&
        other.navigationBarMutedUnselectedText ==
            navigationBarMutedUnselectedText &&
        other.navigationBarSelectedLabelSize ==
            navigationBarSelectedLabelSize &&
        other.navigationBarUnselectedLabelSize ==
            navigationBarUnselectedLabelSize &&
        other.navigationBarSelectedIconSize == navigationBarSelectedIconSize &&
        other.navigationBarUnselectedIconSize ==
            navigationBarUnselectedIconSize &&
        other.navigationBarLabelBehavior == navigationBarLabelBehavior;
  }

  @override
  int get hashCode {
    final List<Object?> values = <Object?>[
      interactionEffects,
      blendOnColors,
      blendTextTheme,
      useTextTheme,
      defaultRadius,
      buttonMinSize,
      buttonPadding,
      thickBorderWidth,
      thinBorderWidth,
      textButtonRadius,
      elevatedButtonRadius,
      elevatedButtonElevation,
      outlinedButtonRadius,
      toggleButtonsRadius,
      inputDecorationRadius,
      inputDecoratorSchemeColor,
      inputDecoratorIsFilled,
      inputDecoratorFillColor,
      inputDecoratorBorderType,
      inputDecoratorUnfocusedHasBorder,
      fabRadius,
      fabUseShape,
      chipRadius,
      chipSchemeColor,
      cardRadius,
      cardElevation,
      popupMenuRadius,
      popupMenuElevation,
      popupMenuOpacity,
      dialogRadius,
      dialogElevation,
      timePickerDialogRadius,
      snackBarElevation,
      tabBarIndicatorSchemeColor,
      bottomSheetRadius,
      bottomSheetElevation,
      bottomSheetModalElevation,
      bottomNavigationBarElevation,
      bottomNavigationBarOpacity,
      bottomNavigationBarSchemeColor,
      bottomNavigationBarBackgroundSchemeColor,
      bottomNavigationBarLandscapeLayout,
      navigationBarIsStyled,
      navigationBarHeight,
      navigationBarOpacity,
      navigationBarIconSchemeColor,
      navigationBarTextSchemeColor,
      navigationBarHighlightSchemeColor,
      navigationBarBackgroundSchemeColor,
      navigationBarMutedUnselectedIcon,
      navigationBarMutedUnselectedText,
      navigationBarSelectedLabelSize,
      navigationBarUnselectedLabelSize,
      navigationBarSelectedIconSize,
      navigationBarUnselectedIconSize,
      navigationBarLabelBehavior,
    ];
    return hashList(values);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<bool>('interactionEffects', interactionEffects));
    properties.add(DiagnosticsProperty<bool>('blendOnColors', blendOnColors));
    properties.add(DiagnosticsProperty<bool>('blendTextTheme', blendTextTheme));
    properties.add(DiagnosticsProperty<bool>('useTextTheme', useTextTheme));
    properties.add(DiagnosticsProperty<double>('defaultRadius', defaultRadius));
    properties.add(DiagnosticsProperty<Size>('buttonMinSize', buttonMinSize));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
        'buttonPadding', buttonPadding));
    properties
        .add(DiagnosticsProperty<double>('thickBorderWidth', thickBorderWidth));
    properties
        .add(DiagnosticsProperty<double>('thinBorderWidth', thinBorderWidth));
    properties
        .add(DiagnosticsProperty<double>('textButtonRadius', textButtonRadius));
    properties.add(DiagnosticsProperty<double>(
        'elevatedButtonRadius', elevatedButtonRadius));
    properties.add(DiagnosticsProperty<double>(
        'elevatedButtonElevation', elevatedButtonElevation));
    properties.add(DiagnosticsProperty<double>(
        'outlinedButtonRadius', outlinedButtonRadius));
    properties.add(DiagnosticsProperty<double>(
        'toggleButtonsRadius', toggleButtonsRadius));
    properties.add(DiagnosticsProperty<double>(
        'inputDecorationRadius', inputDecorationRadius));
    properties.add(EnumProperty<SchemeColor>(
        'inputDecoratorSchemeColor', inputDecoratorSchemeColor));
    properties.add(DiagnosticsProperty<bool>(
        'inputDecoratorIsFilled', inputDecoratorIsFilled));
    properties
        .add(ColorProperty('inputDecoratorFillColor', inputDecoratorFillColor));
    properties.add(EnumProperty<AgnesInputBorderType>(
        'inputDecoratorBorderType', inputDecoratorBorderType));
    properties.add(DiagnosticsProperty<bool>(
        'inputDecoratorUnfocusedHasBorder', inputDecoratorUnfocusedHasBorder));
    properties.add(DiagnosticsProperty<double>('fabRadius', fabRadius));
    properties.add(DiagnosticsProperty<bool>('fabUseShape', fabUseShape));
    properties.add(DiagnosticsProperty<double>('chipRadius', chipRadius));
    properties
        .add(EnumProperty<SchemeColor>('chipSchemeColor', chipSchemeColor));
    properties.add(DiagnosticsProperty<double>('cardRadius', cardRadius));
    properties.add(DiagnosticsProperty<double>('cardElevation', cardElevation));
    properties
        .add(DiagnosticsProperty<double>('popupMenuRadius', popupMenuRadius));
    properties.add(
        DiagnosticsProperty<double>('popupMenuElevation', popupMenuElevation));
    properties
        .add(DiagnosticsProperty<double>('popupMenuOpacity', popupMenuOpacity));
    properties.add(DiagnosticsProperty<double>('dialogRadius', dialogRadius));
    properties
        .add(DiagnosticsProperty<double>('dialogElevation', dialogElevation));
    properties.add(DiagnosticsProperty<double>(
        'timePickerDialogRadius', timePickerDialogRadius));
    properties.add(
        DiagnosticsProperty<double>('snackBarElevation', snackBarElevation));
    properties.add(EnumProperty<SchemeColor>(
        'tabBarIndicatorSchemeColor', tabBarIndicatorSchemeColor));
    properties.add(
        DiagnosticsProperty<double>('bottomSheetRadius', bottomSheetRadius));
    properties.add(DiagnosticsProperty<double>(
        'bottomSheetElevation', bottomSheetElevation));
    properties.add(DiagnosticsProperty<double>(
        'bottomSheetModalElevation', bottomSheetModalElevation));
    properties.add(DiagnosticsProperty<double>(
        'bottomNavigationBarElevation', bottomNavigationBarElevation));
    properties.add(DiagnosticsProperty<double>(
        'bottomNavigationBarOpacity', bottomNavigationBarOpacity));
    properties.add(EnumProperty<SchemeColor>(
        'bottomNavigationBarSchemeColor', bottomNavigationBarSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'bottomNavigationBarBackgroundSchemeColor',
        bottomNavigationBarBackgroundSchemeColor));
    properties.add(EnumProperty<BottomNavigationBarLandscapeLayout>(
        'bottomNavigationBarLandscapeLayout',
        bottomNavigationBarLandscapeLayout));
    properties.add(DiagnosticsProperty<bool>(
        'navigationBarIsStyled', navigationBarIsStyled));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarHeight', navigationBarHeight));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarOpacity', navigationBarOpacity));
    properties.add(EnumProperty<SchemeColor>(
        'navigationBarIconSchemeColor', navigationBarIconSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'navigationBarIconSchemeColor', navigationBarIconSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'navigationBarHighlightSchemeColor',
        navigationBarHighlightSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'navigationBarBackgroundSchemeColor',
        navigationBarBackgroundSchemeColor));
    properties.add(DiagnosticsProperty<bool>(
        'navigationBarMutedUnselectedIcon', navigationBarMutedUnselectedIcon));
    properties.add(DiagnosticsProperty<bool>(
        'navigationBarMutedUnselectedText', navigationBarMutedUnselectedText));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarSelectedLabelSize', navigationBarSelectedLabelSize));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarUnselectedLabelSize', navigationBarUnselectedLabelSize));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarSelectedIconSize', navigationBarSelectedIconSize));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarUnselectedIconSize', navigationBarUnselectedIconSize));
    properties.add(EnumProperty<NavigationDestinationLabelBehavior>(
        'navigationBarLabelBehavior', navigationBarLabelBehavior));
  }
}
