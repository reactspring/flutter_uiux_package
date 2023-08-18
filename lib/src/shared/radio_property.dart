import 'package:flutter/material.dart';

class RadioProperty {
  Key? key;
  MouseCursor? mouseCursor;
  Color? activeColor;
  MaterialStateProperty<Color?>? fillColor;
  Color? focusColor;
  Color? hoverColor;
  MaterialStateProperty<Color?>? overlayColor;
  double? splashRadius;
  MaterialTapTargetSize? materialTapTargetSize;
  VisualDensity? visualDensity;
  FocusNode? focusNode;
  bool autofocus = false;
  RadioProperty({
    this.key,
    this.mouseCursor,
    this.activeColor,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.autofocus = false,
  });
}
