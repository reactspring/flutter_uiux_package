/* ********************************************************************
 *
 * StepProgressIndicator - 선형 단계 로딩바를 구현하는 함수
 *  
 * 2022.08.25  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

enum StepLoading {
  /// [totalSteps], [currentStep]은 null이 아니어야 합니다.
  selected,

  /// [totalSteps], [currentStep]은 null이 아니어야 합니다.
  line,

  /// [child]에 로딩바에 들어갈 아이콘 위젯을 지정합니다.
  ///
  /// [totalSteps], [currentStep], [child]은 null이 아니어야 합니다.
  icon,

  /// [totalSteps], [currentStep]은 null이 아니어야 합니다.
  customsize,

  /// [totalSteps], [currentStep], [roundedEdges]은 null이 아니어야 합니다.
  gradient
}

class StepLoadings extends StatelessWidget {
  /// ## StepLoadings 단계 로딩바
  ///
  /// 단계 로딩바를 구현합니다.
  ///
  /// [totalSteps], [currentStep]는 null이 아니어야 합니다.

  const StepLoadings(
    this.steploading, {
    Key? key,
    required this.totalSteps,
    required this.currentStep,
    this.selectedSize,
    this.unselectedSize,
    this.selectedColor,
    this.unselectedColor,
    this.roundedEdges,
    this.size,
    this.selectedIcon,
    this.unselecdtedIcon,
    this.selectedGradientColor,
    this.unselectedGradientColor,
  }) : super(key: key);

  final StepLoading steploading;

  /// 로딩바의 총 단계를 지정합니다.
  final int? totalSteps;

  /// 로딩바의 현재 단계를 지정합니다.
  final int? currentStep;

  /// 로딩바의 크기를 지정합니다.
  final double? size;

  /// 증가한 단계를 보여주는 로딩바의 크기를 지정합니다.
  final double? selectedSize;

  /// 남은 단계를 보여주는 로딩바의 색상을 지정합니다.
  final double? unselectedSize;

  /// 증가한 단계를 보여주는 로딩바의 색상을 지정합니다.
  final Color? selectedColor;

  /// 남은 단계를 보여주는 로딩바의 색상을 지정합니다.
  final Color? unselectedColor;

  /// 증가한 단계를 보여주는 로딩바에 들어갈 아이콘을 지정합니다.
  final Widget? selectedIcon;

  /// 남은 단계를 보여주는 로딩바에 들어갈 아이콘을 지정합니다.
  final Widget? unselecdtedIcon;

  /// 증가한 단계를 보여주는 로딩바에 들어갈 그라데이션 색상을 지정합니다.
  final Gradient? selectedGradientColor;

  /// 남은 단계를 보여주는 로딩바에 들어갈 그라데이션 색상을 지정합니다.
  final Gradient? unselectedGradientColor;

  /// 로딩바의 테두리 둥글기를 지정합니다.
  final Radius? roundedEdges;

  @override
  Widget build(BuildContext context) {
    switch (steploading) {
      case StepLoading.selected:
        return

            /// StepProgressIndicator : 선형 단계 로딩바를 구현하는 함수
            StepProgressIndicator(
                totalSteps: totalSteps!,
                currentStep: currentStep!,
                selectedSize: selectedSize,
                unselectedSize: unselectedSize,
                selectedColor: selectedColor!,
                unselectedColor: unselectedColor!,
                roundedEdges: roundedEdges);

      case StepLoading.line:
        return StepProgressIndicator(
          totalSteps: totalSteps!,
          currentStep: currentStep!,
          size: size!,
          padding: 0,
        );

      case StepLoading.icon:
        return StepProgressIndicator(
            totalSteps: totalSteps!,
            currentStep: currentStep!,
            size: size!,
            selectedColor: selectedColor!,
            unselectedColor: unselectedColor!,
            customStep: (index, color, _) => color == selectedColor!
                ? Container(color: color, child: selectedIcon)
                : Container(color: color, child: unselecdtedIcon));

      case StepLoading.customsize:
        return StepProgressIndicator(
          totalSteps: totalSteps!,
          currentStep: currentStep!,
          selectedColor: selectedColor!,
          unselectedColor: unselectedColor!,
          customSize: (index, isSize) => (index + 1) * 10.0,
        );

      case StepLoading.gradient:
      default:
        return StepProgressIndicator(
            totalSteps: totalSteps!,
            currentStep: currentStep!,
            size: size!,
            padding: 0,
            selectedColor: selectedColor!,
            unselectedColor: unselectedColor!,
            roundedEdges: roundedEdges,
            selectedGradientColor: selectedGradientColor,
            unselectedGradientColor: unselectedGradientColor);
    }
  }
}
