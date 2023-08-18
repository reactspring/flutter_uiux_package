import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_uiux_package/flutter_uiux_package.dart';
import 'package:flutter_uiux_package/src/widgets/toast/toast_message.dart';
import 'package:flutter_uiux_package/src/widgets/toast/toast_message_container.dart';

enum ToastType {
  INFO,
  ERROR,
}

enum ToastGravity { TOP, BOTTOM, CENTER }

List<OverlayEntry> _overlays = <OverlayEntry>[];

class Toast {
  static void info(BuildContext context,
      {required String message,
      double? offset,
      int? delay,
      ToastGravity? gravity}) {
    showToastMessage(
        context,
        ToastMessageContainer.info(
          messageType: ToastType.INFO,
          message: message,
          icon: ClipOval(
            child: Material(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset(
                  Assets.check,
                  width: 16,
                  height: 16,
                ),
              ),
            ),
          ),
        ),
        gravity: gravity ?? ToastGravity.BOTTOM,
        offset: offset,
        delay: delay);
  }

  static void error(BuildContext context,
      {required String message,
      double? offset,
      int? delay,
      ToastGravity? gravity}) {
    showToastMessage(
        context,
        ToastMessageContainer.error(
          messageType: ToastType.INFO,
          message: message,
          icon: ClipOval(
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset(
                  Assets.warning,
                  width: 16,
                  height: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        gravity: gravity ?? ToastGravity.BOTTOM,
        offset: offset,
        delay: delay);
  }

  static void showToastMessage(BuildContext context, Widget child,
      {ToastGravity? gravity = ToastGravity.TOP,
      VoidCallback? onTap,
      OverlayState? overlayState,
      double? left,
      double? right,
      double? offset,
      int? delay}) async {
    overlayState ??= Overlay.of(context);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) {
        return ToastMessage(
          onDismissed: () {
            if (overlayEntry.mounted) {
              overlayEntry.remove();
            }
          },
          onTap: onTap,
          gravity: gravity,
          delay: delay,
          left: left,
          right: right,
          offset: offset,
          child: child,
        );
      },
    );

    if (_overlays.isNotEmpty) {
      var _object = _overlays.removeLast();
      if (_object.mounted) _object.remove();
    }
    _overlays.add(overlayEntry);
    overlayState?.insert(overlayEntry);
  }

  static ScaffoldMessengerState showSnackbar(BuildContext context,
      {required String message}) {
    var snackBar = SnackBar(
      backgroundColor: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      elevation: 2.0,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      content: Container(
        height: 16,
        child: Center(
          child: Text(message),
        ),
      ),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    return ScaffoldMessenger.of(context);
  }

  static void message(
    BuildContext context, {
    required String message,
  }) {
    showSnackbar(context, message: message);
  }

  static void remove() {
    if (_overlays.isNotEmpty) {
      var _object = _overlays.removeLast();
      if (_object.mounted) _object.remove();
    }
  }
}
