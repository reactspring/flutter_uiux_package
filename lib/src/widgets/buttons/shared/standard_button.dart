/* ********************************************************************
 *
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'dart:async';

import 'package:flutter/material.dart';

class StandardButton extends StatefulWidget {
  /// ## StandardButton 기본형 버튼
  ///
  /// 기본형 버튼을 구현합니다.
  ///
  /// [onPressed]는 null이 아니어야 합니다.

  StandardButton({
    Key? key,
    required this.onPressed,
    this.title,
    this.width,
    this.height,
    this.opacity,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.doubleTapTime,
    this.color,
    this.borderColor,
    this.splashColor,
    this.titleColor,
    this.tappedTitleColor,
    this.gradientColors,
    this.gradientSplashColors,
    this.beginGradient,
    this.endGradient,
    this.beginGradientSplash,
    this.endGradientSplash,
    this.shadows,
    this.splashShadows,
    this.titleSize,
    this.borderRadius,
    this.fontWeight,
    this.borderWidth,
    this.alignment,
    this.child,
    this.childSplash,
  }) : super(key: key);

  /// 버튼에 들어갈 텍스트를 입력합니다.
  final String? title;

  /// 버튼의 너비를 지정합니다.
  final double? width;

  /// 버튼의 높이를 지정합니다.
  final double? height;

  /// 버튼의 투명도를 지정합니다.
  final double? opacity;

  /// 버튼 클릭 시 발생하는 이벤트를 지정합니다.
  final Function onPressed;

  /// 버튼을 길게 클릭 시 발생하는 이벤트를 지정합니다.
  final VoidCallback? onLongPress;

  /// 버튼을 탭할 때 발생하는 이벤트를 지정합니다.
  final VoidCallback? onTap;

  /// 버튼 더블 탭 시 발생하는 이벤트를 지정합니다.
  final VoidCallback? onDoubleTap;

  /// 버튼을 더블 탭할 때의 지속 시간을 지정합니다.
  final Duration? doubleTapTime;

  /// 버튼의 색상을 지정합니다.
  final Color? color;

  /// 버튼의 테두리 색상을 지정합니다.
  final Color? borderColor;

  /// 버튼에 들어갈 텍스트 색상을 지정합니다.
  final Color? titleColor;

  /// 버튼의 스플래시 효과에 적용할 색상을 지정합니다.
  final Color? splashColor;

  final Color? tappedTitleColor;

  /// 버튼에 적용할 그라데이션 색상 목록을 지정합니다.
  final List<Color>? gradientColors;

  /// 버튼의 스플래시 효과에 적용할 그라데이션 색상 목록을 지정합니다.
  final List<Color>? gradientSplashColors;

  /// 버튼의 그라데이션 시작 부분 위치를 지정합니다.
  final Alignment? beginGradient;

  /// 버튼의 그라데이션 끝 부분 위치를 지정합니다.
  final Alignment? endGradient;

  /// 버튼의 스플래시 효과에 적용할 그라데이션의 처음 부분 위치를 지정합니다.
  final Alignment? beginGradientSplash;

  /// 버튼의 스플래시 효과에 적용할 그라데이션의 끝 부분 위치를 지정합니다.
  final Alignment? endGradientSplash;

  /// 버튼의 그림자 스타일을 지정합니다
  final List<BoxShadow>? shadows;

  /// 버튼의 스플래시 효과에 적용할 그림자 스타일을 지정합니다.
  final List<BoxShadow>? splashShadows;

  /// 버튼에 들어갈 텍스트 크기를 지정합니다.
  final double? titleSize;

  /// 버튼에 들어갈 텍스트의 두께를 지정합니다.
  final FontWeight? fontWeight;

  /// 버튼의 테두리 둥글기를 지정합니다.
  final double? borderRadius;

  /// 버튼의 테두리 두께를 지정합니다.
  final double? borderWidth;

  /// 버튼의 위치를 지정합니다.
  final Alignment? alignment;

  /// 버튼에 들어갈 위젯을 지정합니다.
  final Widget? child;

  /// 버튼의 스플래시 효과 적용 시에 보여지는 위젯을 지정합니다.
  final Widget? childSplash;

  @override
  State<StandardButton> createState() => _StandardButtonState();
}

class _StandardButtonState extends State<StandardButton> {
  bool _isActive = false;
  bool _isOnTap = false;
  bool _isOnDoubleTap = false;
  Timer? _doubleTapTimer;

  @override
  Widget build(BuildContext context) {
    return widget.onLongPress != null ? _withLongPress() : _withoutLongPress();
  }

  void _doubleTapTimerElapsed() {
    if (_isActive) {
      _isOnTap = true;
    } else {
      if (widget.onTap != null) widget.onTap!();
    }
  }

  /// https://github.com/flutter/flutter/issues/50458
  /// https://stackoverflow.com/questions/53063021/flutter-tap-delay-with-gesturedetector-in-a-tile-of-a-gridview
  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isActive = true;
    });
    if (_doubleTapTimer != null && _doubleTapTimer!.isActive) {
      _isOnDoubleTap = true;
      _doubleTapTimer!.cancel();
    } else {
      _doubleTapTimer = Timer(
          widget.doubleTapTime ?? Duration(milliseconds: 150),
          _doubleTapTimerElapsed);
    }
  }

  void _onTapCancel() {
    setState(() {
      _isActive = false;
    });
    _isActive = _isOnTap = _isOnDoubleTap = false;
    if (_doubleTapTimer != null && _doubleTapTimer!.isActive) {
      _doubleTapTimer!.cancel();
    }
    //if(onTapCancel != null) this.onTapCancel();
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isActive = false;
    });
    if (_isOnTap) {
      _isOnTap = false;
      widget.onTap!();
    }
    if (_isOnDoubleTap) {
      _isOnDoubleTap = false;
      if (widget.onDoubleTap != null) {
        widget.onDoubleTap!();
      }
    }
  }

  void _onLongPress() {
    if (widget.onLongPress != null) widget.onLongPress!();
  }

  Widget _withLongPress() {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapCancel: _onTapCancel,
      onTapUp: _onTapUp,
      onLongPress: _onLongPress,
      child: _buttonContainer(),
    );
  }

  Widget _withoutLongPress() {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapCancel: _onTapCancel,
      onTapUp: _onTapUp,
      child: _buttonContainer(),
    );
  }

  Container _buttonContainer() {
    return Container(
      decoration: _buildBoxDecorationOfStandardButton(),
      alignment: widget.alignment ?? Alignment.center,
      width: widget.width ?? 200.0,
      height: widget.height ?? 40.0,

      /// todo SVG 아이콘 파일, 이미지 파일, 기본 텍스트 등이 들어갈 수 있도록
      /// onTap 콜백 함수에서 isTapped 콜백할 때 같이 주면 된다.
      child: widget.child != null
          ? _isActive
              ? widget.childSplash != null
                  ? widget.childSplash
                  : widget.child
              : widget.child
          : Text(
              widget.title ?? "Standard Button",
              style: TextStyle(
                fontSize: widget.titleSize ?? 20,
                color: _isActive
                    ? widget.tappedTitleColor ?? Colors.black
                    : (widget.titleColor ?? Colors.black),
                fontWeight: widget.fontWeight ?? FontWeight.bold,
              ),
            ),
    );
  }

  BoxDecoration _buildBoxDecorationOfStandardButton() {
    return BoxDecoration(
      borderRadius: widget.borderRadius != null
          ? BorderRadius.circular(widget.borderRadius!)
          : BorderRadius.circular(0.0),
      backgroundBlendMode: BlendMode.src,
      border: Border.all(
        width: widget.borderWidth ?? 1,
        color: widget.borderColor ?? Colors.black,
      ),
      color: _isActive
          ? (widget.splashColor?.withOpacity(widget.opacity ?? 1) ??
              Colors.blue[100]?.withOpacity(widget.opacity ?? 1))
          : (widget.color ?? Colors.blue[100]),
      gradient: _isActive
          ? (widget.gradientSplashColors != null
              ? LinearGradient(
                  begin: widget.beginGradientSplash!,
                  end: widget.endGradientSplash!,
                  colors: widget.gradientSplashColors!)
              : null)
          : (widget.gradientColors != null
              ? LinearGradient(
                  begin: widget.beginGradient!,
                  end: widget.endGradient!,
                  colors: widget.gradientColors!)
              : null),
      boxShadow: _isActive ? widget.splashShadows ?? [] : widget.shadows ?? [],
    );
  }
}
