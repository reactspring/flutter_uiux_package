/* ********************************************************************
 *
 * OutlinedButton - 테두리가 있는 버튼을 구현하는 함수
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class MiddleSizeButton extends StatelessWidget {
  const MiddleSizeButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.buttonColor,
    this.buttonShape = ButtonShape.outline,
  }) : super(key: key);

  /// 버튼에 들어갈 텍스트를 입력합니다.
  final String title;

  /// 버튼의 색상을 지정합니다.
  final Color? buttonColor;

  /// 버튼의 모양을 지정합니다.
  final ButtonShape buttonShape;

  /// 버튼 클릭 시 발생하는 이벤트를 지정합니다.
  final VoidCallback? onPressed;

  bool get disabled => onPressed == null;

  @override
  Widget build(BuildContext context) {
    return 
    /// 테두리가 있는 버튼을 구현하는 함수
    OutlinedButton(
      onPressed: onPressed,
      child: Text(
        title,
        textHeightBehavior: TextHeightBehavior(
            leadingDistribution: TextLeadingDistribution.even),
      ),
    );
  }
}
