/* ********************************************************************
 *
 * SliverAppBarDelegate - 슬리버의 앱 바 부분의 스타일을 지정하는 함수
 *  
 * 2022.08.25  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'dart:math' as math;
import 'package:flutter/material.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  /// ## SliverAppBar 슬리버 앱 바
  ///
  /// 슬리버의 앱 바 부분의 스타일을 지정합니다.
  ///
  /// [child], [minHeight], [maxHeight]는 null이 아니어야 합니다.
  SliverAppBarDelegate({
    Key? key,
    required this.child,
    required this.minHeight,
    required this.maxHeight,
  });

  /// 최소 높이를 지정합니다.
  final double minHeight;

  /// 최대 높이를 지정합니다.
  final double maxHeight;

  /// 슬리버 위젯에 들어갈 위젯을 지정합니다.
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override

  /// SliverAppBarDelegate : 슬리버의 앱바 부분의 스타일을 지정하는 함수
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
