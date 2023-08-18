/* ********************************************************************
 *
 * LabelCard - 라벨이 있는 카드를 구현하는 함수 
 *  
 * 2022.08.18  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class LabelCard extends StatelessWidget {
  /// # LabelCard 라벨이 있는 카드
  ///
  /// 라벨이 있는 카드 위젯 입니다.
  ///
  /// [backgroundColor], [borderColor], [shadowColor],
  ///
  /// [blurRadius], [borderWidth], [borderRadius],
  ///
  /// [cardwidth], [cardheight], [labelwidth], [labelheight],
  ///
  /// [text], [label]은 null이 아니어야 합니다.

  LabelCard({
    Key? key,
    this.borderOnForeground = true,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.shadowColor,
    this.blurRadius,
    this.cardwidth,
    this.cardheight,
    this.labelwidth,
    this.labelheight,
    this.label,
    this.text,
  }) : super(key: key);

  final bool borderOnForeground;

  /// 카드에 들어갈 기본적인 텍스트 입니다.
  final String? text;

  /// 카드의 label에 들어갈 기본적인 텍스트 입니다.
  final String? label;

  /// 카드의 배경 색상을 지정합니다.
  final Color? backgroundColor;

  /// 카드의 테두리 색상을 지정합니다.
  final Color? borderColor;

  /// 카드의 그림자 색상을 지정합니다.
  final Color? shadowColor;

  /// 카드의 블러 둥글기를 지정합니다.
  final double? blurRadius;

  /// 카드의 테두리 두께를 지정합니다.
  final double? borderWidth;

  /// 카드의 모서리 둥글기를 지정합니다.
  final double? borderRadius;

  /// 카드의 너비를 지정합니다.
  final double? cardwidth;

  /// 카드의 높이를 지정합니다.
  final double? cardheight;

  /// 카드의 label 너비를 지정합니다.
  final double? labelwidth;

  /// 카드의 label 높이를 지정합니다.
  final double? labelheight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: cardheight! + 5,
          width: cardwidth! + 5,
        ),
        Positioned(
          top: 5,
          left: 5.0,
          child: Container(
            height: cardheight,
            width: cardwidth,
            decoration: BoxDecoration(
                border: Border.all(color: borderColor!, width: borderWidth!),
                color: backgroundColor,
                borderRadius: BorderRadius.circular(borderRadius!),
                boxShadow: [
                  BoxShadow(color: shadowColor!, blurRadius: blurRadius!)
                ]),
            child: Center(
              child: Text(
                '$text',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 15.0,
          child: Container(
            height: labelheight,
            width: labelwidth,
            decoration: BoxDecoration(
              color: agnesTheme.primaryColor,
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
            child: Center(
              child: Text(
                '$label',
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
