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
    final dataGrid = UnicosCard(
      padding: EdgeInsets.zero,
      child: SfDataGrid(
        selectionMode: SelectionMode.none,
        shrinkWrapRows: true,
        rowHeight: 80,
        headerRowHeight: 40,
        headerGridLinesVisibility: GridLinesVisibility.none,
        gridLinesVisibility: GridLinesVisibility.none,
        isScrollbarAlwaysShown: true,
        columns: _generateColumns(labels: labels, columnWidths: columnWidths),
        source: UnicosTableDataSource(data: rows, labels: labels),
      ),
    );

    if (rows.isEmpty) {
      return Column(
        children: [
          dataGrid,
          SizedBox(height: 200, child: Center(child: Text('emty data'))),
        ],
      );
    }

    if (pagination != null) {
      return Column(
        children: [
          dataGrid,
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

    return dataGrid;
  }

  List<GridColumn> _generateColumns({
    Map<int, TableColumnWidth>? columnWidths,
    required List<String> labels,
  }) {
    return labels.mapIndexed((index, lb) {
      double minWidth = double.nan;
      ColumnWidthMode columnWidthMode = ColumnWidthMode.none;

      if (columnWidths?.containsKey(index) == true) {
        if (columnWidths?[index] is FixedColumnWidth) {
          columnWidthMode = ColumnWidthMode.fill;
          minWidth = (columnWidths?[index] as FixedColumnWidth).value;
        }

        if (columnWidths?[index] is FlexColumnWidth) {
          columnWidthMode = ColumnWidthMode.fill;
          minWidth = 400;
        }
      }

      return GridColumn(
        autoFitPadding: EdgeInsets.zero,
        columnWidthMode: columnWidthMode,
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
                color: Color(0xFF464255),
              ),
            ),
          ),
        ),
      );
    }).toList();
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
