/* ********************************************************************
 *
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class AgnesRadioButtonItem<T> extends StatelessWidget {
  const AgnesRadioButtonItem({
    Key? key,
    required this.index,
    required this.values,
    this.widgets,
    this.labels,
    this.onChanged,
    required this.groupValue,
    this.position,
    this.mainAxisSize = MainAxisSize.max,
    this.mainGroupAlignment,
    this.crossGroupAlignment,
    this.width,
    this.height,
    this.betweenSpace,
    this.padding,
    this.textStyle,
    this.radioProperty,
    this.isTile = false,
    this.showRadio,
  }) : super(key: key);

  final T? groupValue;

  /// 인덱스를 지정합니다.
  final int? index;

  /// 라디오 버튼에 들어갈 값을 지정합니다.
  final List<T> values;

  /// 라디오 버튼에 들어갈 위젯을 지정합니다.
  final List<Widget>? widgets;

  /// 라벨에 들어갈 텍스트를 지정합니다.
  final List<String>? labels;

  /// 라디오 버튼 클릭 시에 발생하는 이벤트를 지정합니다.
  final void Function(T?)? onChanged;

  /// 라디오 버튼의 위치를 지정합니다.
  final AgnesWidgetPosition? position;

  /// 라디오 버튼의 크기를 지정합니다.
  final MainAxisSize mainAxisSize;

  /// 라디오 버튼 그룹의 세로축 정렬 값을 지정합니다.
  final MainAxisAlignment? mainGroupAlignment;

  /// 라디오 버튼 그룹의 가로축 정렬 값을 지정합니다.
  final CrossAxisAlignment? crossGroupAlignment;

  /// 라디오 버튼의 너비를 지정합니다.
  final double? width;

  /// 라디오 버튼의 높이를 지정합니다.
  final double? height;

  /// 라디오 버튼 사이 여백을 지정합니다.
  final double? betweenSpace;

  /// 라디오 버튼의 여백을 지정합니다.
  final EdgeInsets? padding;

  /// 텍스트의 스타일을 지정합니다.
  final TextStyle? textStyle;

  /// 라디오 버튼의 속성을 지정합니다.
  final RadioProperty? radioProperty;

  /// 목록형 활성화 여부를 지정합니다.
  final bool isTile;

  /// 라디오버튼 활성화 여부를 지정합니다.
  final bool? showRadio;

  List<Widget> _children(int index) {
    return [
      if (position == AgnesWidgetPosition.left ||
          position == AgnesWidgetPosition.top)
        labels != null
            ? Text(
                labels![index],
                style: textStyle,
              )
            : widgets![index],
      if (position == AgnesWidgetPosition.left ||
          position == AgnesWidgetPosition.top)
        position == AgnesWidgetPosition.left
            ? SizedBox(width: betweenSpace)
            : SizedBox(height: betweenSpace),
      Visibility(
        visible: showRadio!,
        child: AgnesRadioButton<T>(
          index: index,
          values: values,
          onChanged: isTile
              ? onChanged
              : onChanged != null
                  ? (value) {
                      onChanged!(value);
                    }
                  : null,
          groupValue: groupValue,
          width: width,
          height: height,
          radioProperty: radioProperty,
          isTile: isTile,
        ),
      ),
      if (position == AgnesWidgetPosition.right ||
          position == AgnesWidgetPosition.bottom)
        position == AgnesWidgetPosition.right
            ? SizedBox(width: betweenSpace)
            : SizedBox(height: betweenSpace),
      if (position == AgnesWidgetPosition.right ||
          position == AgnesWidgetPosition.bottom)
        labels != null
            ? Text(
                labels![index],
                style: textStyle,
              )
            : widgets![index],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return position == AgnesWidgetPosition.left ||
            position == AgnesWidgetPosition.right
        ? Padding(
            padding: isTile
                ? padding!
                : index != values.length - 1
                    ? padding!
                    : EdgeInsets.zero,
            child: Row(
              mainAxisSize: mainAxisSize,
              mainAxisAlignment: mainGroupAlignment!,
              crossAxisAlignment: crossGroupAlignment!,
              children: _children(index!),
            ),
          )
        : Padding(
            padding: isTile
                ? padding!
                : index != values.length - 1
                    ? padding!
                    : EdgeInsets.zero,
            child: Row(
              /// wrap에서 width의 size를 위젯의 크기만큼 지정하기 위해 사용합니다.
              mainAxisSize: mainAxisSize,
              children: [
                Column(
                  mainAxisAlignment: mainGroupAlignment!,
                  crossAxisAlignment: crossGroupAlignment!,
                  children: _children(index!),
                ),
              ],
            ),
          );
  }
}
