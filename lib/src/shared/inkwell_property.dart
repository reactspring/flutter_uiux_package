import 'package:flutter/material.dart';

class InkwellProperty {
  Key? key;
  MouseCursor? mouseCursor;
  Color? focusColor;
  Color? hoverColor;
  Color? highlightColor;
  MaterialStateProperty<Color?>? overlayColor;
  Color? splashColor;
  InteractiveInkFeatureFactory? splashFactory;
  double? radius;
  BorderRadius? borderRadius;
  ShapeBorder? customBorder;
  bool? enableFeedback;
  bool excludeFromSemantics;
  FocusNode? focusNode;
  bool canRequestFocus;
  void Function(bool)? onFocusChange;
  bool autofocus;
  InkwellProperty(
      {this.key,
      this.mouseCursor,
      this.focusColor,
      this.hoverColor,
      this.highlightColor,
      this.overlayColor,
      this.splashColor,
      this.radius,
      this.borderRadius,
      this.customBorder,
      this.enableFeedback = true,
      this.excludeFromSemantics = false,
      this.focusNode,
      this.canRequestFocus = true,
      this.onFocusChange,
      this.autofocus = false});
}
