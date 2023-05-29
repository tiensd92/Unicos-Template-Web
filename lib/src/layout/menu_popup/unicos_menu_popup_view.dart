import 'package:flutter/material.dart';

class UnicosMenuPopupView extends StatefulWidget {
  final RelativeRect position;
  final void Function()? onHide;
  final List<Widget> items;

  const UnicosMenuPopupView({
    super.key,
    this.onHide,
    required this.items,
    required this.position,
  });

  @override
  State<StatefulWidget> createState() => UnicosMenuPopupViewState();
}

class UnicosMenuPopupViewState extends State<UnicosMenuPopupView>
    with SingleTickerProviderStateMixin {
  final _keyAnimatedList = GlobalKey<AnimatedListState>();
  List<Widget> listMenu = List.empty(growable: true);

  late final AnimationController _aniController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    listMenu = List.from(widget.items);

    _aniController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_aniController);

    _aniController.addListener(() {
      if (_aniController.isAnimating) {
        setState(() {});
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.position.top,
      right: widget.position.right,
      left: widget.position.left,
      bottom: 0,
      child: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.horizontal,
        child: Material(
          color: Colors.white,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            key: _keyAnimatedList,
            itemCount: listMenu.length,
            itemBuilder: (ctx, index) {
              return listMenu[index];
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _aniController.dispose();
    super.dispose();
  }

  void change({required List<Widget> items}) {
    setState(() {
      listMenu = List.from(widget.items);
    });
  }
}
