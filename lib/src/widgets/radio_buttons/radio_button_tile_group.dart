// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

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
class AgnesRadioButtonTileGroup<T> extends StatefulWidget {
  final List<T> values;
  final List<Widget>? widgets;
  final List<String>? labels;
  final void Function(T?, int?)? onChanged;
  final AgnesWidgetPosition position;
  final AgnesGroupType groupType;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainGroupAlignment;
  final CrossAxisAlignment crossGroupAlignment;
  final WrapAlignment groupRunAlignment;
  final Axis? direction;
  final double? spacing;
  final double? runSpacing;
  final bool enabled;
  final double? width;
  final double? height;
  final double? betweenSpace;
  final EdgeInsets padding;
  final EdgeInsets? unTouchablePadding;
  final TextStyle? textStyle;
  final InkwellProperty? inkwellProperty;
  final RadioProperty? radioProperty;
  final bool? showRadio;

  AgnesRadioButtonTileGroup({
    Key? key,
    this.labels,
    this.widgets,
    // null일 경우 labels나 widgets의 값으로 초기화
    required this.values,
    this.onChanged,
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
    // 위젯을 기점으로 오른쪽 공간을 지정합니다.
    this.betweenSpace = 0.0,
    // 각 객체마다 패딩 지정
    this.padding = const EdgeInsets.all(0.0),
    this.unTouchablePadding = const EdgeInsets.all(0.0),
    this.textStyle,
    this.inkwellProperty,
    this.radioProperty,
    this.showRadio = true,
    //assert ; 위젯.values 길이랑 위젯 리스트의 길이가 같은지?
  })  : assert((labels != null) ? (values.length == labels.length) : true,
            'labels가 null이 아니면 widgets 길이와 values의 길이는 같아야 합니다.'),
        assert((widgets != null) ? (values.length == widgets.length) : true,
            'widgets가 null이 아니면 widgets 길이와 values의 길이는 같아야 합니다.'),
        assert(widgets != null || labels != null,
            'widgets와 labels중 하나는 값이 있어야만 합니다.'),
        super(key: key);

  @override
  State<AgnesRadioButtonTileGroup> createState() =>
      _AgnesRadioButtonTileGroupState();
}

class _AgnesRadioButtonTileGroupState<T>
    extends State<AgnesRadioButtonTileGroup<T>> {
  T? _value;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.groupType) {
      case AgnesGroupType.row:
        return Row(
            crossAxisAlignment: widget.crossGroupAlignment,
            mainAxisAlignment: widget.mainGroupAlignment,
            children: _agnesRadioButtonItems());
      case AgnesGroupType.column:
        return Column(
            crossAxisAlignment: widget.crossGroupAlignment,
            mainAxisAlignment: widget.mainGroupAlignment,
            children: _agnesRadioButtonItems());
      case AgnesGroupType.wrap:
      default:
        return Wrap(
            direction: widget.direction ?? Axis.horizontal,
            spacing: widget.spacing ?? 0.0,
            runSpacing: widget.runSpacing ?? 0.0,
            crossAxisAlignment: widget.crossGroupAlignment.toWrap(),
            alignment: widget.mainGroupAlignment.toWrap(),
            runAlignment: widget.groupRunAlignment,
            children: _agnesRadioButtonItems());
    }
  }

  void _handleValueChange(int index) {
    assert(widget.onChanged != null);

    setState(
      () {
        _value = widget.values[index];
      },
    );
    widget.onChanged!(_value, index);
  }

  List<Widget> _agnesRadioButtonItems() {
    ThemeData _themeData =
        Theme.of(UiUxData.navigatorKey!.currentState!.context);
    const int kRadialReactionAlpha = 0x1F;
    return List.generate(
      widget.values.length,
      (index) {
        return Material(
          child: Padding(
            padding: index + 1 != widget.values.length
                ? widget.unTouchablePadding!
                : EdgeInsets.zero,
            child: InkWell(
              key: widget.inkwellProperty?.key,
              highlightColor: !widget.enabled || widget.onChanged == null
                  ? Colors.transparent
                  : widget.inkwellProperty?.highlightColor,
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
              child: AgnesRadioButtonItem<T>(
                index: index,
                onChanged: widget.onChanged == null
                    ? null
                    : widget.enabled
                        ? (selected) {}
                        : null,
                labels: widget.labels,
                values: widget.values,
                widgets: widget.widgets,
                groupValue: _value,
                position: widget.position,
                padding: widget.padding,
                mainGroupAlignment: widget.mainGroupAlignment,
                crossGroupAlignment: widget.crossGroupAlignment,
                width: widget.width,
                height: widget.height,
                betweenSpace: widget.betweenSpace,
                textStyle: widget.textStyle,
                radioProperty: widget.radioProperty,
                isTile: true,
                showRadio: widget.showRadio,
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
