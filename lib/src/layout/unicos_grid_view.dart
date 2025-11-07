import 'dart:math';

import 'package:flutter/material.dart';

class UnicosGridView extends StatelessWidget {
  final int itemCount;
  final double? height;
  final double? width;
  final double? maxHeight;
  final Widget Function(BuildContext, int) itemBuilder;

  const UnicosGridView({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.height,
    this.width,
    this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    if (maxHeight == null) {
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: width ?? 400,
          mainAxisSpacing: 40,
          crossAxisSpacing: 40,
          mainAxisExtent: height,
        ),
        itemBuilder: itemBuilder,
        itemCount: itemCount,
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        int crossAxisCount = (width / (400 + 40)).ceil();
        crossAxisCount = max(1, crossAxisCount);
        final widthCrossAxis =
            (width - (crossAxisCount - 1) * 40) ~/ crossAxisCount;
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            mainAxisSpacing: 40,
            crossAxisSpacing: 40,
            mainAxisExtent: widthCrossAxis < 300 ? maxHeight : height,
          ),
          itemBuilder: itemBuilder,
          itemCount: itemCount,
        );
      },
    );
  }

  factory UnicosGridView.builder({
    Key? key,
    double? height,
    double? width,
    double? maxHeight,
    required int itemCount,
    required Widget Function(BuildContext, int) itemBuilder,
  }) {
    return UnicosGridView(
      key: key,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      height: height,
      width: width,
      maxHeight: maxHeight,
    );
  }
}
