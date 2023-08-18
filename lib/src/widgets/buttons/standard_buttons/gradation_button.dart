/* ********************************************************************
 *
 * StandardButton - 기본 버튼을 구현하는 함수
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';
import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class GradationButton extends StatefulWidget {
  /// ## GradationButton 그라데이션 버튼
  ///
  /// 그라데이션 스타일 적용이 가능한 버튼을 구현합니다.
  ///
  /// [onPressed]는 null이 아니어야 합니다.

  const GradationButton({
    Key? key,
    required this.onPressed,
    this.title,
    this.width,
    this.height,
    this.opacity,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.borderColor,
    this.titleColor,
    this.tappedTitleColor,
    this.gradientColors,
    this.gradientSplashColors,
    this.beginGradient,
    this.endGradient,
    this.beginGradientSplash,
    this.endGradientSplash,
    this.shadows,
    this.splashShadows,
    this.titleSize,
    this.borderRadius,
    this.fontWeight,
    this.borderWidth,
    this.alignment,
    this.child,
    this.childSplash,
  }) : super(key: key);

  /// 버튼에 들어갈 텍스트를 입력합니다.
  final String? title;

  /// 버튼의 너비를 지정합니다.
  final double? width;

  /// 버튼의 높이를 지정합니다.
  final double? height;

  /// 버튼의 투명도를 지정합니다.
  final double? opacity;

  /// 버튼 클릭 시 발생하는 이벤트를 지정합니다.
  final Function onPressed;

  /// 버튼을 탭했을 때 발생하는 이벤트를 지정합니다.
  final VoidCallback? onTap;

  /// 버튼을 길게 클릭 시 발생하는 이벤트를 지정합니다.
  final VoidCallback? onLongPress;

  /// 버튼을 더블탭하면 발생하는 이벤트를 지정합니다.
  final VoidCallback? onDoubleTap;

  /// 버튼의 테두리 색상을 지정합니다.
  final Color? borderColor;

  /// 버튼에 들어갈 텍스트 색상을 지정합니다.
  final Color? titleColor;

  /// 버튼을 탭했을 떄 보여지는 제목 색상을 지정합니다.
  final Color? tappedTitleColor;

  /// 버튼의 그라데이션 색상을 지정합니다.
  final List<Color>? gradientColors;

  /// 버튼의 스플래시 효과에 적용할 그라데이션 색상 목록을 지정합니다.
  final List<Color>? gradientSplashColors;

  /// 버튼의 그라데이션 시작 부분의 색상을 지정합니다.
  final Alignment? beginGradient;

  /// 버튼의 그라데이션 끝 부분의 색상을 지정합니다.
  final Alignment? endGradient;

  /// 버튼의 스플래시 효과에 적용할 그라데이션의 처음 부분 위치를 지정합니다.
  final Alignment? beginGradientSplash;

  /// 버튼의 스플래시 효과에 적용할 그라데이션의 끝 부분 위치를 지정합니다.
  final Alignment? endGradientSplash;

  /// 버튼의 그림자 스타일을 지정합니다.
  final List<BoxShadow>? shadows;

  /// 버튼의 스플래시 효과에 적용할 그림자 스타일을 지정합니다.
  final List<BoxShadow>? splashShadows;

  /// 버튼에 들어갈 텍스트 크기를 지정합니다.
  final double? titleSize;

  /// 버튼에 들어갈 텍스트의 두께를 지정합니다.
  final FontWeight? fontWeight;

  /// 버튼의 테두리 둥글기를 지정합니다.
  final double? borderRadius;

  /// 버튼의 테두리 두께를 지정합니다.
  final double? borderWidth;

  /// 버튼의 위치를 지정합니다.
  final Alignment? alignment;

  /// 버튼에 들어갈 위젯을 지정합니다.
  final Widget? child;

  /// 버튼의 스플래시 효과 적용 시에 보여지는 위젯을 지정합니다.
  final Widget? childSplash;

  @override
  State<GradationButton> createState() => _GradationButtonState();
}

class _GradationButtonState extends State<GradationButton> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        StandardButton(
          onPressed: () {
            Toast.info(context, message: 'Gradation Button');
          },
          onTap: () {},
          title: 'Gradation Button',
          child: Container(
            constraints: BoxConstraints(maxWidth: width * 0.8, minHeight: 40.0),
            alignment: Alignment.center,
            child: Text(
              "Gradation Button",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          borderRadius: 80.0,
          gradientColors: [Color.fromARGB(255, 60, 144, 192), Colors.white],
          beginGradient: Alignment.centerLeft,
          endGradient: Alignment.centerRight,
          borderColor: Colors.white,
        ),
      ],
    );
  }
}
