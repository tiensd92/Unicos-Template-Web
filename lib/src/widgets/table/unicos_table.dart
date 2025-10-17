part of 'table.dart';

class UnicosTable extends StatelessWidget {
  final List<String> labels;
  final UnicosPaginationUIModel? pagination;
  final List<UnicosTableRow> rows;
  final Map<int, TableColumnWidth>? columnWidths;
  final ValueChanged<int>? onToPage;

  const UnicosTable({
    super.key,
    required this.labels,
    required this.rows,
    this.pagination,
    this.columnWidths,
    this.onToPage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = constraints.biggest;

      double minWidth = 0;

      columnWidths?.entries.forEach((e) {
        if (e.value is FixedColumnWidth) {
          minWidth += (e.value as FixedColumnWidth).value;
        }

        if (e.value is FlexColumnWidth) {
          minWidth += (e.value as FlexColumnWidth).value * 200;
        }
      });

      final hasHorizontalScroll = size.width < minWidth;

      final table = Table(
        columnWidths: columnWidths?.map((k, v) => MapEntry(
            k,
            v is FlexColumnWidth && hasHorizontalScroll
                ? FixedColumnWidth(v.value * 200)
                : v)),
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
                    child: Center(
                      child: Tooltip(
                        message: e,
                        child: Text(
                          e,
                          maxLines: 1,
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
          hasHorizontalScroll
              ? Scrollbar(
                  trackVisibility: true,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: hasHorizontalScroll ? minWidth : size.width,
                      child: tableContainer,
                    ),
                  ),
                )
              : tableContainer,
          if (pagination != null && rows.isNotEmpty)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: UnicosPagination(
                  onToPage: onToPage,
                  model: pagination!,
                ),
              ),
            ),
        ],
      );
    });
  }

  factory UnicosTable.builder({
    required List<String> labels,
    UnicosPaginationUIModel? pagination,
    required UnicosTableRow Function(int) itemBuilder,
    required int itemCount,
    Map<int, TableColumnWidth>? columnWidths,
    final ValueChanged<int>? onToPage,
  }) {
    return UnicosTable(
      onToPage: onToPage,
      labels: labels,
      rows: List.generate(itemCount, (index) => itemBuilder(index)),
      pagination: pagination,
      columnWidths: columnWidths,
    );
  }
}
