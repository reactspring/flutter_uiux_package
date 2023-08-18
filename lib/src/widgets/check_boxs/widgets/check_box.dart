import 'package:flutter/material.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class AgnesCheckBox extends StatefulWidget {
  final int index;
  final List<bool?>? values;
  final void Function(bool?)? onChanged;
  final bool? tristate;
  final double? width;
  final double? height;
  final bool isTile;
  final CheckBoxProperty? checkBoxProperty;

  const AgnesCheckBox({
    Key? key,
    required this.index,
    this.values,
    required this.onChanged,
    this.tristate,
    this.width,
    this.height,
    this.isTile = false,
    this.checkBoxProperty,
  }) : super(key: key);

  @override
  State<AgnesCheckBox> createState() => _AgnesCheckBoxState();
}

class _AgnesCheckBoxState extends State<AgnesCheckBox> {
  @override
  void initState() {
    super.initState();
    if (!widget.tristate!) {
      // tristate가 false일 때 null 값이 들어올 경우 false로 초기화
      widget.values![widget.index] = widget.values![widget.index] ?? false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width ?? 20.0,
        height: widget.height ?? 20.0,
        child: widget.isTile
            ? AbsorbPointer(absorbing: true, child: _buildCheckBox())
            : _buildCheckBox());
  }

  Widget _buildCheckBox() {
    return Checkbox(
      // 만약 _values가 null이면 List<Widget>의 갯수만큼 _values 초기화
      // null이 아니면 _values로 초기화
      value: widget.values![widget.index],
      tristate: widget.tristate!,
      onChanged: widget.isTile
          ? widget.onChanged
          : widget.onChanged != null
              ? (selected) {
                  // 선택된 인덱스, selected상태, bool 상태 리스트 전달
                  widget.onChanged!(selected);
                }
              : null,
      mouseCursor: widget.checkBoxProperty?.mouseCursor,
      activeColor: widget.checkBoxProperty?.activeColor,
      fillColor: widget.checkBoxProperty?.fillColor,
      checkColor: widget.checkBoxProperty?.checkColor,
      focusColor: widget.checkBoxProperty?.focusColor,
      hoverColor: widget.checkBoxProperty?.hoverColor,
      overlayColor: widget.checkBoxProperty?.overlayColor,
      splashRadius: widget.checkBoxProperty?.splashRadius,
      materialTapTargetSize: widget.checkBoxProperty?.materialTapTargetSize ??
          MaterialTapTargetSize.shrinkWrap,
      visualDensity: widget.checkBoxProperty?.visualDensity,
      focusNode: widget.checkBoxProperty?.focusNode,
      autofocus: widget.checkBoxProperty?.autofocus ?? false,
      shape: widget.checkBoxProperty?.shape,
      side: widget.checkBoxProperty?.side,
    );
  }
}
