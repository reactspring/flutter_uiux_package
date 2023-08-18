/* ********************************************************************
 *
 * 2022.08.25  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

import 'package:loading_indicator/loading_indicator.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class StandardLoading extends StatefulWidget {
  /// ## StandardLoading 기본 로딩바
  ///
  /// 기본 로딩바를 구현합니다.
  ///
  /// [colorsList], [checkBoxValues], [labels]은 null이 아니어야 합니다.
  StandardLoading(
      {Key? key,
      required this.colorsList,
      required this.checkBoxValues,
      required this.labels})
      : super(key: key);

  /// 기본 로딩의 색상 목록을 지정합니다.
  final List<Color>? colorsList;

  /// 체크박스의 체크 여부를 지정합니다.
  final List<bool>? checkBoxValues;

  /// 라벨에 들어갈 텍스트를 지정합니다.
  final List<String>? labels;

  @override
  State<StandardLoading> createState() => _StandardLoadingState();
}

class _StandardLoadingState extends State<StandardLoading> {
  bool _isLoading = false;
  Widget _loadingWidget = LoadingWidgets();

  List<Indicator> indicators = [
    Indicator.ballPulse,
    Indicator.ballGridPulse,
    Indicator.ballClipRotate,
    Indicator.squareSpin,
    Indicator.ballClipRotatePulse,
    Indicator.ballClipRotateMultiple,
    Indicator.ballPulseRise,
    Indicator.ballRotate,
    Indicator.cubeTransition,
    Indicator.ballZigZag,
    Indicator.ballZigZagDeflect,
    Indicator.ballTrianglePath,
    Indicator.ballTrianglePathColored,
    Indicator.ballTrianglePathColoredFilled,
    Indicator.ballScale,
    Indicator.lineScale,
    Indicator.lineScaleParty,
    Indicator.ballScaleMultiple,
    Indicator.ballPulseSync,
    Indicator.ballBeat,
    Indicator.lineScalePulseOut,
    Indicator.lineScalePulseOutRapid,
    Indicator.ballScaleRipple,
    Indicator.ballScaleRippleMultiple,
    Indicator.ballSpinFadeLoader,
    Indicator.lineSpinFadeLoader,
    Indicator.triangleSkewSpin,
    Indicator.pacman,
    Indicator.ballGridBeat,
    Indicator.semiCircleSpin,
    Indicator.ballRotateChase,
    Indicator.orbit,
    Indicator.audioEqualizer,
    Indicator.circleStrokeSpin,
  ];

  String? _indicatorName;

  List<Widget> widgets = [];
  List<String> values = [];

  List<Color> _colors = [Colors.grey];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("기본 로딩 가이드"),
      ),
      bottomSheet: _loadingIndicatorInfo(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              widget.checkBoxValues!.clear();
              widget.checkBoxValues!.addAll([]);
              _colors.clear();
              _colors.add(Colors.grey);
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(AGNESSpacing.spacing_16),
            child: ListView(
              children: [
                Text('기본 로딩 가이드입니다. 항목을 선택하면 하단 바텀시트에 이름이 출력됩니다. '
                    '색깔에 해당하는 체크박스를 터치하면 색깔리스트에 따라 어떻게 로딩 컴포넌트들의 색깔이 바뀌는지 '
                    '확인하실 수 있습니다. 확인하기를 누르시면 선택된 항목을 단독으로 확인하실 수 있습니다.'),
                Divider(),
                _loadingIndicatorShowCase(),
                SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loadingIndicatorShowCase() {
    return AgnesRadioButtonTileGroup(
      mainGroupAlignment: MainAxisAlignment.center,
      crossGroupAlignment: CrossAxisAlignment.center,
      widgets: _getWidgetsValues(),
      values: values,
      mainAxisSize: MainAxisSize.min,
      groupType: AgnesGroupType.wrap,
      position: AgnesWidgetPosition.top,
      spacing: 50,
      runSpacing: 50,
      betweenSpace: 8,
      onChanged: (value, index) {
        setState(() {});
      },
    );
  }

  List<Widget> _getWidgetsValues() {
    values.clear();
    widgets.clear();
    indicators.forEach(
      (indicator) {
        values.add(indicator.toString());
        widgets.add(
          /// LoadingWidgets :
          LoadingWidgets(
            indicator: indicator,
            colors: _colors,
          ),
        );
      },
    );
    return widgets;
  }

  void _onPressed() async {
    context.loaderOverlay.show(widget: _loadingWidget);
    setState(() {
      _isLoading = context.loaderOverlay.visible;
    });
    await Future.delayed(Duration(seconds: 2));
    if (_isLoading) {
      context.loaderOverlay.hide();
    }
    setState(() {
      _isLoading = context.loaderOverlay.visible;
    });
  }

  Widget _loadingIndicatorInfo() {
    return Container(
      height: 150,
      color: AgnesColors.lightPrimaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(AGNESSpacing.spacing_16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('인디케이터 이름', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('${_indicatorName ?? ''}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('색깔 지정', style: TextStyle(fontWeight: FontWeight.bold)),
                AgnesCheckBoxGroup(
                  labels: widget.labels,
                  betweenSpace: 2.0,
                  padding: EdgeInsets.only(right: AGNESSpacing.spacing_8),
                  values: widget.checkBoxValues,
                  onChanged: (value, index, values) {
                    List<Color> _tempColors = [];
                    for (int i = 0; i < values!.length; i++) {
                      if (values[i]!) {
                        _tempColors.add(widget.colorsList![i]);
                      }
                    }
                    setState(() {
                      _colors.clear();
                      _colors.addAll(_tempColors);
                    });
                  },
                ),
              ],
            ),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AgnesColors.lightSecondary,
                    ),
                    child: Text('확인하기'),
                    onPressed: _onPressed))
          ],
        ),
      ),
    );
  }
}
