// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_uiux_package/flutter_uiux_package.dart';

enum AgnesThemeModeButtonOrder {
  lightDarkSystem,
  lightSystemDark,
  darkSystemLight,
  darkLightSystem,
}

class AgnesThemeModeSwitch extends StatelessWidget {
  const AgnesThemeModeSwitch({
    Key? key,
    required this.themeMode,
    required this.onThemeModeChanged,
    required this.agnesSchemeData,
    this.title,
    this.hasTitle = true,
    this.labelLight = 'LIGHT',
    this.labelDark = 'DARK',
    this.labelSystem = 'SYSTEM',
    this.showSystemMode = true,
    this.buttonOrder = AgnesThemeModeButtonOrder.lightDarkSystem,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.labelAbove = true,
    this.backgroundLight,
    this.backgroundDark,
    this.backgroundSystem,
    this.selectedBorder,
    this.unselectedBorder,
    this.selectedElevation = 0,
    this.unselectedElevation = 0,
    this.optionButtonPadding,
    this.optionButtonMargin,
    this.optionButtonBorderRadius = 5,
    this.height = 24,
    this.width = 24,
    this.borderRadius = 4,
    this.padding,
    this.hoverColor,
  })  : assert(selectedElevation >= 0.0, 'Selected elevation must be >= 0.0'),
        assert(
            unselectedElevation >= 0.0, 'Unselected elevation must be >= 0.0'),
        super(key: key);

  final ThemeMode themeMode;

  final ValueChanged<ThemeMode> onThemeModeChanged;

  final AgnesSchemeData agnesSchemeData;

  final Widget? title;

  final bool hasTitle;

  final String labelLight;

  final String labelDark;

  final String labelSystem;

  final bool showSystemMode;

  final AgnesThemeModeButtonOrder buttonOrder;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final bool labelAbove;
  final Color? backgroundLight;
  final Color? backgroundDark;
  final Color? backgroundSystem;
  final BorderSide? selectedBorder;
  final BorderSide? unselectedBorder;
  final double selectedElevation;
  final double unselectedElevation;
  final EdgeInsets? optionButtonPadding;
  final EdgeInsets? optionButtonMargin;
  final double optionButtonBorderRadius;
  final double height;

  final double width;

  final double borderRadius;

  final EdgeInsets? padding;

  final Color? hoverColor;

  @override
  Widget build(BuildContext context) {
    final AgnesThemeModeOptionButton lightButton = AgnesThemeModeOptionButton(
      agnesSchemeColor: agnesSchemeData.light,
      backgroundColor: backgroundLight ?? Colors.white,
      label: labelLight,
      labelStyle: themeMode == ThemeMode.light
          ? selectedLabelStyle
          : unselectedLabelStyle,
      labelAbove: labelAbove,
      selected: themeMode == ThemeMode.light,
      onSelect: () {
        onThemeModeChanged(ThemeMode.light);
      },
      selectedBorder: selectedBorder,
      unselectedBorder: unselectedBorder,
      elevation: themeMode == ThemeMode.light
          ? selectedElevation
          : unselectedElevation,
      optionButtonPadding: optionButtonPadding,
      optionButtonMargin: optionButtonMargin,
      optionButtonBorderRadius: optionButtonBorderRadius,
      height: height,
      width: width,
      borderRadius: borderRadius,
      padding: padding,
      hoverColor: hoverColor,
    );

    final AgnesThemeModeOptionButton darkButton = AgnesThemeModeOptionButton(
      agnesSchemeColor: agnesSchemeData.dark,
      backgroundColor: backgroundDark ?? Colors.grey[850]!,
      label: labelDark,
      labelStyle: themeMode == ThemeMode.dark
          ? selectedLabelStyle
          : unselectedLabelStyle,
      labelAbove: labelAbove,
      selected: themeMode == ThemeMode.dark,
      onSelect: () {
        onThemeModeChanged(ThemeMode.dark);
      },
      selectedBorder: selectedBorder,
      unselectedBorder: unselectedBorder,
      elevation:
          themeMode == ThemeMode.dark ? selectedElevation : unselectedElevation,
      optionButtonPadding: optionButtonPadding,
      optionButtonMargin: optionButtonMargin,
      optionButtonBorderRadius: optionButtonBorderRadius,
      height: height,
      width: width,
      borderRadius: borderRadius,
      padding: padding,
      hoverColor: hoverColor,
    );

    final AgnesThemeModeOptionButton systemButton = AgnesThemeModeOptionButton(
      agnesSchemeColor: AgnesSchemeColor(
        primary: agnesSchemeData.light.primary,
        primaryContainer: agnesSchemeData.dark.primary,
        secondary: agnesSchemeData.light.secondary,
        secondaryContainer: agnesSchemeData.dark.secondary,
      ),
      backgroundColor: backgroundSystem ?? Colors.grey[500]!,
      label: labelSystem,
      labelStyle: themeMode == ThemeMode.system
          ? selectedLabelStyle
          : unselectedLabelStyle,
      labelAbove: labelAbove,
      selected: themeMode == ThemeMode.system,
      onSelect: () {
        onThemeModeChanged(ThemeMode.system);
      },
      selectedBorder: selectedBorder,
      unselectedBorder: unselectedBorder,
      elevation: themeMode == ThemeMode.system
          ? selectedElevation
          : unselectedElevation,
      optionButtonPadding: optionButtonPadding,
      optionButtonMargin: optionButtonMargin,
      optionButtonBorderRadius: optionButtonBorderRadius,
      height: height,
      width: width,
      borderRadius: borderRadius,
      padding: padding,
      hoverColor: hoverColor,
    );

    return Row(
      children: <Widget>[
        if (hasTitle)
          Expanded(
            child: title ??
                Text(
                  'Theme mode',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
          ),
        if (buttonOrder ==
            AgnesThemeModeButtonOrder.lightDarkSystem) ...<Widget>[
          lightButton,
          darkButton,
          if (showSystemMode) systemButton,
        ],
        if (buttonOrder ==
            AgnesThemeModeButtonOrder.darkLightSystem) ...<Widget>[
          darkButton,
          lightButton,
          if (showSystemMode) systemButton,
        ],
        if (buttonOrder ==
            AgnesThemeModeButtonOrder.lightSystemDark) ...<Widget>[
          lightButton,
          if (showSystemMode) systemButton,
          darkButton,
        ],
        if (buttonOrder ==
            AgnesThemeModeButtonOrder.darkSystemLight) ...<Widget>[
          darkButton,
          if (showSystemMode) systemButton,
          lightButton,
        ],
      ],
    );
  }
}

class AgnesThemeModeOptionButton extends StatelessWidget {
  const AgnesThemeModeOptionButton({
    Key? key,
    required this.agnesSchemeColor,
    this.backgroundColor,
    this.label,
    this.labelStyle,
    this.labelAbove = true,
    required this.selected,
    this.onSelect,
    this.selectedBorder,
    this.unselectedBorder,
    this.elevation = 0,
    this.optionButtonPadding,
    this.optionButtonMargin,
    this.optionButtonBorderRadius = 5,
    this.height = 24,
    this.width = 24,
    this.borderRadius = 4,
    this.padding,
    this.hoverColor,
  })  : assert(elevation >= 0.0, 'Elevation must be >= 0.0'),
        super(key: key);

  final AgnesSchemeColor agnesSchemeColor;

  final Color? backgroundColor;

  final String? label;

  final TextStyle? labelStyle;

  final bool labelAbove;

  final bool selected;

  final VoidCallback? onSelect;

  final BorderSide? selectedBorder;

  final BorderSide? unselectedBorder;

  final double elevation;

  final EdgeInsets? optionButtonPadding;

  final EdgeInsets? optionButtonMargin;

  final double optionButtonBorderRadius;

  final double height;

  final double width;

  final double borderRadius;

  final EdgeInsets? padding;

  final Color? hoverColor;

  @override
  Widget build(BuildContext context) {
    final Color effectiveHoverColor = hoverColor ??
        (Theme.of(context).brightness == Brightness.light
            ? const Color(0x50BCBCBC)
            : const Color(0x99555555));
    return Padding(
      padding:
          optionButtonPadding ?? const EdgeInsetsDirectional.only(start: 6),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              if (label != null && labelAbove)
                Text(
                  label!,
                  style: labelStyle ?? Theme.of(context).textTheme.caption,
                  semanticsLabel: '',
                ),
              Material(
                elevation: elevation,
                color: backgroundColor,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(optionButtonBorderRadius),
                  ),
                  side: selected
                      ? selectedBorder ??
                          BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 4,
                          )
                      : unselectedBorder ??
                          BorderSide(
                            color: Theme.of(context).dividerColor,
                          ),
                ),
                child: Semantics(
                  label: label ?? 'Theme mode option button',
                  selected: selected,
                  button: true,
                  enabled: true,
                  child: InkWell(
                    hoverColor: effectiveHoverColor,
                    onTap: onSelect,
                    child: Padding(
                      padding: optionButtonMargin ?? const EdgeInsets.all(4),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              _SchemeColorBox(
                                color: agnesSchemeColor.primary,
                                height: height,
                                width: width,
                                borderRadius: borderRadius,
                                padding: padding,
                              ),
                              _SchemeColorBox(
                                color: agnesSchemeColor.primaryContainer,
                                height: height,
                                width: width,
                                borderRadius: borderRadius,
                                padding: padding,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              _SchemeColorBox(
                                color: agnesSchemeColor.secondary,
                                height: height,
                                width: width,
                                borderRadius: borderRadius,
                                padding: padding,
                              ),
                              _SchemeColorBox(
                                color: agnesSchemeColor.secondaryContainer,
                                height: height,
                                width: width,
                                borderRadius: borderRadius,
                                padding: padding,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (label != null && !labelAbove)
                Text(
                  label!,
                  style: labelStyle ?? Theme.of(context).textTheme.caption,
                  semanticsLabel: '',
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SchemeColorBox extends StatelessWidget {
  const _SchemeColorBox({
    Key? key,
    required this.color,
    this.height = 24,
    this.width = 24,
    this.borderRadius = 4,
    this.padding,
  }) : super(key: key);

  final Color color;

  final double height;

  final double width;

  final double borderRadius;

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(3),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
    );
  }
}
