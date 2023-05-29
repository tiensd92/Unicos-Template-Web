import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';

class UnicosSingleBody extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final bool center;

  const UnicosSingleBody({
    Key? key,
    this.center = false,
    required this.child,
    this.maxWidth = 400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final widget = SizedBox(
      width: maxWidth,
      child: child,
    );

    if (center) {
      if (width < maxWidth) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: widget,
        );
      }

      return Center(
        child: widget,
      );
    }

    if (width < maxWidth) {
      return CrossScroll(
        child: widget,
      );
    }

    return SingleChildScrollView(
      child: widget,
    );
  }
}
