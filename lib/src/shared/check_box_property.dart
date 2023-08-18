import 'package:flutter/material.dart';

/// 자주 쓰이는 체크박스 속성은 상위 위젯에서 받아와 사용하고
/// 색상이나 체크박스의 shape에 관련된건 클래스로 만들어서
/// 사용하자.
class CheckBoxProperty {
  Key? key;
  MouseCursor? mouseCursor;
  Color? activeColor;
  MaterialStateProperty<Color?>? fillColor;
  Color? checkColor;
  Color? focusColor;
  Color? hoverColor;
  MaterialStateProperty<Color?>? overlayColor;
  double? splashRadius;
  MaterialTapTargetSize? materialTapTargetSize;
  VisualDensity? visualDensity;
  FocusNode? focusNode;
  bool autofocus;
  OutlinedBorder? shape;
  BorderSide? side;
  CheckBoxProperty({
    this.key,
    this.mouseCursor,
    this.activeColor,
    this.fillColor,
    this.checkColor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.autofocus = false,
    this.shape,
    this.side,
  });
}
