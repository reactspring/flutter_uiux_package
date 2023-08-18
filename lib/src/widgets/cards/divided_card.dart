/* ********************************************************************
 *
 * DividedCard - 위-아래 구분선이 있는 카드를 구현하는 함수 
 *  
 * 2022.08.18  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

class DividedCard extends StatelessWidget {
  /// ## DividedCard 위-아래 구분선이 있는 카드
  ///
  /// 구분선으로 위-아래 부분이 나뉜 모양의 카드 위젯 입니다.
  ///
  /// [topColor], [bottomColor], [shadowColor],
  ///
  /// [blurRadius], [borderRadius], [cardWidth],
  ///
  /// [topText], [bottomText]은 null이 아니어야 합니다.

  DividedCard({
    Key? key,
    this.borderOnForeground = true,
    this.topColor,
    this.bottomColor,
    this.borderRadius,
    this.shadowColor,
    this.blurRadius,
    this.cardWidth,
    this.topText,
    this.bottomText,
  }) : super(key: key);

  final bool borderOnForeground;

  /// 카드의 윗 부분에 들어갈 기본적인 텍스트 입니다.
  final String? topText;

  /// 카드의 아랫 부분에 들어갈 기본적인 텍스트 입니다.
  final String? bottomText;

  /// 카드의 윗 부분 배경 색상을 지정합니다.
  final Color? topColor;

  /// 카드의 아랫 부분 배경 색상을 지정합니다.
  final Color? bottomColor;

  /// 카드의 그림자 색상을 지정합니다.
  final Color? shadowColor;

  /// 카드의 블러 둥글기를 지정합니다.
  final double? blurRadius;

  /// 카드의 모서리 둥글기를 지정합니다.
  final double? borderRadius;

  /// 카드의 너비를 지정합니다.
  final double? cardWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
        color: topColor,
        boxShadow: [
          BoxShadow(color: shadowColor!, blurRadius: blurRadius!),
        ],
      ),
      child: Column(
        children: [
          Container(
            child: Text(
              '$topText',
            ),
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
          ),
          Container(
            width: cardWidth,
            decoration: BoxDecoration(
              color: bottomColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(borderRadius!),
                bottomLeft: Radius.circular(borderRadius!),
              ),
            ),
            child: Text(
              '$bottomText',
              textAlign: TextAlign.center,
            ),
            padding: const EdgeInsets.all(12),
          ),
        ],
      ),
    );
  }
}
