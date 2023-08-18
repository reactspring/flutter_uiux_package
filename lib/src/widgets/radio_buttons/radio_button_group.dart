/* ********************************************************************
 *
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class AgnesRadioButtonGroup<T> extends StatefulWidget {
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

  /// 라디오 버튼에 들어갈 값을 지정합니다.
  final List<T> values;

  /// 라디오 버튼에 들어갈 위젯을 지정합니다.
  final List<Widget>? widgets;

  /// 라벨에 들어갈 텍스트를 지정합니다.
  final List<String>? labels;

  /// 라디오 버튼 선택 시에 발생하는 이벤트를 지정합니다.
  final void Function(T?, int?)? onChanged;

  /// 라디오 버튼의 위치를 지정합니다.
  final AgnesWidgetPosition position;

  /// 라디오 버튼 그룹의 유형을 지정합니다.
  final AgnesGroupType groupType;

  /// 라디오 버튼의 크기를 지정합니다.
  final MainAxisSize mainAxisSize;

  /// 라디오 버튼 그룹의 세로축 정렬 값을 지정합니다.
  final MainAxisAlignment mainGroupAlignment;

  /// 라디오 버튼 그룹의 가로축 정렬 값을 지정합나다.
  final CrossAxisAlignment crossGroupAlignment;

  /// 라디오 버튼 그룹의 위치를 지정합니다.
  final WrapAlignment groupRunAlignment;

  /// 라디오 버튼의 방향을 지정합니다.
  final Axis? direction;

  /// 라디오 버튼의 여백 공간을 지정합니다.
  final double? spacing;

  /// 라디오 버튼의 여백을 지정합니다.
  final double? runSpacing;

  /// 라디오 버튼의 선택 여부를 지정합니다.
  final bool enabled;

  /// 라디오 버튼의 너비를 지정합니다.
  final double? width;

  /// 라디오 버튼의 높이를 지정합니다.
  final double? height;

  /// 라디오 버튼에 들어갈 위젯들 사이의 여백을 지정합니다.
  final double? betweenSpace;

  /// 라디오 버튼의 여백을 지정합니다.
  final EdgeInsets padding;

  /// 라디오 버튼에 들어갈 텍스트의 스타일을 지정합니다.
  final TextStyle? textStyle;

  /// 라디오 버튼에 들어갈 속성을 지정합니다.
  final RadioProperty? radioProperty;

  AgnesRadioButtonGroup({
    Key? key,
    this.labels,
    this.widgets,

    /// null일 경우 labels나 widgets의 값으로 초기화
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

    /// 위젯을 기점으로 오른쪽 공간을 지정합니다.
    this.betweenSpace = 0.0,

    /// 각 객체마다 패딩 지정
    this.padding = const EdgeInsets.all(0.0),
    this.textStyle,
    this.radioProperty,

    ///assert ; 위젯.values 길이랑 위젯 리스트의 길이가 같은지?
  })  : assert((labels != null) ? (values.length == labels.length) : true,
            'labels가 null이 아니면 widgets 길이와 values의 길이는 같아야 합니다.'),
        assert((widgets != null) ? (values.length == widgets.length) : true,
            'widgets가 null이 아니면 widgets 길이와 values의 길이는 같아야 합니다.'),
        assert(widgets != null || labels != null,
            'widgets와 labels중 하나는 값이 있어야만 합니다.'),
        super(key: key);

  @override
  State<AgnesRadioButtonGroup> createState() => _AgnesRadioButtonGroupState();
}

class _AgnesRadioButtonGroupState<T> extends State<AgnesRadioButtonGroup<T>> {
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

  List<Widget> _agnesRadioButtonItems() {
    return List.generate(
      widget.values.length,
      (index) {
        return AgnesRadioButtonItem<T>(
          index: index,
          onChanged: !widget.enabled
              ? null
              : widget.onChanged != null
                  ? (value) {
                      setState(() {
                        _value = value;
                      });
                      widget.onChanged!(_value, index);
                    }
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
          isTile: false,
          showRadio: true,
          mainAxisSize: widget.groupType == AgnesGroupType.wrap
              ? MainAxisSize.min
              : widget.mainAxisSize,
        );
      },
    );
  }
}
