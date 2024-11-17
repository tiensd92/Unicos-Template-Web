import 'package:flutter/material.dart';

import '../pagination/pagination.dart';
import 'unicos_table_row.dart';

class UnicosTable extends StatelessWidget {
  final List<String> labels;
  final UnicosPaginationViewModel? pagination;
  final List<UnicosTableRow> rows;
  final Map<int, TableColumnWidth>? columnWidth;
  final double minWidth;

  const UnicosTable({
    super.key,
    required this.labels,
    required this.rows,
    this.pagination,
    this.columnWidth,
    this.minWidth = 950,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = constraints.biggest;

      final table = Table(
        columnWidths: columnWidth,
        border: TableBorder(
          horizontalInside: const BorderSide(
            width: 1,
            color: Color(0xFFECECEC),
            style: BorderStyle.solid,
          ),
        ),
        children: [
          TableRow(
            children: labels
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF464255),
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
                    child = Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        e,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF464255),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  } else if (e is Widget) {
                    child = Padding(
                      padding: const EdgeInsets.all(15),
                      child: e,
                    );
                  } else {
                    child = const SizedBox.shrink();
                  }

                  return child;
                },
              ).toList(),
            ),
          ),
        ],
      );

      final tableContainer = DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(14),
        ),
        child: rows.isEmpty
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  table,
                  SizedBox(
                    height: 200,
                    child: Center(
                      child: Text('emty data'),
                    ),
                  ),
                ],
              )
            : table,
      );

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
                      width: size.width < minWidth ? minWidth : size.width,
                      child: tableContainer,
                    ),
                  ),
                )
              : tableContainer,
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
