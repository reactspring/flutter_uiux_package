// ignore_for_file: close_sinks

/* ********************************************************************
 *
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

enum ButtonState { idle, loading, success, error }

class LoadingButton extends StatefulWidget {
  /// ## LoadingButton 로딩 버튼
  ///
  /// 로딩 버튼을 구현합니다.
  ///
  /// [controller], [onPressed], [child]은 null이 아니어야 합니다.

  const LoadingButton({
    Key? key,
    required this.controller,
    required this.onPressed,
    required this.child,
    this.height = 50,
    this.width = 130,
    this.loaderSize = 24.0,
    this.loaderStrokeWidth = 2.0,
    this.animateOnTap = true,
    this.valueColor = Colors.white,
    this.borderRadius = 35,
    this.elevation = 2,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOutCirc,
    this.successColor,
    this.resetDuration = const Duration(seconds: 15),
    this.resetAfterDuration = false,
    this.successIcon = Icons.check,
    this.failedIcon = Icons.close,
    this.completionCurve = Curves.elasticOut,
    this.completionDuration = const Duration(milliseconds: 1000),
    this.disabledColor,
  }) : super(key: key);

  /// 로딩 버튼을 제어하는 컨트롤러 입니다.
  final LoadingButtonController controller;

  /// 버튼 클릭 시 발생하는 이벤트입니다.
  final VoidCallback? onPressed;

  /// 버튼의 높이를 지정합니다.
  final double height;

  /// 버튼의 너비를 지정합니다.
  final double width;

  /// 버튼의 테두리 둥글기를 지정합니다.
  final double borderRadius;

  /// 버튼에 들어갈 위젯을 지정합니다.
  final Widget child;

  /// 로딩 시에 보여지는 버튼의 크기를 지정합니다.
  final double loaderSize;

  /// 로딩 시에 보여지는 버튼의 너비를 지정합니다.
  final double loaderStrokeWidth;

  /// 버튼을 탭했을 때의 애니메이션 활성화 여부를 지정합니다.
  final bool animateOnTap;

  /// 색상을 지정합니다.
  final Color valueColor;

  /// 지속시간 초기화 여부를 지정합니다.
  final bool resetAfterDuration;

  /// 애니메이션을 지정합니다.
  final Curve curve;

  /// 지속 시간을 지정합니다.
  final Duration duration;

  /// 초기화 할 지속 시간을 지정합니다.
  final Duration resetDuration;

  /// 로딩 완료 시에 보여지는 애니메이션 스타일을 지정합니다.
  final Curve completionCurve;

  /// 로딩 완료 지속 시간을 지정합니다.
  final Duration completionDuration;

  /// 버튼의 그림자 강도를 지정합니다.
  final double elevation;

  /// 로딩 성공 시에 나타나는 버튼의 색상을 지정합니다.
  final Color? successColor;

  /// 로딩 실패 시에 나타나는 버튼의 색상을 지정합니다.
  final Color? disabledColor;

  /// 로딩 성공 시에 나타나는 버튼에 들어갈 아이콘을 지정합니다.
  final IconData successIcon;

  /// 로딩 실패 시에 나타나는 버튼에 들어갈 아이콘을 지정합니다.
  final IconData failedIcon;

  Duration get _borderDuration {
    return Duration(milliseconds: (duration.inMilliseconds / 2).round());
  }

  @override
  State<StatefulWidget> createState() => LoadingButtonState();
}

class LoadingButtonState extends State<LoadingButton>
    with TickerProviderStateMixin {
  late AnimationController _buttonController;
  late AnimationController _borderController;
  late AnimationController _checkButtonControler;

  late Animation _squeezeAnimation;
  late Animation _bounceAnimation;
  late Animation _borderAnimation;

  final _state = BehaviorSubject<ButtonState>.seeded(ButtonState.idle);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget _check = Container(
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: widget.successColor ?? theme.primaryColor,
        borderRadius:
            BorderRadius.all(Radius.circular(_bounceAnimation.value / 2)),
      ),
      width: _bounceAnimation.value,
      height: _bounceAnimation.value,
      child: _bounceAnimation.value > 20
          ? Icon(
              widget.successIcon,
              color: widget.valueColor,
            )
          : null,
    );

    Widget _cross = Container(
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(_bounceAnimation.value / 2)),
      ),
      width: _bounceAnimation.value,
      height: _bounceAnimation.value,
      child: _bounceAnimation.value > 20
          ? Icon(
              widget.failedIcon,
              color: widget.valueColor,
            )
          : null,
    );

    Widget _loader = SizedBox(
      height: widget.loaderSize,
      width: widget.loaderSize,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(widget.valueColor),
        strokeWidth: widget.loaderStrokeWidth,
      ),
    );

    Widget childStream = StreamBuilder(
      stream: _state,
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: snapshot.data == ButtonState.loading ? _loader : widget.child,
        );
      },
    );

    final _btn = ButtonTheme(
      shape: RoundedRectangleBorder(borderRadius: _borderAnimation.value),
      disabledColor: widget.disabledColor,
      padding: const EdgeInsets.all(0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(_squeezeAnimation.value, widget.height),
          disabledForegroundColor: widget.disabledColor!.withOpacity(0.38),
          disabledBackgroundColor: widget.disabledColor!.withOpacity(0.12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          elevation: widget.elevation,
          padding: const EdgeInsets.all(0),
        ),
        onPressed: widget.onPressed == null ? null : _btnPressed,
        child: childStream,
      ),
    );

    return SizedBox(
      height: widget.height,
      child: Center(
        child: _state.value == ButtonState.error
            ? _cross
            : _state.value == ButtonState.success
                ? _check
                : _btn,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _buttonController =
        AnimationController(duration: widget.duration, vsync: this);

    _checkButtonControler =
        AnimationController(duration: widget.completionDuration, vsync: this);

    _borderController =
        AnimationController(duration: widget._borderDuration, vsync: this);

    _bounceAnimation = Tween<double>(begin: 0, end: widget.height).animate(
      CurvedAnimation(
        parent: _checkButtonControler,
        curve: widget.completionCurve,
      ),
    );
    _bounceAnimation.addListener(() {
      setState(() {});
    });

    _squeezeAnimation =
        Tween<double>(begin: widget.width, end: widget.height).animate(
      CurvedAnimation(parent: _buttonController, curve: widget.curve),
    );

    _squeezeAnimation.addListener(() {
      setState(() {});
    });

    _squeezeAnimation.addStatusListener((state) {
      if (state == AnimationStatus.completed && widget.animateOnTap) {
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      }
    });

    _borderAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(widget.borderRadius),
      end: BorderRadius.circular(widget.height),
    ).animate(_borderController);

    _borderAnimation.addListener(() {
      setState(() {});
    });

    _state.stream.listen((event) {
      if (!mounted) return;
      widget.controller._state.sink.add(event);
    });

    widget.controller._addListeners(_start, _stop, _success, _error, _reset);
  }

  @override
  void dispose() {
    _buttonController.dispose();
    _checkButtonControler.dispose();
    _borderController.dispose();
    _state.close();
    super.dispose();
  }

  void _btnPressed() async {
    if (widget.animateOnTap) {
      _start();
    } else {
      if (widget.onPressed != null) {
        widget.onPressed!();
      }
    }
  }

  void _start() {
    if (!mounted) return;
    _state.sink.add(ButtonState.loading);
    _borderController.forward();
    _buttonController.forward();
    if (widget.resetAfterDuration) _reset();
  }

  void _stop() {
    if (!mounted) return;
    _state.sink.add(ButtonState.idle);
    _buttonController.reverse();
    _borderController.reverse();
  }

  void _success() {
    if (!mounted) return;
    _state.sink.add(ButtonState.success);
    _checkButtonControler.forward();
  }

  void _error() {
    if (!mounted) return;
    _state.sink.add(ButtonState.error);
    _checkButtonControler.forward();
  }

  void _reset() async {
    if (widget.resetAfterDuration) await Future.delayed(widget.resetDuration);
    if (!mounted) return;
    _state.sink.add(ButtonState.idle);
    unawaited(_buttonController.reverse());
    unawaited(_borderController.reverse());
    _checkButtonControler.reset();
  }
}

class LoadingButtonController {
  VoidCallback? _startListener;
  VoidCallback? _stopListener;
  VoidCallback? _successListener;
  VoidCallback? _resetListener;

  void _addListeners(
    VoidCallback startListener,
    VoidCallback stopListener,
    VoidCallback successListener,
    VoidCallback errorListener,
    VoidCallback resetListener,
  ) {
    _startListener = startListener;
    _stopListener = stopListener;
    _successListener = successListener;
    _resetListener = resetListener;
  }

  final BehaviorSubject<ButtonState> _state =
      BehaviorSubject<ButtonState>.seeded(ButtonState.idle);

  Stream<ButtonState> get stateStream => _state.stream;

  ButtonState? get currentState => _state.value;

  void start() {
    if (_startListener != null) _startListener!();
  }

  void stop() {
    if (_stopListener != null) _stopListener!();
  }

  void success() {
    if (_successListener != null) _successListener!();
  }

  void reset() {
    if (_resetListener != null) _resetListener!();
  }
}
