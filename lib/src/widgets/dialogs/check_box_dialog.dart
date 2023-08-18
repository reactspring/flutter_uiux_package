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

class CheckBoxDialog extends StatefulWidget {
  /// ## CheckBoxDialog 체크박스 다이얼로그
  ///
  /// 체크박스가 있는 다이얼로그를 구현합니다.
  ///
  /// [title], [actions], [itemCount], [checkboxlist]는 null이 아니어야 합니다.

  const CheckBoxDialog({
    Key? key,
    required this.itemCount,
    required this.checkboxlist,
    required this.title,
    required this.actions,
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

  /// 다이얼로그의 그림자 강도를 지정합니다.
  final double? elevation;

  /// 다이얼로그의 테두리 모양을 지정합니다.
  final ShapeBorder? shape;

  /// 다이얼로그에 들어갈 제목의 여백을 지정합니다.
  final EdgeInsetsGeometry? titlePadding;

  /// 다이얼로그에 들어갈 내용의 여백을 지정합니다.
  final EdgeInsetsGeometry contentPadding;

  /// 다이얼로그에 들어갈 버튼의 여백을 지정합니다.
  final EdgeInsetsGeometry? buttonPadding;

  /// 체크박스에 들어갈 내용을 지정합니다.
  final Map<String, bool>? checkboxlist;

  /// 다이얼로그의 스크롤 여부를 지정합니다.
  final bool scrollable;

  /// 다이얼로그의 위치를 지정합니다.
  final AlignmentGeometry? alignment;

  /// 체크박스의 개수를 지정합니다.
  final int? itemCount;

  /// 배치할 위젯들을 지정합니다.
  final List<Widget>? actions;

  /// 배치된 위젯들 사이의 여백을 지정합니다.
  final EdgeInsetsGeometry actionsPadding;

  /// 배치된 위젯들의 위치를 지정합니다.
  final MainAxisAlignment? actionsAlignment;

  @override
  State<CheckBoxDialog> createState() => _CheckBoxDialogState();
}

class _CheckBoxDialogState extends State<CheckBoxDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AlertDialog(
          title: widget.title,
          actions: widget.actions,
          content: Container(
            width: double.minPositive,
            height: 300,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.itemCount,
              itemBuilder: (BuildContext context, int index) {
                String _key = widget.checkboxlist!.keys.elementAt(index);
                return CheckboxListTile(
                  value: widget.checkboxlist![_key],
                  title: Text(_key),
                  onChanged: (val) {
                    setState(() {
                      widget.checkboxlist![_key] = val!;
                    });
                  },
                );
              },
            ),
          ),
          backgroundColor: widget.backgroundColor,
          titlePadding: widget.titlePadding,
          titleTextStyle: widget.titleTextStyle,
          contentTextStyle: widget.contentTextStyle,
          actionsAlignment: widget.actionsAlignment,
          actionsOverflowAlignment: widget.actionsOverflowAlignment,
          actionsOverflowDirection: widget.actionsOverflowDirection,
          actionsOverflowButtonSpacing: widget.actionsOverflowButtonSpacing,
          buttonPadding: widget.buttonPadding,
          elevation: widget.elevation,
          semanticLabel: widget.semanticLabel,
          shape: widget.shape,
          alignment: widget.alignment,
        ),
      ],
    );
  }
}
