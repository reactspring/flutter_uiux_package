/* ********************************************************************
 *
 * RectangleCard - 모서리가 사각형인 모양의 카드를 구현하는 함수
 *  
 * 2022.08.18  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

class RectangleCard extends StatelessWidget {
  /// ## RectangleCard 모서리가 사각형인 모양의 카드
  ///
  /// 모서리가 사각형인 모양의 카드 위젯 입니다.
  ///
  /// [backgroundColor], [borderColor], [shadowColor],
  ///
  /// [elevation], [borderWidth], [borderRadius],
  ///
  /// [width], [height], [margin],
  ///
  /// [text]는 null이 아니어야 합니다.

  RectangleCard({
    Key? key,
    this.borderOnForeground = true,
    this.text,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.shadowColor,
    this.elevation,
    this.width,
    this.height,
    this.margin,
  }) : super(key: key);

  final bool borderOnForeground;

  /// 카드에 들어갈 기본적인 텍스트 입니다.
  final String? text;

  /// 카드의 배경 색상을 지정합니다.
  final Color? backgroundColor;

  /// 카드의 테두리 색상을 지정합니다.
  final Color? borderColor;

  /// 카드의 그림자 색상을 지정합니다.
  final Color? shadowColor;

  /// 카드의 그림자 강도를 지정합니다.
  final double? elevation;

  /// 카드의 테두리 두께를 지정합니다.
  final double? borderWidth;

  /// 카드의 모서리 둥글기를 지정합니다.
  final double? borderRadius;

  /// 카드의 너비를 지정합니다.
  final double? width;

  /// 카드의 높이를 지정합니다.
  final double? height;

  /// 카드의 여백을 지정합니다.
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Card(
        child: ListTile(
          title: Text(
            '$text',
            style: TextStyle(fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
        ),
        color: backgroundColor,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          side: BorderSide(color: borderColor!, width: borderWidth!),
        ),
        shadowColor: shadowColor,
        elevation: elevation,
        margin: EdgeInsets.all(margin!),
      ),
    );
  }
}
