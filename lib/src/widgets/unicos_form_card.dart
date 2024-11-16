import 'package:flutter/material.dart';
import 'package:unicos_template/unicos_template.dart';

class UnicosFormCard extends StatelessWidget {
  final Widget? header;
  final double minWidth;
  final List<Widget> children;
  final List<Widget>? actions;
  final double heightRow;

  const UnicosFormCard({
    super.key,
    this.header,
    this.minWidth = 950,
    required this.children,
    this.actions,
    this.heightRow = 20,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contrainst) {
      return UnicosCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (header != null)
              Padding(
                padding: EdgeInsets.only(bottom: 21),
                child: header!,
              ),
            Flexible(
              child: SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: contrainst.maxWidth >= minWidth ? 2 : 1,
                    mainAxisExtent: heightRow,
                    mainAxisSpacing: 17,
                    crossAxisSpacing: 17,
                  ),
                  itemCount: children.length,
                  itemBuilder: (ctx, index) => children[index],
                ),
              ),
            ),
            if (actions != null)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 21),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions!,
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}
