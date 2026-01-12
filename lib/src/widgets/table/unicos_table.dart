part of 'table.dart';

class UnicosTable extends StatelessWidget {
  final List<String> labels;
  final UnicosTablePagination? pagination;
  final List<UnicosTableRow> rows;
  final Map<String, double>? columnFixedWidths;
  final Map<String, bool?>? allowSortings;
  final Map<int, int>? rowLines;
  final double? minRownHeight;
  final bool expanded;
  final bool isLoading;
  final Widget? loadingBuilder;
  final void Function(String, bool?)? onColumnSortChanging;

  const UnicosTable({
    super.key,
    required this.labels,
    required this.rows,
    this.columnFixedWidths,
    this.rowLines,
    this.minRownHeight,
    this.expanded = false,
    this.pagination,
    this.isLoading = false,
    this.loadingBuilder,
    this.allowSortings,
    this.onColumnSortChanging,
  });

  @override
  Widget build(BuildContext context) {
    final dataSource = UnicosTableDataSource(data: rows, labels: labels);

    for (final allowSorting
        in allowSortings?.entries ?? List<MapEntry<String, bool?>>.empty()) {
      if (allowSorting.value != null) {
        dataSource.sortedColumns.add(
          SortColumnDetails(
            name: allowSorting.key,
            sortDirection: allowSorting.value == true
                ? DataGridSortDirection.descending
                : DataGridSortDirection.ascending,
          ),
        );
      }
    }

    dataSource.sort();

    final fixedMinRowHeight = 48;
    final dataGrid = SfDataGridTheme(
      data: SfDataGridThemeData(
        gridLineStrokeWidth: 1,
        frozenPaneLineWidth: 1,
        frozenPaneElevation: 0,
      ),
      child: SfDataGrid(
        selectionMode: SelectionMode.none,
        allowSorting: true,
        allowMultiColumnSorting: true,
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
            final rowHeight = max(
              max(
                (rowLines?[details.rowIndex - 1] ?? 0) * fixedMinRowHeight,
                80,
              ),
              fixedMinRowHeight,
            );
            return max(
              rowHeight.toDouble(),
              (minRownHeight ?? fixedMinRowHeight).toDouble(),
            );
          }

          return minRownHeight ?? details.rowHeight;
        },
        columns: _generateColumns(
          labels: labels,
          columnFixedWidths: columnFixedWidths,
        ),
        onColumnSortChanging: (newSortedColumn, oldSortedColumn) {
          if (newSortedColumn == null) {
            if (oldSortedColumn != null) {
              onColumnSortChanging?.call(oldSortedColumn.name, null);
            }

            return false;
          }

          onColumnSortChanging?.call(
            newSortedColumn.name,
            newSortedColumn.sortDirection == DataGridSortDirection.descending,
          );
          return false;
        },
        allowTriStateSorting: true,
        sortingGestureType: SortingGestureType.doubleTap,
        source: dataSource,
      ),
    );

    if (isLoading) {
      return Align(
        alignment: Alignment.topCenter,
        child: UnicosCard(
          padding: EdgeInsets.zero,
          child: SizedBox(
            height: 240,
            child: Column(
              children: [
                SizedBox(height: 40, child: dataGrid),
                Expanded(
                  child: Center(child: loadingBuilder ?? Text('emty data')),
                ),
              ],
            ),
          ),
        ),
      );
    }

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
    Map<String, double>? columnFixedWidths,
    required List<String> labels,
  }) {
    return labels.map((lb) {
      double minWidth = 200;
      ColumnWidthMode columnWidthMode = ColumnWidthMode.auto;

      if (columnFixedWidths?.containsKey(lb) == true) {
        columnWidthMode = ColumnWidthMode.fill;
        minWidth = columnFixedWidths?[lb] ?? minWidth;
      }

      return GridColumn(
        allowSorting: allowSortings?.containsKey(lb) ?? false,
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
    bool isLoading = false,
    Widget? loadingBuilder,
    required List<String> labels,
    required UnicosTableRow Function(int) itemBuilder,
    required int itemCount,
    Map<String, double>? columnFixedWidths,
    Map<String, bool?>? allowSortings,
    final Map<int, int>? rowLines,
    double? minRownHeight,
    UnicosTablePagination? pagination,
    final void Function(String, bool?)? onColumnSortChanging,
  }) {
    return UnicosTable(
      labels: labels,
      rows: List.generate(itemCount, (index) => itemBuilder(index)),
      pagination: pagination,
      columnFixedWidths: columnFixedWidths,
      rowLines: rowLines,
      minRownHeight: minRownHeight,
      expanded: expanded,
      isLoading: isLoading,
      loadingBuilder: loadingBuilder,
      allowSortings: allowSortings,
      onColumnSortChanging: onColumnSortChanging,
    );
  }
}
