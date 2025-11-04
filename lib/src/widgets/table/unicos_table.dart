part of 'table.dart';

class UnicosTable extends StatelessWidget {
  final List<String> labels;
  final UnicosPaginationUIModel? pagination;
  final List<UnicosTableRow> rows;
  final Map<int, TableColumnWidth>? columnWidths;
  final ValueChanged<int>? onToPage;
  final Map<int, int>? rowLines;
  final double? lineHeight;
  final bool expanded;

  const UnicosTable({
    super.key,
    required this.labels,
    required this.rows,
    this.pagination,
    this.columnWidths,
    this.onToPage,
    this.rowLines,
    this.lineHeight,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final dataGrid = SfDataGridTheme(
      data: SfDataGridThemeData(
        gridLineStrokeWidth: 1,
        frozenPaneLineWidth: 1,
        frozenPaneElevation: 0,
      ),
      child: SfDataGrid(
        selectionMode: SelectionMode.none,
        verticalScrollPhysics: expanded
            ? AlwaysScrollableScrollPhysics()
            : NeverScrollableScrollPhysics(),
        shrinkWrapRows: expanded,
        frozenColumnsCount: 1,
        headerRowHeight: 40,
        highlightRowOnHover: false,
        headerGridLinesVisibility: GridLinesVisibility.horizontal,
        gridLinesVisibility: GridLinesVisibility.horizontal,
        isScrollbarAlwaysShown: true,
        onQueryRowHeight: (details) {
          if (details.rowIndex == 0) {
            return 40;
          }

          if (rowLines?.containsKey(details.rowIndex - 1) == true) {
            return max(
              max(
                (rowLines?[details.rowIndex - 1] ?? 0) * (lineHeight ?? 0),
                80,
              ),
              details.rowHeight,
            );
          }

          return details.rowHeight;
        },
        columns: _generateColumns(labels: labels, columnWidths: columnWidths),
        source: UnicosTableDataSource(data: rows, labels: labels),
      ),
    );

    if (rows.isEmpty) {
      return UnicosCard(
        padding: EdgeInsets.zero,
        child: SizedBox(
          height: 240,
          child: Column(
            children: [
              dataGrid,
              SizedBox(height: 200, child: Center(child: Text('emty data'))),
            ],
          ),
        ),
      );
    }

    if (pagination != null) {
      return Column(
        children: [
          expanded
              ? Expanded(
                  child: UnicosCard(padding: EdgeInsets.zero, child: dataGrid),
                )
              : UnicosCard(padding: EdgeInsets.zero, child: dataGrid),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: UnicosPagination(onToPage: onToPage, model: pagination!),
            ),
          ),
        ],
      );
    }

    return UnicosCard(padding: EdgeInsets.zero, child: dataGrid);
  }

  List<GridColumn> _generateColumns({
    Map<int, TableColumnWidth>? columnWidths,
    required List<String> labels,
  }) {
    return labels.mapIndexed((index, lb) {
      double minWidth = 200;

      if (columnWidths?.containsKey(index) == true) {
        if (columnWidths?[index] is FixedColumnWidth) {
          minWidth = (columnWidths?[index] as FixedColumnWidth).value;
        }

        if (columnWidths?[index] is FlexColumnWidth) {
          minWidth = (columnWidths?[index] as FlexColumnWidth).value * 200;
        }
      }

      return GridColumn(
        autoFitPadding: EdgeInsets.zero,
        columnWidthMode: ColumnWidthMode.fill,
        width: minWidth,
        columnName: lb,
        label: Center(
          child: Tooltip(
            message: lb,
            child: Text(
              lb,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: UnicosColor.darkBody,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  factory UnicosTable.builder({
    bool expanded = false,
    required List<String> labels,
    UnicosPaginationUIModel? pagination,
    required UnicosTableRow Function(int) itemBuilder,
    required int itemCount,
    Map<int, TableColumnWidth>? columnWidths,
    final ValueChanged<int>? onToPage,
    final Map<int, int>? rowLines,
    double? lineHeight,
  }) {
    return UnicosTable(
      onToPage: onToPage,
      labels: labels,
      rows: List.generate(itemCount, (index) => itemBuilder(index)),
      pagination: pagination,
      columnWidths: columnWidths,
      rowLines: rowLines,
      lineHeight: lineHeight,
      expanded: expanded,
    );
  }
}
