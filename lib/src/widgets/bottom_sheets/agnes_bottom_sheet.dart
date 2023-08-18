import 'package:flutter/material.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class AgnesBottomSheet {
  /*
required BuildContext context,
  required Widget Function(BuildContext) builder,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  BoxConstraints? constraints,
  Color? barrierColor,
  bool isScrollControlled = false,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  RouteSettings? routeSettings,
  AnimationController? transitionAnimationController,
  */
  final Text? text;
  final double? vertical;
  final double? horizontal;
  final VoidCallback? onPressed;
  final Widget child;

  const AgnesBottomSheet({
    Key? key,
    this.text,
    this.onPressed,
    this.vertical,
    this.horizontal,
    required this.child,
  });

  void showDefault() {
    Size _size =
        MediaQuery.of(UiUxData.navigatorKey!.currentState!.context).size;
    showModalBottomSheet(
      context: UiUxData.navigatorKey!.currentState!.context,
      constraints: BoxConstraints(
        maxWidth: _size.width * 0.92,
        maxHeight: _size.height * 0.5,
      ),
      builder: (context) {
        return child;
      },
    );
  }

  void showAnimation() {
    showModalBottomSheet(
      //isDismissible: false,
      //enableDrag: false,
      isScrollControlled: true,
      context: UiUxData.navigatorKey!.currentState!.context,
      builder: (context) {
        return Container(height: 100.0);
      },
    );
  }
}
