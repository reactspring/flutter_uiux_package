import 'package:flutter/material.dart';
import 'package:flutter_uiux_package/src/widgets/toast/toast.dart';

class ToastMessage extends StatefulWidget {
  final Widget child;
  final VoidCallback onDismissed;
  final Duration showOutAnimationDuration;
  final Duration hideOutAnimationDuration;
  final Duration duration;
  final double defaultOffset;
  final double? offset;
  final VoidCallback? onTap;
  final ToastGravity? gravity;
  final double? left;
  final double? right;
  final int? delay;

  ToastMessage({
    Key? key,
    required this.child,
    required this.onDismissed,
    this.showOutAnimationDuration = const Duration(milliseconds: 500),
    this.hideOutAnimationDuration = const Duration(milliseconds: 500),
    this.duration = const Duration(milliseconds: 1000),
    this.defaultOffset = 16,
    this.offset,
    this.onTap,
    this.gravity = ToastGravity.BOTTOM,
    this.left,
    this.right,
    this.delay,
  }) : super(key: key);

  @override
  _ToastMessageState createState() => _ToastMessageState();
}

class _ToastMessageState extends State<ToastMessage>
    with SingleTickerProviderStateMixin {
  late Animation offsetAnimation;
  late AnimationController animationController;
  double? defaultOffset;

  @override
  void initState() {
    defaultOffset = widget.defaultOffset;
    _setupAndStartAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _setupAndStartAnimation() async {
    animationController = AnimationController(
      vsync: this,
      duration: widget.showOutAnimationDuration,
      reverseDuration: widget.hideOutAnimationDuration,
    );

    var offsetTween = widget.gravity == ToastGravity.TOP
        ? Tween<Offset>(
            begin: Offset(0.0, -0.2),
            end: Offset(0.0, 0.0),
          )
        : Tween<Offset>(
            begin: Offset(0.0, 0.2),
            end: Offset(0.0, 0.0),
          );

    offsetAnimation = offsetTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticOut,
        reverseCurve: Curves.linearToEaseOut,
      ),
    )..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          await Future.delayed(
            widget.delay == null
                ? widget.duration
                : Duration(
                    milliseconds: widget.delay!,
                  ),
          );
          if (mounted) {
            await animationController.reverse();
            setState(() {
              defaultOffset = 0;
            });
          }
        }

        if (status == AnimationStatus.dismissed) {
          widget.onDismissed.call();
        }
      });

    await animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return AnimatedPositioned(
      duration: widget.hideOutAnimationDuration * 1.5,
      curve: Curves.linearToEaseOut,
      top: widget.gravity == ToastGravity.TOP
          ? widget.defaultOffset + (widget.offset ?? 0.0)
          : (widget.gravity == ToastGravity.CENTER
              ? screenHeight / 2.0 - 9.0
              : null),
      bottom: widget.gravity == ToastGravity.BOTTOM
          ? widget.defaultOffset + (widget.offset ?? 0.0)
          : null,
      left: widget.left ?? 16,
      right: widget.right ?? 16,
      child: SlideTransition(
        position: offsetAnimation as Animation<Offset>,
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              widget.onTap?.call();
              animationController.reverse();
            },
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
