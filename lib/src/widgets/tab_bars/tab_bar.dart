import 'package:flutter/material.dart';

class AgnesTabBar extends StatefulWidget {
  final List<Widget> tabs;
  final List<Widget> views;
  final Key? key;
  final void Function(int)? onTap;
  final int initialIndex;
  final bool indexIsChanging;
  final ScrollPhysics? scrollPhysics;

  AgnesTabBar({
    required this.tabs,
    required this.views,
    this.key,
    this.initialIndex = 0,
    required this.onTap,
    this.indexIsChanging = false,
    this.scrollPhysics,
  })  : assert(
          tabs.length == views.length,
          ' (${tabs.length})와 (${views.length})가 같아야 합니다.',
        ),
        super(key: key);

  @override
  State<AgnesTabBar> createState() => _AgnesTabBarState();
}

class _AgnesTabBarState extends State<AgnesTabBar>
    with AutomaticKeepAliveClientMixin<AgnesTabBar>, TickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(
        initialIndex: widget.initialIndex,
        length: widget.tabs.length,
        vsync: this);
    _controller.addListener(
      () {
        if (!_controller.indexIsChanging) {
          widget.onTap!(_controller.index);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: widget.tabs.length,
      child: Column(
        children: [
          TabBar(
            tabs: widget.tabs,
            onTap: widget.onTap,
            controller: _controller,
            physics: widget.scrollPhysics,
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: widget.views,
              physics: widget.scrollPhysics,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
