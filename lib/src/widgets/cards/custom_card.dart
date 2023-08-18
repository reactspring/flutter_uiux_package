/* ********************************************************************
 *
 * CustomCard - 커스텀 카드를 구현하는 함수 
 *  
 * 2022.08.18  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  /// ## CustomCard 커스텀 카드
  ///
  /// 커스텀 카드 위젯 입니다.
  ///
  /// [backgroundColor], [borderColor], [shadowColor],
  ///
  /// [elevation], [borderWidth], [borderRadius],
  ///
  /// [width], [height], [margin],
  ///
  /// [title], [subtitle], [description], [buttontext]은 null이 아니어야 합니다.

  CustomCard({
    Key? key,
    this.borderOnForeground = true,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.shadowColor,
    this.elevation,
    this.width,
    this.height,
    this.margin,
    this.shape,
    this.title,
    this.subtitle,
    this.description,
    this.buttontext,
  }) : super(key: key);

  final bool borderOnForeground;

  /// 카드에 들어갈 제목을 입력합니다.
  final String? title;

  /// 카드에 들어갈 부제목을 입력합니다.
  final String? subtitle;

  /// 카드에 들어갈 설명을 입력합니다.
  final String? description;

  /// 카드의 버튼에 들어갈 텍스트 입니다.
  final String? buttontext;

  /// 카드의 배경 색상을 지정합니다.
  final Color? backgroundColor;

  /// 카드의 테두리 색상을 지정합니다.
  final Color? borderColor;

  /// 카드의 그림자 색상을 지정합니다.
  final Color? shadowColor;

  /// 카드의 테두리 모양을 지정합니다.
  final ShapeBorder? shape;

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
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('$title'),
              subtitle: Text('$subtitle'),
            ),
            Text('$description'),
            ButtonBarTheme(
              data: ButtonBarThemeData(),
              child: ButtonBar(
                children: <Widget>[
                  TextButton(
                    child: Text('$buttontext'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
        color: backgroundColor,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: BorderSide(color: borderColor!, width: borderWidth!),
        ),
        shadowColor: shadowColor,
        elevation: elevation,
        margin: EdgeInsets.all(margin!),
      ),
    );
  }
}
