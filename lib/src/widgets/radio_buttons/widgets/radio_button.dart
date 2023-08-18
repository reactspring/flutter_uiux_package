/* ********************************************************************
 *
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class AgnesRadioButton<T> extends StatefulWidget {
  const AgnesRadioButton({
    Key? key,
    required this.index,
    required this.values,
    this.onChanged,
    required this.groupValue,
    this.toggleable,
    this.width,
    this.height,
    this.radioProperty,
    this.isTile = false,
  }) : super(key: key);

  final T? groupValue;

  /// 인덱스를 지정합니다.
  final int index;

  /// 라디오 버튼에 들어갈 값을 지정합니다.
  final List<T> values;

  /// 라디오 버튼 클릭 시 발생하는 이벤트 입니다.
  final void Function(T?)? onChanged;

  /// 라디오 버튼의 너비를 지정합니다.
  final double? width;

  /// 라디오 버튼의 높이를 지정합니다.
  final double? height;

  /// 라디오 버튼의 속성을 지정합니다.
  final RadioProperty? radioProperty;

  /// 라디오 버튼의 선택 여부를 지정합니다.
  final bool? toggleable;

  /// 목록형 활성화 여부를 지정합니다.
  final bool isTile;

  @override
  State<AgnesRadioButton> createState() => _AgnesRadioButtonState();
}

class _AgnesRadioButtonState<T> extends State<AgnesRadioButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 19.0,
      height: widget.height ?? 19.0,
      child: widget.isTile
          ? AbsorbPointer(
              absorbing: true,
              child: _buildRadioButton(),
            )
          : _buildRadioButton(),
    );
  }

  Widget _buildRadioButton() {
    return Radio<T>(
      /// 만약 _values가 null이면 List<Widget>의 갯수만큼 _values 초기화 합니다.
      /// null이 아니면 _values로 초기화 합니다.
      value: widget.values[widget.index],
      groupValue: widget.groupValue,
      onChanged: widget.isTile
          ? widget.onChanged
          : widget.onChanged != null
              ? (value) {
                  /// 선택된 인덱스, selected상태, bool 상태 리스트 전달 합니다.
                  widget.onChanged!(value);
                }
              : null,
      toggleable: widget.toggleable ?? false,
      mouseCursor: widget.radioProperty?.mouseCursor,
      activeColor: widget.radioProperty?.activeColor,
      fillColor: widget.radioProperty?.fillColor,
      focusColor: widget.radioProperty?.focusColor,
      hoverColor: widget.radioProperty?.hoverColor,
      overlayColor: widget.radioProperty?.overlayColor,
      splashRadius: widget.radioProperty?.splashRadius,
      materialTapTargetSize: widget.radioProperty?.materialTapTargetSize ??
          MaterialTapTargetSize.shrinkWrap,
      visualDensity: widget.radioProperty?.visualDensity,
      focusNode: widget.radioProperty?.focusNode,
      autofocus: widget.radioProperty?.autofocus ?? false,
    );
  }
}
