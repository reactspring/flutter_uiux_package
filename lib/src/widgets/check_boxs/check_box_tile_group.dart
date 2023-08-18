// ignore_for_file: deprecated_member_use

/* ********************************************************************
 *
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class AgnesCheckBoxTileGroup extends StatefulWidget {
  /// 텍스트 형식으로 추가하려면 labels에 값을 주면 된다.
  /// 위젯 형식으로 추가하려면 widgets에 값을 주면 된다.
  /// 1. 원하는 체크박스 레이아웃이
  ///   [AgnesGroupType.Row], [AgnesGroupType.Column],
  ///   [AgnesGroupType.Wrap]
  ///    중 무엇인지 정합니다.
  /// 2. 내부의 체크박스 레이아웃이 [Row], [Column]
  ///    중 무엇인지 정합니다.
  /// 3. 텍스트나 위젯들의 위치가 체크박스를 기준으로
  ///   [AgnesWidgetPosition.left], [AgnesWidgetPosition.right]
  ///   [AgnesWidgetPosition.bottom], [AgnesWidgetPosition.top]
  ///   중 무엇인지 정합니다.
  /// 4. [padding] 속성 값으로 내부 체크박스의
  ///    공간을 지정합니다.(innerSpace innerRunSpace)
  /// 5. [spacing], [runSpacing] 속성 값으로 체크박스 컴포넌트 배열 사이의
  ///    공간을 지정합니다.
  /// 6. 위젯 리스트를 작성하고 onChanged 메소드를 callBack해
  ///    사용합니다.
  ///

  /// 체크박스의 체크 여부를 지정합니다.
  final List<bool?>? values;

  /// 체크박스에 들어갈 위젯을 지정합니다.
  final List<Widget>? widgets;

  /// 체크박스 라벨에 들어갈 텍스트를 지정합니다.
  final List<String>? labels;

  /// 체크박스 클릭 시에 발생하는 이벤트를 지정합니다.
  final void Function(bool?, int, List<bool?>?)? onChanged;

  /// 체크박스에 대시 표시 활성화 여부를 지정합니다.
  final bool tristate;

  /// 체크박스의 위치를 지정합니다.
  final AgnesWidgetPosition position;

  /// 체크박스 그룹의 유형을 지정합니다.
  final AgnesGroupType groupType;

  /// 체크박스의 크기를 지정합니다.
  final MainAxisSize mainAxisSize;

  /// 체크박스 그룹의 세로축 정렬값을 지정합니다.
  final MainAxisAlignment mainGroupAlignment;

  /// 체크박스 그룹의 가로축 정렬값을 지정합니다.
  final CrossAxisAlignment crossGroupAlignment;

  /// 체크박스 그룹의 위치를 지정합니다.
  final WrapAlignment groupRunAlignment;

  /// 체크박스의 방향을 지정합니다.
  final Axis? direction;

  /// 체크박스의 여백을 지정합니다.
  final double? spacing;

  /// 체크박스의 여백을 지정합니다.
  final double? runSpacing;

  /// 체크박스의 활성화 여부를 지정합니다.
  final bool enabled;

  /// 체크박스의 너비를 지정합니다.
  final double? width;

  /// 체크박스의 높이를 지정합니다.
  final double? height;

  /// 체크박스에 들어갈 위젯들 사이의 여백을 지정합니다.
  final double? betweenSpace;

  /// 체크박스의 여백을 지정합니다.
  final EdgeInsets padding;

  /// 터치 불가 부분의 여백을 지정합니다.
  final EdgeInsets? unTouchablePadding;

  /// 체크박스에 들어갈 텍스트의 스타일을 지정합니다.
  final TextStyle? textStyle;

  /// 속성을 지정합니다.
  final InkwellProperty? inkwellProperty;

  /// 체크박스에 들어갈 속성을 지정합니다.
  final CheckBoxProperty? checkBoxProperty;

  AgnesCheckBoxTileGroup({
    Key? key,
    this.labels,
    this.widgets,
    /// null일 경우 labels나 widgets의 값으로 초기화
    this.values,
    this.onChanged,
    this.tristate = false,
    this.position = AgnesWidgetPosition.left,
    this.groupType = AgnesGroupType.row,
    this.mainAxisSize = MainAxisSize.max,
    this.mainGroupAlignment = MainAxisAlignment.start,
    this.crossGroupAlignment = CrossAxisAlignment.start,
    this.groupRunAlignment = WrapAlignment.start,
    this.direction,
    this.spacing = 0.0,
    this.runSpacing = 0.0,
    this.enabled = true,
    this.width,
    this.height,
    /// 위젯을 기점으로 오른쪽 공간을 지정합니다.
    this.betweenSpace = 0.0,
    /// 각 객체마다 패딩 지정
    this.padding = const EdgeInsets.all(0.0),
    this.unTouchablePadding = const EdgeInsets.all(0.0),
    this.textStyle,
    this.inkwellProperty,
    this.checkBoxProperty,
    //assert ; 위젯.values 길이랑 위젯 리스트의 길이가 같은지?
  })  : assert(
            (values != null && labels != null)
                ? (values.length == labels.length)
                : true,
            'values와 labels가 모두 null이 아니면 widgets 길이와 values의 길이는 같아야 합니다.'),
        assert(
            (values != null && widgets != null)
                ? (values.length == widgets.length)
                : true,
            'values와 widgets가 모두 null이 아니면 widgets 길이와 values의 길이는 같아야 합니다.'),
        assert(widgets != null || labels != null,
            'widgets와 labels중 하나는 값이 있어야만 합니다.'),
        super(key: key);

  @override
  State<AgnesCheckBoxTileGroup> createState() => _AgnesCheckBoxTileGroupState();
}

class _AgnesCheckBoxTileGroupState<T> extends State<AgnesCheckBoxTileGroup> {
  List<bool?>? _values;
  @override
  initState() {
    super.initState();
    _values = widget.values != null
        ? widget.values
        : widget.widgets != null
            ? List<bool?>.filled(widget.widgets!.length, false, growable: false)
            : widget.labels != null
                ? List<bool?>.filled(widget.labels!.length, false,
                    growable: false)
                : null;
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.groupType) {
      case AgnesGroupType.row:
        return Row(
            crossAxisAlignment: widget.crossGroupAlignment,
            mainAxisAlignment: widget.mainGroupAlignment,
            children: _agnesCheckBoxItems());
      case AgnesGroupType.column:
        return Column(
            crossAxisAlignment: widget.crossGroupAlignment,
            mainAxisAlignment: widget.mainGroupAlignment,
            children: _agnesCheckBoxItems());
      case AgnesGroupType.wrap:
      default:
        return Wrap(
            direction: widget.direction ?? Axis.horizontal,
            spacing: widget.spacing ?? 0.0,
            runSpacing: widget.runSpacing ?? 0.0,
            crossAxisAlignment: widget.crossGroupAlignment.toWrap(),
            alignment: widget.mainGroupAlignment.toWrap(),
            runAlignment: widget.groupRunAlignment,
            children: _agnesCheckBoxItems());
    }
  }

  void _handleValueChange(int index) {
    assert(widget.onChanged != null);
    switch (_values?[index]) {
      case false:
        setState(() {
          _values?[index] = true;
        });
        break;
      case true:
        setState(() {
          _values?[index] = (widget.tristate ? null : false);
        });
        break;
      case null:
        setState(() {
          _values?[index] = false;
        });
        break;
    }
    widget.onChanged!(_values?[index], index, _values);
  }

  List<Widget> _agnesCheckBoxItems() {
    ThemeData _themeData =
        Theme.of(UiUxData.navigatorKey!.currentState!.context);
    return List.generate(
      _values?.length ?? 0,
      (index) {
        return Material(
          child: Padding(
            padding: index + 1 != _values?.length
                ? widget.unTouchablePadding!
                : EdgeInsets.zero,
            child: InkWell(
              key: widget.inkwellProperty?.key,
              highlightColor: !widget.enabled || widget.onChanged == null
                  ? Colors.transparent
                  : widget.inkwellProperty?.hoverColor,
              splashColor: !widget.enabled || widget.onChanged == null
                  ? Colors.transparent
                  : widget.inkwellProperty?.splashColor ??
                      _themeData.toggleableActiveColor
                          .withAlpha(kRadialReactionAlpha),
              hoverColor: !widget.enabled || widget.onChanged == null
                  ? Colors.transparent
                  : widget.inkwellProperty?.hoverColor,
              mouseCursor: widget.inkwellProperty?.mouseCursor,
              focusColor: widget.inkwellProperty?.focusColor,
              overlayColor: widget.inkwellProperty?.overlayColor,
              radius: widget.inkwellProperty?.radius,
              borderRadius: widget.inkwellProperty?.borderRadius,
              customBorder: widget.inkwellProperty?.customBorder,
              enableFeedback: widget.inkwellProperty?.enableFeedback ?? true,
              excludeFromSemantics:
                  widget.inkwellProperty?.excludeFromSemantics ?? false,
              focusNode: widget.inkwellProperty?.focusNode,
              canRequestFocus: widget.inkwellProperty?.canRequestFocus ?? true,
              onFocusChange: widget.inkwellProperty?.onFocusChange,
              autofocus: widget.inkwellProperty?.autofocus ?? false,
              onTap: () => {
                widget.onChanged == null
                    ? null
                    : widget.enabled
                        ? _handleValueChange(index)
                        : null,
              },
              child: AgnesCheckBoxItem(
                index: index,
                onChanged: widget.onChanged == null
                    ? null
                    : widget.enabled
                        ? (selected) {}
                        : null,
                labels: widget.labels,
                values: _values,
                widgets: widget.widgets,
                position: widget.position,
                padding: widget.padding,
                tristate: widget.tristate,
                mainGroupAlignment: widget.mainGroupAlignment,
                crossGroupAlignment: widget.crossGroupAlignment,
                width: widget.width,
                height: widget.height,
                betweenSpace: widget.betweenSpace,
                textStyle: widget.textStyle,
                checkBoxProperty: widget.checkBoxProperty,
                isTile: true,
                mainAxisSize: widget.groupType == AgnesGroupType.wrap
                    ? MainAxisSize.min
                    : widget.mainAxisSize,
              ),
            ),
          ),
        );
      },
    );
  }
}
