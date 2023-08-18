/* ********************************************************************
 *
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

library flutter_button;

import 'package:flutter/material.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class LikeButton extends StatelessWidget {
  /// ## Like Button 좋아요 버튼
  ///
  /// 좋아요 버튼 같은 경우, DB에 저장된 좋아요 bool(true or false) 여부를 가지고 초기 상태를 지정해주어야 합니다.
  /// [isLiked]에 들어갈 초기 값을 [initState]에서 정의 후 [LikeButton] 클래스에 초기 값을 주고
  /// 다음과 같은 클래스를 만들어 사용하면 됩니다.
  ///
  /// [isLisked]은 null이 아니어야 합니다.

  const LikeButton({required this.isLiked, Key? key}) : super(key: key);

  /// 좋아요 버튼의 활성화 여부를 지정합니다.
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return LikeButtonBuilder(
      isLiked: isLiked,
      duration: Duration(seconds: 1),
      onTap: (isActive) {
        /// 이 곳에 좋아요, 좋아요 취소 비즈니스 로직을 사용하면 된다.
        /// 좋아요, 취소 비즈니스로직이 끝날 때까지 로딩을 걸어 사용자 터치를 방지하는 것이 좋다.
        // isActive
        //     ? flutterToast.info(message: '좋아요')
        //     : flutterToast.info(message: '좋아요 취소');
      },
    );
  }
}

class LikeButtonBuilder extends StatefulWidget {
  LikeButtonBuilder({
    Key? key,
    this.onTap,
    this.isLiked,
    this.icon,
    this.duration,
    this.curve,
    this.deactiveColor,
    this.activeColor,
    this.deactiveSize,
    this.activeSize,
  }) : super(key: key);

  /// 좋아요 버튼을 탭했을 때 발생하는 이벤트를 지정합니다.
  final OnTapCallBack? onTap;

  /// 아이콘 위젯을 지정합니다.
  final IconData? icon;

  /// 지속 시간을 지정합니다.
  final Duration? duration;

  /// 애니메이션을 지정합니다.
  final Curve? curve;

  /// 좋아요 버튼 비활성화 시에 나타나는 색상을 지정합니다.
  final Color? deactiveColor;

  /// 좋아요 버튼 활성화 시에 나타나는 색상을 지정합니다.
  final Color? activeColor;

  /// 좋아요 버튼 비활성화 시에 나타나는 버튼의 크기를 지정합니다.
  final double? deactiveSize;

  /// 좋아요 버튼 활성화 시에 나타나는 버튼의 크기를 지정합니다.
  final double? activeSize;

  /// 좋아요 버튼 활성화 여부를 지정합니다.
  final bool? isLiked;

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButtonBuilder>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _curve;
  late bool? isActive = widget.isLiked ?? false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration ?? Duration(milliseconds: 250),
    );

    _curve = CurvedAnimation(
      parent: _animationController,
      curve: widget.curve ?? Curves.bounceInOut,
    );

    _colorAnimation = ColorTween(
      begin: isActive!
          ? widget.activeColor ?? Colors.red
          : widget.deactiveColor ?? Colors.grey[400],
      end: isActive!
          ? widget.deactiveColor ?? Colors.grey[400]
          : widget.activeColor ?? Colors.red,
    ).animate(_curve);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          tween: Tween<double>(
            begin: widget.deactiveSize ?? 30,
            end: widget.activeSize ?? 33,
          ),
          weight: widget.activeSize ?? 33,
        ),
        TweenSequenceItem(
          tween: Tween<double>(
            begin: widget.activeSize ?? 33,
            end: widget.deactiveSize ?? 30,
          ),
          weight: widget.activeSize ?? 33,
        ),
      ],
    ).animate(_curve);

    _animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.dismissed) {
          setState(() {
            widget.isLiked! ? isActive = true : isActive = false;
          });
          //AnimatedIcons.arrow_menu;
        } else if (status == AnimationStatus.completed) {
          setState(() {
            widget.isLiked! ? isActive = false : isActive = true;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            /// 애니메이션 중간에 사용자의 터치를 방지합니다.
            ///
            /// DB에 좋아요 값을 +1, -1 하는 작업이 애니메이션 시간보다 짧게 걸린다는 것이 보장되는 경우
            /// 자체 로딩을 만들지 않아도 애니메이션 중간에 좋아요 터치를 제한해서 괜찮습니다.
            /// 하지만 비동기 작업 시간이 애니메이션 시간보다 오래 걸릴 경우 자체 로딩을 만들어야 합니다.
            /// 왠만하면 자체 로딩을 만들어 비동기 작업이 끝날 때 터치를 할 수 있도록 만드는 것이 좋습니다.
            if (_animationController.status == AnimationStatus.completed ||
                _animationController.status == AnimationStatus.dismissed) {
              widget.onTap!(!isActive!);
            }

            if (widget.isLiked!) {
              isActive!
                  ? _animationController.forward()
                  : _animationController.reverse();
            } else {
              isActive!
                  ? _animationController.reverse()
                  : _animationController.forward();
            }
          },
          child: Icon(
            widget.icon ?? Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          ),
        );
      },
    );
  }
}
