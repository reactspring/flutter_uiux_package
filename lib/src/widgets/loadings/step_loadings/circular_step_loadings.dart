/* ********************************************************************
 *
 * CircularStepProgressIndicator - 원형 단계 로딩바를 구현하는 함수
 *  
 * 2022.08.25  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

enum CircularStepLoading {
  /// [totalSteps], [currentStep]은 null이 아니어야 합니다.
  standard,

  /// [toalSteps], [currentStep]은 null이 아니어야 합니다.
  color,

  /// [totalSteps], [currentStep]은 null이 아니어야 합니다.
  selected,

  /// [totalSteps], [currentStep], [roundedCap]은 null이 아니어야 합니다.
  roundedcap,

  /// [child]에 로딩바에 들어갈 아이콘 위젯을 지정합니다.
  ///
  /// [totalSteps], [currentStep], [child]은 null이 아니어야 합니다.
  icon
}

class CircularStepLoadings extends StatelessWidget {
  /// ## CircularStepLoadings 원형 단계 로딩바
  ///
  /// 원형 단계 로딩바를 구현합니다.
  ///
  /// [totalSteps], [currentStep]는 null이 아니어야 합니다.

  const CircularStepLoadings(
    this.circularsteploading, {
    Key? key,
    required this.totalSteps,
    required this.currentStep,
    this.width,
    this.height,
    this.selectedColor,
    this.unselectedColor,
    this.selectedStepSize,
    this.gradientColor,
    this.stepSize,
    this.roundedCap,
    this.child,
    this.unselectedStepSize,
  }) : super(key: key);

  final CircularStepLoading circularsteploading;

  /// 로딩바의 총 단계를 지정합니다.
  final int? totalSteps;

  /// 로딩바의 현재 단계를 지정합니다.
  final int? currentStep;

  /// 로딩바의 너비를 지정합니다.
  final double? width;

  /// 로딩바의 높이를 지정합니다.
  final double? height;

  /// 로딩바에서 각 단계의 크기를 지정합니다.
  final double? stepSize;

  /// 증가한 단계를 보여주는 로딩바의 색상을 지정합니다.
  final Color? selectedColor;

  /// 남은 단계를 보여주는 로딩바의 색상을 지정합니다.
  final Color? unselectedColor;

  /// 증가한 단계를 보여주는 로딩바의 크기를 지정합니다.
  final double? selectedStepSize;

  /// 남은 단계를 보여주는 로딩바의 크기를 지정합니다.
  final double? unselectedStepSize;

  /// 로딩바의 그라데이션 색상을 지정합니다.
  final Gradient? gradientColor;

  /// 라운드 캡 적용 여부를 지정합니다.
  final bool? roundedCap;

  /// 로딩바에 들어갈 위젯을 지정합니다.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    switch (circularsteploading) {
      case CircularStepLoading.standard:
        return

            /// CircularStepProgressIndicator : 원형 단계 로딩바를 구현하는 함수
            CircularStepProgressIndicator(
          totalSteps: totalSteps!,
          currentStep: currentStep!,
          width: width,
          height: height,
          roundedCap: (_, isSelected) => isSelected,
        );

      case CircularStepLoading.color:
        return CircularStepProgressIndicator(
            totalSteps: totalSteps!,
            currentStep: currentStep!,
            selectedColor: selectedColor,
            unselectedColor: unselectedColor,
            selectedStepSize: selectedStepSize,
            width: width,
            height: height,
            gradientColor: gradientColor);

      case CircularStepLoading.selected:
        return CircularStepProgressIndicator(
            totalSteps: totalSteps!,
            currentStep: currentStep!,
            padding: math.pi / 15,
            selectedColor: selectedColor,
            unselectedColor: unselectedColor,
            selectedStepSize: selectedStepSize,
            unselectedStepSize: unselectedStepSize,
            width: width,
            height: height);

      case CircularStepLoading.roundedcap:
        return CircularStepProgressIndicator(
          totalSteps: totalSteps!,
          currentStep: currentStep!,
          stepSize: stepSize!,
          selectedColor: selectedColor,
          unselectedColor: unselectedColor,
          padding: 0,
          width: width,
          height: height,
          selectedStepSize: selectedStepSize,
          roundedCap: (_, __) => roundedCap!,
        );

      case CircularStepLoading.icon:
      default:
        return CircularStepProgressIndicator(
          totalSteps: totalSteps!,
          currentStep: currentStep!,
          selectedColor: selectedColor,
          unselectedColor: unselectedColor,
          padding: 0,
          width: width,
          child: child,
        );
    }
  }
}
