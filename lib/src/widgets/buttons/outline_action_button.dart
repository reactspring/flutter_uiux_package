/* ********************************************************************
 *
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

const borderSize = 0.5;
const borderOpacity = 0.3;

class OutlineActionButton extends StatelessWidget {
  /// ## OutlineActionButton
  ///
  /// 테두리의 스타일을 지정할 수 있는 버튼을 구현합니다.
  ///
  /// [title], [onPressed]은 null이 아니어야 합니다.

  OutlineActionButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.icon,
    this.iconSemanticsLabel,
    this.minWidth,
    this.color,
    this.disabled,
  }) : super(key: key);

  /// 버튼에 들어갈 텍스트를 입력합니다.
  final String title;

  /// 버튼에 들어갈 아이콘을 지정합니다.
  final String? icon;

  /// 아이콘의 라벨에 들어갈 텍스트를 지정합니다.
  final String? iconSemanticsLabel;

  /// 버튼의 최소 너비를 지정합니다.
  final double? minWidth;

  /// 버튼의 색상을 지정합니다.
  final Color? color;

  /// 버튼의 활성화 여부를 지정합니다.
  final bool? disabled;

  /// 버튼 클릭 시 발생하는 이벤트를 지정합니다.
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var button = icon == null
        ? MaterialButton(
            color: color ?? Colors.white,
            minWidth: minWidth ?? AGNESDimens.zero,
            height: AGNESDimens.zero,
            padding: EdgeInsets.symmetric(
              horizontal: AGNESSpacing.spacing_8,
              vertical: AGNESSpacing.spacing_8 / 2,
            ),
            elevation: AGNESDimens.zero,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: borderSize, color: Colors.black),
            ),
            onPressed:
                (disabled != null && disabled == true) ? null : onPressed,
            child: Text(title),
          )
        : ElevatedButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).dividerTheme.color,
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: borderSize,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              // color: Colors.white,
            ),
            onPressed:
                (disabled != null && disabled == true) ? null : onPressed,
            icon: SvgPicture.asset(
              icon!,
              semanticsLabel: iconSemanticsLabel,
              width: AGNESSpacing.spacing_20,
            ),
            label: Text(
              title,
              style: TextStyle(color: Colors.black),
            ),
          );

    return Container(
      child: button,
    );
  }
}
