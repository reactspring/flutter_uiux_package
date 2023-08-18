/* ********************************************************************
 *
 * Dialog - 기본 다이얼로그
 *  
 * 2022.08.19  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

class DividedDialog extends StatelessWidget {
  /// ## DividedDialog 위-아래 구분선이 있는 다이얼로그
  ///
  /// 위-아래 구분선이 있는 다이얼로그를 구현합니다.
  ///
  /// [title], [topColor], [bottomColor], [buttonText]는 null이 아니어야 합니다.

  const DividedDialog({
    Key? key,
    this.content,
    this.actions,
    this.height,
    this.children,
    required this.title,
    required this.bottomColor,
    required this.topColor,
    required this.buttonText,
    this.buttonTextColor,
    this.buttonColor,
    this.onPressed,
  }) : super(key: key);

  /// 다이얼로그의 윗 부분 배경 색상을 지정합니다.
  final Color? topColor;

  /// 다이얼로그의 아랫 부분 배경 색상을 지정합니다.
  final Color? bottomColor;

  /// 다이얼로그의 버튼 색상을 지정합니다.
  final Color? buttonColor;

  /// 다이얼로그의 버튼 텍스트 색상을 지정합니다.
  final Color? buttonTextColor;

  /// 다이얼로그의 버튼에 들어갈 텍스트 입니다.
  final String? buttonText;

  /// 다이얼로그에 들어갈 제목을 입력합니다.
  final Widget? title;

  /// 다이얼로그에 들어갈 내용을 입력합니다.
  final Widget? content;

  /// 다이얼로그의 높이를 지정합니다.
  final double? height;

  /// 다이얼로그에 들어갈 위젯을 지정합니다.
  final List<Widget>? children;

  /// 배치할 위젯들을 지정합니다.
  final Widget? actions;

  /// 위젯 클릭 시에 발생하는 이벤트를 지정합니다.
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(),
      child: Container(
        color: topColor,
        height: height,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(15)),
            title!,
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(10), color: topColor, child: content),
            ),
            Expanded(
              child: Container(
                color: bottomColor,
                child: SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                          ),
                          child: Text(
                            buttonText!,
                            style: TextStyle(color: buttonTextColor),
                          ),
                          onPressed: onPressed,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
