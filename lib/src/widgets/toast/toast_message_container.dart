import 'package:flutter/material.dart';
import 'package:flutter_uiux_package/src/widgets/toast/toast.dart';

class ToastMessageContainer extends StatefulWidget {
  final ToastType messageType;
  final String message;
  final Widget? icon;
  final String? url;
  final Color backgroundColor;
  final TextStyle textStyle;

  const ToastMessageContainer.info({
    Key? key,
    required this.messageType,
    required this.message,
    this.icon,
    this.url,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    this.backgroundColor = Colors.black54,
  });

  const ToastMessageContainer.error({
    Key? key,
    required this.messageType,
    required this.message,
    this.icon,
    this.url,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    this.backgroundColor = const Color(0xffa50034),
  });

  @override
  _ToastMessageContainerState createState() => _ToastMessageContainerState();
}

class _ToastMessageContainerState extends State<ToastMessageContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: _buildItems(context, widget)),
    );
  }
}

Widget _buildItems(context, widget) {
  switch (widget.messageType) {
    case ToastType.INFO:
    case ToastType.ERROR:
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.icon != null) ...[
            widget.icon!,
            SizedBox(width: 8.0),
          ],
          Flexible(child: Text(widget.message, style: widget.textStyle))
        ],
      );

    default:
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.icon != null) ...[
            widget.icon!,
            SizedBox(width: 2.0),
          ],
          Flexible(child: Text(widget.message, style: widget.textStyle))
        ],
      );
  }
}
