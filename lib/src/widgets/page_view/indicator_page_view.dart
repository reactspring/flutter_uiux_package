/* ********************************************************************
 *
 * PageView - 한 화면에서 여러 페이지를 넘겨볼 수 있도록 구현하는 함수
 * SmoothPageIndicator - 인디케이터로 페이지뷰 화면을 제어하는 함수
 *  
 * 2022.08.22  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndicatorPageView extends StatefulWidget {
  /// ## IndicatorPageView 인디케이터 페이지뷰
  ///
  /// 페이지뷰 위젯에서 페이지 전환 시에 인디케이터를 사용해 페이지를 전환합니다.
  ///
  /// [children],[count]는 null이 아니어야 합니다.

  const IndicatorPageView({
    Key? key,
    required this.children,
    required this.count,
    this.offset,
    this.dotWidth,
    this.dotHeight,
    this.spacing,
    this.radius,
    this.dotColor,
    this.activeDotColor,
    this.strokeWidth,
    this.paintStyle,
    this.type,
    this.scrollDirection,
    this.height,
    this.padding,
  }) : super(key: key);

  /// 인디케이터 점의 너비를 지정합니다.
  final double? dotWidth;

  /// 인디케이터 점의 높이를 지정합니다.
  final double? dotHeight;

  /// 인디케이터 점 사이의 간격을 지정합니다.
  final double? spacing;

  /// 인디케이터 점의 둥글기를 지정합니다.
  final double? radius;

  /// 인디케이터 점의 색상을 지정합니다.
  final Color? dotColor;

  /// 선택된 인디케이터 점의 색상을 지정합니다.
  final Color? activeDotColor;

  /// 페이지뷰의 페이지 개수를 지정합니다.
  final int? count;

  /// 인디케이터의 높이를 지정합니다.
  final double? height;

  /// 인디케이터의 좌표를 지정합니다.
  final double? offset;

  /// 페이지뷰와 인디케이터 사이의 여백을 지정합니다.
  final EdgeInsetsGeometry? padding;

  /// 화면 스크롤 방향을 지정합니다.
  final Axis? scrollDirection;

  /// 인디케이터 점의 타입을 지정합니다.
  final WormType? type;

  /// 페이지뷰 위젯에 들어갈 위젯을 지정합니다.
  final List<Widget>? children;

  /// 인디케이터 점의 색상 채우기 여부를 지정합니다.
  final PaintingStyle? paintStyle;

  /// 인디케이터 점의 획폭을 지정합니다.
  final double? strokeWidth;

  @override
  State<IndicatorPageView> createState() => _IndicatorPageViewState();
}

class _IndicatorPageViewState extends State<IndicatorPageView> {
  // PageController : [PageController]로 페이지뷰 위젯을 제어하는 컨트롤러
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: widget.height,
              child:

                  /// PageView : 한 화면에서 여러 페이지를 넘겨볼 수 있도록 구현하는 함수
                  PageView(
                      pageSnapping: true,
                      scrollDirection: widget.scrollDirection!,
                      controller: controller,
                      children: widget.children!),
            ),
            Padding(padding: widget.padding!),

            /// SmoothPageIndicator : 인디케이터로 페이지뷰 화면을 제어하는 함수
            SmoothPageIndicator(
              controller: controller,
              count: widget.count!,
              effect:

                  /// WormEffect : 인디케이터 점의 스타일을 지정하는 함수
                  WormEffect(
                      dotHeight: widget.dotHeight!,
                      dotWidth: widget.dotWidth!,
                      dotColor: widget.dotColor!,
                      activeDotColor: widget.activeDotColor!,
                      type: widget.type!,
                      offset: widget.offset!,
                      spacing: widget.spacing!,
                      radius: widget.radius!,
                      strokeWidth: widget.strokeWidth!,
                      paintStyle: widget.paintStyle!),
            ),
          ],
        ),
      ),
    );
  }
}
