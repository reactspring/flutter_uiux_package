/* ********************************************************************
 *
 * StandardButton - 기본 버튼을 구현하는 함수
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class OpacityButton extends StatefulWidget {
  /// ## OpacityButton 투명도 조절 버튼
  ///
  /// 버튼의 투명도 조절이 가능한 버튼을 구현합니다.
  ///
  /// [onTap]은 null이 아니어야 합니다.

  OpacityButton({
    Key? key,
    required this.onTap,
    this.title,
    this.width,
    this.height,
    this.opacity,
    this.onLongPress,
    this.onDoubleTap,
    this.color,
    this.borderColor,
    this.titleColor,
    this.tappedTitleColor,
    this.shadows,
    this.splashShadows,
    this.titleSize,
    this.borderRadius,
    this.fontWeight,
    this.borderWidth,
    this.alignment,
    this.child,
    this.childSplash,
  }) : super(key: key);

  /// 버튼에 들어갈 텍스트를 지정합니다.
  final String? title;

  /// 버튼의 너비를 지정합니다.
  final double? width;

  /// 버튼의 높이를 지정합니다.
  final double? height;

  /// 버튼의 투명도를 지정합니다.
  final double? opacity;

  /// 버튼을 탭했을 때 발생하는 이벤트를 지정합니다.
  final VoidCallback? onTap;

  /// 버튼을 길게 클릭 시 발생하는 이벤트를 지정합니다.
  final VoidCallback? onLongPress;

  /// 버튼 더블 탭 시에 발생하는 이벤트를 지정합니다.
  final VoidCallback? onDoubleTap;

  /// 버튼의 색상을 지정합니다.
  final Color? color;

  /// 버튼의 테두리 색상을 지정합니다.
  final Color? borderColor;

  /// 버튼에 들어갈 텍스트 색상을 지정합니다.
  final Color? titleColor;

  /// 버튼의 테두리 둥글기를 지정합니다.
  final double? borderRadius;

  /// 버튼의 테두리 두께를 지정합니다.
  final double? borderWidth;

  /// 버튼에 들어갈 텍스트 사이즈를 지정합니다.
  final double? titleSize;

  /// 버튼에 들어갈 텍스트 두께를 지정합니다.
  final FontWeight? fontWeight;

  /// 버튼을 탭했을 때 보여지는 제목 색상을 지정합니다.
  final Color? tappedTitleColor;

  /// 버튼의 그림자 스타일을 지정합니다.
  final List<BoxShadow>? shadows;

  /// 버튼의 스플래시 효과에 적용할 그림자 스타일을 지정합니다.
  final List<BoxShadow>? splashShadows;

  /// 버튼의 위치를 지정합니다.
  final Alignment? alignment;

  /// 버튼에 들어갈 위젯을 지정합니다.
  final Widget? child;

  /// 버튼의 스플래시 효과 적용 시에 보여지는 위젯을 지정합니다.
  final Widget? childSplash;

  @override
  State<OpacityButton> createState() => _OpacityButtonState();
}

class _OpacityButtonState extends State<OpacityButton> {
  @override
  Widget build(BuildContext context) {
    return StandardButton(
      onTap: () {},
      title: '',
      onPressed: () {},
      child: widget.child,
    );
  }
}
