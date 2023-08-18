// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class OpenBottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  final double bottomSheetOffset;

  const OpenBottomSheet({
    required this.scrollController,
    required this.bottomSheetOffset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            controller: scrollController,
            children: [
              Text(
                '  position $bottomSheetOffset',
                style: Theme.of(context).textTheme.headline6,
              ),
              Column(
                children: _children,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> _children = [
  const _TestContainer(color: Color(0xEEFFFF00)),
  const _TestContainer(color: Color(0xDD99FF00)),
  const _TestContainer(color: Color(0xCC00FFFF)),
  const _TestContainer(color: Color(0xBB555555)),
  const _TestContainer(color: Color(0xAAFF5555)),
  const _TestContainer(color: Color(0x9900FF00)),
  const _TestContainer(color: Color(0x8800FF00)),
  const _TestContainer(color: Color(0x7700FF00)),
];

class _TestContainer extends StatelessWidget {
  final Color color;

  const _TestContainer({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: color,
      ),
    );
  }
}
