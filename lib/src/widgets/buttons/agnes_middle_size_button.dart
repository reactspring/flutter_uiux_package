/* ********************************************************************
 *
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class AgnesMiddleSizeButton extends StatelessWidget {
  /// ## AgnesMiddleSizeButton
  ///
  /// 아그네스 중간 크기의 버튼을 구현합니다.
  ///
  /// [title]은 null이 아니어야 합니다.

  const AgnesMiddleSizeButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.buttonColor,
    this.buttonEffectType,
  }) : super(key: key);

  /// 버튼에 들어갈 텍스트를 입력합니다.
  final String title;

  /// 버튼의 색상을 지정합니다.
  final Color? buttonColor;

  /// 버튼 클릭 시 발생하는 이벤트를 지정합니다.
  final VoidCallback? onPressed;

  /// 버튼의 효과 타입을 지정합니다.
  final ButtonEffectType? buttonEffectType;

  AgnesMiddleSizeButton.gradation(
      {Key? key,
      required this.title,
      this.onPressed,
      this.buttonColor,
      this.buttonEffectType = ButtonEffectType.gradation});

  const AgnesMiddleSizeButton.hover({
    Key? key,
    required this.title,
    this.onPressed,
    this.buttonColor,
    this.buttonEffectType = ButtonEffectType.hover,
  });
  const AgnesMiddleSizeButton.opacity({
    Key? key,
    required this.title,
    this.onPressed,
    this.buttonColor,
    this.buttonEffectType = ButtonEffectType.opacity,
  });

  bool get disabled => onPressed == null;

  @override
  Widget build(BuildContext context) {
    Widget button = Text('hi');
    switch (buttonEffectType) {
      case ButtonEffectType.gradation:
        button = GradationButton(
          onPressed: () {},
          child: Text(
            title,
            textHeightBehavior: TextHeightBehavior(
                leadingDistribution: TextLeadingDistribution.even),
          ),
        );
        break;
      case ButtonEffectType.hover:
        button = HoverButton(
          onTap: () {},
          child: Text(
            title,
            textHeightBehavior: TextHeightBehavior(
                leadingDistribution: TextLeadingDistribution.even),
          ),
        );
        break;
      case ButtonEffectType.opacity:
        OpacityButton(
          onTap: () {},
          child: Text(
            title,
            textHeightBehavior: TextHeightBehavior(
                leadingDistribution: TextLeadingDistribution.even),
          ),
        );
        break;

      default:
        break;
    }
    return button;
  }
}
