/* ********************************************************************
 *
 * PageView.builder - 페이지뷰에 들어갈 스크롤 가능한 목록을 만드는 함수
 * Transform - 회전 애니메이션 효과를 구현하는 함수
 *  
 * 2022.08.22  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

class AnimationPageView extends StatelessWidget {
  /// ## AnimationPageView 애니메이션 페이지뷰
  ///
  /// 페이지뷰 위젯에서 페이지 전환 시에 애니메이션 효과를 구현합니다.
  ///
  /// [controller],[currentPageValue], [pages]는 null이 아니어야 합니다.

  const AnimationPageView(
    this.pageview, {
    Key? key,
    required this.controller,
    required this.currentPageValue,
    required this.pages,
  }) : super(key: key);

  /// 페이지뷰의 페이지 화면 전환 시에 방향을 지정합니다.
  final Rotate pageview;

  /// 페이지뷰 위젯을 제어하는 페이지 컨트롤러 입니다.
  final PageController? controller;

  /// 현재 페이지의 값을 지정합니다.
  final double? currentPageValue;

  /// 각 페이지에 들어갈 위젯을 지정합니다.
  final List<Widget>? pages;

  @override
  Widget build(BuildContext context) {
    switch (pageview) {

      /// Rotate.x : 페이지뷰 위젯의 화면을 가로 방향으로 전환
      case Rotate.x:
        return

            /// PageView.builder : 페이지뷰에 들어갈 스크롤이 가능한 목록을 만드는 함수
            PageView.builder(
          controller: controller,
          itemBuilder: (context, position) {
            if (position == currentPageValue!.floor()) {
              return

                  /// Transform : 회전 애니메이션 효과를 구현하는 함수
                  Transform(
                      transform: Matrix4.identity()
                        ..rotateX(currentPageValue! - position),
                      child: pages![position]);
            } else if (position == currentPageValue!.floor() + 1) {
              return Transform(
                transform: Matrix4.identity()
                  ..rotateX(currentPageValue! - position),
                child: pages![position],
              );
            } else {
              return pages![position];
            }
          },
          itemCount: pages!.length,
        );

      /// Rotate.yz : 페이지뷰 위젯의 화면을 세로 방향으로 전환
      case Rotate.yz:
        return

            /// PageView.builder : 페이지뷰에 들어갈 스크롤이 가능한 목록을 만드는 함수
            PageView.builder(
          controller: controller,
          itemBuilder: (context, position) {
            if (position == currentPageValue!.floor()) {
              return Transform(
                  transform: Matrix4.identity()
                    ..rotateY(currentPageValue! - position)
                    ..rotateZ(currentPageValue! - position),
                  child: pages![position]);
            } else if (position == currentPageValue!.floor() + 1) {
              return Transform(
                transform: Matrix4.identity()
                  ..rotateY(currentPageValue! - position)
                  ..rotateZ(currentPageValue! - position),
                child: pages![position],
              );
            } else {
              return pages![position];
            }
          },
          itemCount: pages!.length,
        );
    }
  }
}

enum Rotate { x, yz }
