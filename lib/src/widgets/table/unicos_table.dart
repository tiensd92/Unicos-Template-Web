part of 'table.dart';

class UnicosTable extends StatelessWidget {
  final List<String> labels;
  final UnicosTablePagination? pagination;
  final List<UnicosTableRow> rows;
  final Map<String, TableColumnWidth>? columnWidths;
  final Map<int, int>? rowLines;
  final double? lineHeight;
  final bool expanded;

  const UnicosTable({
    super.key,
    required this.labels,
    required this.rows,
    this.columnWidths,
    this.rowLines,
    this.lineHeight,
    this.expanded = false,
    this.pagination,
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
        shrinkWrapRows: !expanded,
        frozenColumnsCount: rows.isEmpty ? 0 : 1,
        headerRowHeight: 40,
        highlightRowOnHover: false,
        headerGridLinesVisibility: GridLinesVisibility.none,
        gridLinesVisibility: GridLinesVisibility.none,
        isScrollbarAlwaysShown: rows.isNotEmpty,
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
              lineHeight ?? details.rowHeight,
            );
          }

          return lineHeight ?? details.rowHeight;
        },
        columns: _generateColumns(labels: labels, columnWidths: columnWidths),
        source: UnicosTableDataSource(data: rows, labels: labels),
      ),
    );

    if (rows.isEmpty) {
      return Align(
        alignment: Alignment.topCenter,
        child: UnicosCard(
          padding: EdgeInsets.zero,
          child: SizedBox(
            height: 240,
            child: Column(
              children: [
                SizedBox(height: 40, child: dataGrid),
                Expanded(child: Center(child: Text('emty data'))),
              ],
            ),
          ),
        ),
      );
    }

    final table = UnicosCard(padding: EdgeInsets.zero, child: dataGrid);

    if (pagination != null) {
      return Column(
        children: [
          expanded ? Expanded(child: table) : table,
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: UnicosPagination(
                onToPage: pagination?.onToPage,
                onToEnd: pagination?.onToEnd,
                onToStart: pagination?.onToStart,
                current: pagination?.current ?? 1,
                total: pagination?.total ?? 1,
              ),
            ),
          ),
        ],
      );
    }

    return table;
  }

  List<GridColumn> _generateColumns({
    Map<String, TableColumnWidth>? columnWidths,
    required List<String> labels,
  }) {
    return labels.map((lb) {
      double minWidth = 200;
      ColumnWidthMode columnWidthMode = ColumnWidthMode.auto;

      if (columnWidths?.containsKey(lb) == true) {
        if (columnWidths?[lb] is FixedColumnWidth) {
          columnWidthMode = ColumnWidthMode.fill;
          minWidth = (columnWidths?[lb] as FixedColumnWidth).value;
        }

        if (columnWidths?[lb] is FlexColumnWidth) {
          columnWidthMode = ColumnWidthMode.auto;
          minWidth = (columnWidths?[lb] as FlexColumnWidth).value * 200;
        }
      }

      return GridColumn(
        autoFitPadding: EdgeInsets.zero,
        columnWidthMode: ColumnWidthMode.fill,
        minimumWidth: columnWidthMode == ColumnWidthMode.fill ? minWidth : 200,
        width: columnWidthMode == ColumnWidthMode.fill ? minWidth : double.nan,
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
    required UnicosTableRow Function(int) itemBuilder,
    required int itemCount,
    Map<String, TableColumnWidth>? columnWidths,
    final Map<int, int>? rowLines,
    double? lineHeight,
    UnicosTablePagination? pagination,
  }) {
    return UnicosTable(
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
