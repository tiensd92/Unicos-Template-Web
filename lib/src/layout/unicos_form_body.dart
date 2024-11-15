import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class UnicosFormBody extends StatelessWidget {
  final List<Widget> children;
  final Widget? footer;
  final Widget? header;

  const UnicosFormBody({
    super.key,
    required this.children,
    this.footer,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      final column =
          constraints.maxWidth <= 400 ? 1 : constraints.maxWidth ~/ 400;
      final List<List<Widget>> tables =
          children.isEmpty ? [] : children.slices(column).toList();

      return UnicosCard(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (header != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 17),
                  child: header!,
                ),
              if (column == 1)
                ...List.generate(
                  children.length * 2 - 1,
                  (index) => index.isOdd
                      ? const SizedBox(height: 17)
                      : children[index ~/ 2],
                ),
              if (column > 1)
                ...List.generate(
                  tables.length * 2 - 1,
                  (index) => index.isOdd
                      ? const SizedBox(height: 17)
                      : Row(
                          children: List.generate(
                            tables[index ~/ 2].length * 2 - 1,
                            (indexR) => indexR.isOdd
                                ? const SizedBox(width: 17)
                                : Expanded(
                                    child: tables[index ~/ 2][indexR ~/ 2],
                                  ),
                          ),
                        ),
                ),
              if (footer != null)
                Padding(
                  padding: const EdgeInsets.only(top: 17),
                  child: footer!,
                ),
            ],
          ),
        ),
      );
    });
  }
}
