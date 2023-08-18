/* ********************************************************************
 *
 * AdvancedSwitch - 토글 버튼을 구현하는 함수 
 *  
 * 2022.08.25  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class StandardToggleButton extends StatefulWidget {
  /// ## StandardToggleButton 기본형 토글 버튼
  ///
  /// 기본형의 토글 버튼을 구현합니다.
  ///
  /// [onChanged]는 null이 아니어야 합니다.

  StandardToggleButton({
    Key? key,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.width,
    this.height,
    this.activeText,
    this.inactiveText,
    this.borderRadius,
    this.enabled,
  }) : super(key: key);

  /// 토글 버튼 활성화 시에 나타나는 색상을 지정합니다.
  final Color? activeColor;

  /// 토글 버튼 비활성화 시에 나타나는 색상을 지정합니다.
  final Color? inactiveColor;

  /// 토글 버튼의 너비를 지정합니다.
  final double? width;

  /// 토글 버튼의 높이를 지정합니다.
  final double? height;

  /// 토글 버튼 활성화 시에 나타나는 텍스트를 지정합니다.
  final String? activeText;

  /// 토글 버튼 비활성화 시에 나타나는 텍스트를 지정합니다.
  final String? inactiveText;

  /// 토글 버튼의 모서리 둥글기를 지정합니다.
  final double? borderRadius;

  /// 토글 버튼의 활성화 여부를 지정합니다.
  final bool? enabled;

  /// 버튼 클릭 시 발생하는 이벤트 입니다.
  final Function(bool)? onChanged;

  @override
  State<StatefulWidget> createState() => StandardToggleButtonState();
}

class StandardToggleButtonState extends State<StandardToggleButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// AdvancedSwitch : 토글 버튼을 구현하는 함수
        AdvancedSwitch(
          activeColor: widget.activeColor!,
          inactiveColor: widget.inactiveColor!,
          width: widget.width!,
          height: widget.height!,
          activeChild: Text(widget.activeText!),
          inactiveChild: Text(widget.inactiveText!),
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          enabled: widget.enabled!,
          controller: ValueNotifier(false),
        ),
      ],
    );
  }
}
