import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class UnicosForm extends StatelessWidget {
  final List<Widget> children;
  final Widget? footer;
  final Widget? header;
  final List<int>? expandedColumns;
  final bool hasScroll;
  final EdgeInsets padding;
  final List<Widget>? actions;

  const UnicosForm({
    super.key,
    required this.children,
    this.footer,
    this.header,
    this.expandedColumns,
    this.hasScroll = false,
    this.padding = const EdgeInsets.all(24),
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        int column = (constraints.maxWidth / (400 + 17)).ceil();
        column = max(1, column);
        List<Widget> tables = List.empty(growable: true);

        if (column == 1) {
          tables = children;
        } else {
          List<dynamic> rows = List.empty(growable: true);
          children.forEachIndexed((index, child) {
            if (expandedColumns?.contains(index) == true) {
              rows.add(child);
            } else if (rows.isEmpty || rows.last is! List<Widget>) {
              rows.add([child]);
            } else if ((rows.last as List<Widget>).length < column) {
              rows.last.add(child);
            }
          });

          tables = rows
              .map((e) {
                if (e is Widget) {
                  return e;
                }

                if (e is List<Widget>) {
                  return Row(
                    spacing: 17,
                    children: List.generate(
                      e.length,
                      (index) => Expanded(child: e[index]),
                    ),
                  );
                }

                return null;
              })
              .nonNulls
              .toList();
        }

        final child = Column(
          spacing: 17,
          mainAxisSize: MainAxisSize.min,
          children: [
            ?header,
            ...tables,
            ?footer,
            if (actions?.isNotEmpty == true)
              Align(
                alignment: Alignment.centerRight,
                child: Row(mainAxisSize: MainAxisSize.min, children: actions!),
              ),
          ],
        );

        return UnicosCard(hasScroll: hasScroll, padding: padding, child: child);
      },
    );
  }
}
