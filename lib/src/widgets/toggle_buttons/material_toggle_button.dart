/* ********************************************************************
 *
 * Switch - 머터리얼 디자인의 토글 버튼을 구현하는 함수 
 *  
 * 2022.08.25  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

class MaterialToggleButton extends StatefulWidget {
  /// ## MaterialToggleButton 머터리얼 토글 버튼
  ///
  /// 머터리얼 디자인의 토글 버튼을 구현합니다.
  ///
  /// [onChanged]는 null이 아니어야 합니다.

  const MaterialToggleButton({
    Key? key,
    required this.onChanged,
    this.value,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
  }) : super(key: key);

  /// 버튼 클릭 시 발생하는 이벤트입니다.
  final Function(bool)? onChanged;

  /// 토글 버튼 활성화 여부를 지정합니다.
  final bool? value;

  /// 토글 버튼 활성화 시에 나타나는 색상을 지정합니다.
  final Color? activeColor;

  /// 토글 버튼 활성화 시에 나타나는 토글 버튼의 내부 색상을 지정합니다.
  final Color? activeTrackColor;

  /// 토글 버튼 비활성화 시에 나타나는 토글 버튼의 내부 색상을 지정합니다.
  final Color? inactiveTrackColor;

  /// 토글 버튼 비활성화 시에 나타나는 토글의 버튼 스위치 색상을 지정합니다.
  final Color? inactiveThumbColor;

  @override
  State<StatefulWidget> createState() => MaterialToggleButtonState();
}

class MaterialToggleButtonState extends State<MaterialToggleButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return

        /// Switch : 머터리얼 디자인의 토글 버튼을 구현하는 함수
        Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(
          () {
            isSwitched = value;
            print(isSwitched);
          },
        );
      },
      activeColor: widget.activeColor,
      activeTrackColor: widget.activeTrackColor,
      inactiveThumbColor: widget.inactiveThumbColor,
      inactiveTrackColor: widget.inactiveTrackColor,
    );


  }
}
