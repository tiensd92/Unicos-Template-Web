import 'package:flutter/material.dart';

class UnicosGridView extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  const UnicosGridView({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contrainst) {
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          mainAxisSpacing: 40,
          crossAxisSpacing: 40,
        ),
        itemBuilder: itemBuilder,
        itemCount: itemCount,
      );
    });
  }

  factory UnicosGridView.builder(
      {Key? key,
      required int itemCount,
      required Widget Function(BuildContext, int) itemBuilder}) {
    return UnicosGridView(
      key: key,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
