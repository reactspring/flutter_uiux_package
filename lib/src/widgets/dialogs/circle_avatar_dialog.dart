/* ********************************************************************
 *
 * AlertDialog - 설명을 입력할 수 있는 기본 다이얼로그
 *  
 * 2022.08.19  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

const EdgeInsets _defaultInsetPadding =
    EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0);

class CircleAvatarDialog extends StatelessWidget {
  /// ## CircleAvatarDialog 서클아바타 다이얼로그
  ///
  /// 서클아바타 위젯이 있는 다이얼로그를 구현합니다.
  ///
  /// [title], [actions], [child], [circleForegroundColor], [circleBackgroundColor]는 null이 아니어야 합니다.

  const CircleAvatarDialog({
    Key? key,
    required this.title,
    required this.actions,
    required this.child,
    required this.circleForegroundColor,
    required this.circleBackgroundColor,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.contentTextStyle,
    this.actionsPadding = EdgeInsets.zero,
    this.actionsAlignment,
    this.actionsOverflowAlignment,
    this.actionsOverflowDirection,
    this.actionsOverflowButtonSpacing,
    this.buttonPadding,
    this.backgroundColor,
    this.elevation,
    this.semanticLabel,
    this.insetPadding = _defaultInsetPadding,
    this.clipBehavior = Clip.none,
    this.shape,
    this.alignment,
    this.scrollable = false,
  }) : super(key: key);

  final EdgeInsets insetPadding;
  final Clip clipBehavior;
  final OverflowBarAlignment? actionsOverflowAlignment;
  final VerticalDirection? actionsOverflowDirection;
  final double? actionsOverflowButtonSpacing;
  final String? semanticLabel;

  /// 다이얼로그에 들어갈 제목을 입력합니다.
  final Widget? title;

  /// 다이얼로그에 들어갈 내용을 입력합니다.
  final Widget? content;

  /// 다이얼로그에 들어갈 제목의 스타일을 지정합니다.
  final TextStyle? titleTextStyle;

  /// 다이얼로그에 들어갈 내용의 스타일을 지정합니다.
  final TextStyle? contentTextStyle;

  /// 다이얼로그의 배경 색상을 지정합니다.
  final Color? backgroundColor;

  /// 다이얼로그의 서클 아바타 앞쪽 배경 색상을 지정합니다.
  final Color? circleForegroundColor;

  /// 다이얼로그의 서클 아바타 뒷쪽 배경 색상을 지정합니다.
  final Color? circleBackgroundColor;

  /// 다이얼로그의 그림자 강도를 지정합니다.
  final double? elevation;

  /// 다이얼로그의 테두리 모양을 지정합니다.
  final ShapeBorder? shape;

  /// 다이얼로그에 들어갈 내용의 여백을 지정합니다.
  final EdgeInsetsGeometry contentPadding;

  /// 다이얼로그에 들어갈 제목의 여백을 지정합니다.
  final EdgeInsetsGeometry? titlePadding;

  /// 다이얼로그에 들어갈 버튼의 여백을 지정합니다.
  final EdgeInsetsGeometry? buttonPadding;

  /// 다이얼로그의 스크롤 여부를 지정합니다.
  final bool scrollable;

  /// 다이얼로그의 위치를 지정합나다.
  final AlignmentGeometry? alignment;

  /// 배치할 위젯들을 지정합니다.
  final List<Widget>? actions;

  /// 배치된 위젯들 사이의 여백을 지정합니다.
  final EdgeInsetsGeometry actionsPadding;

  /// 배치된 위젯들의 위치를 지정합니다.
  final MainAxisAlignment? actionsAlignment;

  /// 서클아바타에 들어갈 위젯을 지정합니다.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            AlertDialog(
              titlePadding: EdgeInsets.only(top: 50),
              title: title,
              actions: actions,
              content: content,
              backgroundColor: backgroundColor,
              titleTextStyle: titleTextStyle,
              contentTextStyle: contentTextStyle,
              actionsAlignment: actionsAlignment,
              actionsOverflowAlignment: actionsOverflowAlignment,
              actionsOverflowDirection: actionsOverflowDirection,
              actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
              buttonPadding: buttonPadding,
              elevation: elevation,
              semanticLabel: semanticLabel,
              shape: shape,
              alignment: alignment,
            ),
            CircleAvatar(
                foregroundColor: circleForegroundColor,
                backgroundColor: circleBackgroundColor,
                maxRadius: 30.0,
                child: child),
          ],
        ),
      ],
    );
  }
}
