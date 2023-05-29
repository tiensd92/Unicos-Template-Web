import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';

import '../pagination/pagination.dart';
import 'unicos_table_row.dart';

class UnicosTable extends StatelessWidget {
  final List<String> labels;
  final UnicosPaginationViewModel? pagination;
  final List<UnicosTableRow> rows;
  final double columnHeight;
  final Map<int, TableColumnWidth>? columnWidth;
  final double minWidth;

  const UnicosTable({
    super.key,
    required this.labels,
    required this.rows,
    this.pagination,
    this.columnWidth,
    this.minWidth = 950,
    required this.columnHeight,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = constraints.biggest;
      final tableHeight = 64 + rows.length * (columnHeight + 30);
      final parentHeght = size.height - (pagination == null ? 0 : 90);

      final table = Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Table(
          columnWidths: columnWidth,
          children: [
            TableRow(
              children: labels
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: SizedBox(
                        height: 34,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            e,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF464255),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            ...rows.map(
              (e) => TableRow(
                children: e.cells.map(
                  (e) {
                    Widget child;

                    if (e is String) {
                      child = Text(
                        e,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF464255),
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    } else if (e is Widget) {
                      child = e;
                    } else {
                      child = const SizedBox.shrink();
                    }

                    return Container(
                      height: columnHeight,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Color(0xFFECECEC),
                          ),
                        ),
                      ),
                      child: child,
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      );

      if (tableHeight > parentHeght) {
        return Column(
          children: [
            Expanded(
              child: CrossScroll(
                child: SizedBox(
                  width: size.width < minWidth ? minWidth : size.width,
                  child: table,
                ),
              ),
            ),
            if (pagination != null)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: UnicosPagination(
                    viewModel: pagination!,
                  ),
                ),
              ),
          ],
        );
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          size.width < minWidth
              ? Scrollbar(
                  trackVisibility: true,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: 950,
                      child: table,
                    ),
                  ),
                )
              : table,
          if (pagination != null)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: UnicosPagination(
                  viewModel: pagination!,
                ),
              ),
            ),
        ],
      );
    });
  }
}
