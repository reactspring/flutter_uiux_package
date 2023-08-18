/* ********************************************************************
 *
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class TextFlatButton extends StatelessWidget {
  /// ## TextFlatButton
  ///
  /// 텍스트가 있는 버튼을 구현합니다.
  ///
  /// [text], [onPressed]는 null이 아니어야 합니다.
  const TextFlatButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.vertical,
    this.horizontal,
    this.clipBehavior,
    this.autofocus,
    this.focusNode,
    this.style,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
  }) : super(key: key);

  /// 버튼에 들어갈 텍스트를 지정합니다.
  final Text text;

  /// 세로 방향 값을 지정합니다.
  final double? vertical;

  /// 가로 방향 값을 지정합니다.
  final double? horizontal;

  /// 버튼 클릭 시 발생하는 이벤트입니다.
  final VoidCallback onPressed;

  /// 클립할 부분을 지정합니다.
  final Clip? clipBehavior;

  /// 오토포커스 활성화 여부를 지정합니다.
  final bool? autofocus;

  /// 포커스 노드를 지정합니다.
  final FocusNode? focusNode;

  /// 버튼의 스타일을 관리합니다.
  final ButtonStyle? style;

  /// 버튼을 길게 클릭 시 발생하는 이벤트를 지정합니다.
  final Function()? onLongPress;

  /// 마우스 커서를 버튼 위에 올려두었을 때 발생하는 이벤트를 지정합니다.
  final Function(bool)? onHover;

  /// 포커스 변화 시에 발생하는 이벤트를 지정합니다.
  final Function(bool)? onFocusChange;

  @override
  Widget build(BuildContext context) {
    var textWidget = text;

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: vertical ?? 0.0, horizontal: horizontal ?? 0.0),
      child: TextButton(
        style: TextButton.styleFrom(
            minimumSize: Size(AGNESDimens.zero, AGNESDimens.zero),
            padding: EdgeInsets.symmetric(horizontal: AGNESSpacing.spacing_8),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        onPressed: onPressed,
        child: textWidget,
        // clipBehavior: clipBehavior!,
        // autofocus: autofocus!,
        // focusNode: focusNode,
        // onLongPress: onLongPress,
        // onHover: onHover,
        // onFocusChange: onFocusChange,
      ),
    );
  }
}
