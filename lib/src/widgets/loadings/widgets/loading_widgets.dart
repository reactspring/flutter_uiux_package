/* ********************************************************************
 *
 * LoadingIndicator - 로딩바를 구현하는 함수
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

import 'package:loading_indicator/loading_indicator.dart';

class LoadingWidgets extends StatefulWidget {
  /// ## LoadingWidgets 로딩 위젯
  ///
  /// 로딩바를 구현합니다.

  LoadingWidgets({
    this.key,
    this.indicator = Indicator.ballPulse,
    this.colors,
    this.strokeWidth = 2.0,
    this.backgroundColor = Colors.transparent,
    this.pathBackgroundColor = Colors.black,
    this.width = 50,
    this.height = 50,
    this.isCenter = true,
  }) : super(key: key);

  final Key? key;

  /// 로딩바를 지정합니다.
  final Indicator? indicator;

  /// 색상 목록을 지정합니다.
  final List<Color>? colors;

  /// 너비를 지정합니다.
  final double? strokeWidth;

  /// 배경 색상을 지정합니다.
  final Color? backgroundColor;

  /// 배경 색상을 지정합니다.
  final Color? pathBackgroundColor;

  /// 너비를 지정합니다.
  final double? width;

  /// 높이를 지정합니다.
  final double? height;

  /// 중앙 정렬 여부를 지정합니다.
  final bool? isCenter;

  @override
  State<LoadingWidgets> createState() => _LoadingWidgetsState();
}

class _LoadingWidgetsState extends State<LoadingWidgets> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isCenter!
        ? Center(
            child: Container(
              width: widget.width,
              height: widget.height,
              child: LoadingIndicator(
                  indicatorType: widget.indicator!,
                  colors: widget.colors ?? [Colors.grey],
                  strokeWidth: widget.strokeWidth,
                  backgroundColor: widget.backgroundColor,
                  pathBackgroundColor: widget.pathBackgroundColor),
            ),
          )
        : Container(
            width: widget.width,
            height: widget.height,
            child: LoadingIndicator(
                indicatorType: widget.indicator!,
                colors: widget.colors ?? [Colors.grey],
                strokeWidth: widget.strokeWidth,
                backgroundColor: widget.backgroundColor,
                pathBackgroundColor: widget.pathBackgroundColor),
          );
  }
}
