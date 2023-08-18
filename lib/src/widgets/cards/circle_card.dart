/* ********************************************************************
 *
 * CircleCard - 원형 카드를 구현하는 함수
 *  
 * 2022.08.18  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

class CircleCard extends StatelessWidget {
  /// ## CircleCard 원형 카드
  ///
  /// 원형 모양의 카드 위젯 입니다.
  ///
  /// [text], [backgroundColor], [borderColor],
  ///
  /// [shadowColor],[elevation], [borderWidth],
  ///
  /// [width], [height], [margin]은 null이 아니어야 합니다.

  CircleCard({
    Key? key,
    this.borderOnForeground = true,
    this.text,
    this.backgroundColor,
    this.borderColor,
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
        shape: CircleBorder(
          side: BorderSide(color: borderColor!, width: borderWidth!),
        ),
        shadowColor: shadowColor,
        elevation: elevation,
        margin: EdgeInsets.all(margin!),
      ),
    );
  }
}
