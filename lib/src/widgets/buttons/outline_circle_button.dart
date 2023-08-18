/* ********************************************************************
 *
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

class OutlineCircleButton extends StatelessWidget {
  /// ## OutlineCircleButton
  ///
  /// 테두리의 스타일을 지정할 수 있는 버튼을 구현합니다.

  OutlineCircleButton({
    Key? key,
    this.onTap,
    this.borderSize = 0.5,
    this.radius = 20.0,
    this.borderColor = Colors.black,
    this.foregroundColor = Colors.white,
    this.child,
  }) : super(key: key);

  /// 버튼을 탭했을 때 발생하는 이벤트를 지정합니다.
  final onTap;

  /// 버튼의 둥글기를 지정합니다.
  final radius;

  /// 버튼의 테두리 두께를 지정합니다.
  final borderSize;

  /// 버튼의 테두리 색상을 지정합니다.
  final borderColor;

  /// 버튼의 앞쪽 부분 배경 색상을 지정합니다.
  final foregroundColor;

  /// 버튼에 들어갈 위젯을 지정합니다.
  final child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: borderSize),
          color: foregroundColor,
          shape: BoxShape.circle,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: child ?? SizedBox(),
            onTap: () async {
              if (onTap != null) {
                onTap();
              }
            },
          ),
        ),
      ),
    );
  }
}
