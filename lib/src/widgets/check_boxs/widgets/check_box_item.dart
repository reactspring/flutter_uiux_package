import 'package:flutter/material.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class AgnesCheckBoxItem extends StatelessWidget {
  final int? index;
  final List<bool?>? values;
  final List<Widget>? widgets;
  final List<String>? labels;
  final void Function(bool?)? onChanged;
  final AgnesWidgetPosition? position;
  final MainAxisAlignment? mainGroupAlignment;
  final CrossAxisAlignment? crossGroupAlignment;
  final double? width;
  final double? height;
  final double? betweenSpace;
  final EdgeInsets? padding;
  final bool? tristate;
  final TextStyle? textStyle;
  final CheckBoxProperty? checkBoxProperty;
  final bool isTile;
  final MainAxisSize mainAxisSize;
  const AgnesCheckBoxItem({
    Key? key,
    required this.index,
    this.values,
    this.widgets,
    this.labels,
    required this.onChanged,
    this.position,
    this.mainGroupAlignment,
    this.crossGroupAlignment,
    this.width,
    this.height,
    this.betweenSpace,
    this.padding,
    this.tristate,
    this.textStyle,
    this.checkBoxProperty,
    this.isTile = false,
    this.mainAxisSize = MainAxisSize.max,
  }) : super(key: key);

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
      AgnesCheckBox(
        index: index,
        onChanged: isTile
            ? onChanged
            : onChanged != null
                ? (selected) {
                    onChanged!(selected);
                  }
                : null,
        width: width,
        height: height,
        values: values,
        tristate: tristate,
        isTile: isTile,
        checkBoxProperty: checkBoxProperty,
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
                : index != values!.length - 1
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
                : index != values!.length - 1
                    ? padding!
                    : EdgeInsets.zero,
            child: Row(
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
