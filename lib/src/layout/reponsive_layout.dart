import 'package:flutter/material.dart';

class ReponsiveLayout extends StatelessWidget {
  final Widget child;
  final double? fixedWidth;
  final Color? backgroundColor;

  const ReponsiveLayout({
    super.key,
    required this.child,
    this.fixedWidth,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double scale = size.width >= 600 ? 1 : size.width / 600;
    final double height = size.height / scale;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Transform.scale(
            alignment: Alignment.topLeft,
            scale: scale,
            child: Container(
              color: backgroundColor,
              width: fixedWidth ?? (scale == 1 ? size.width : 600),
              height: height,
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
