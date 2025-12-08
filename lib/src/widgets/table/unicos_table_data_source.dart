part of 'table.dart';

class UnicosTableDataSource extends DataGridSource {
  final List<UnicosTableRow> data;
  final List<String> labels;

  UnicosTableDataSource({required this.data, required this.labels})
    : assert(labels.isNotEmpty);

  @override
  List<DataGridRow> get rows => data
      .map(
        (r) => DataGridRow(
          cells: r.cells.mapIndexed((index, e) {
            Widget child;

            if (e is String) {
              child = Center(
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
              child = Padding(padding: EdgeInsets.all(8), child: e);
            } else {
              child = const SizedBox.shrink();
            }

            return DataGridCell<Widget>(
              columnName: labels[index],
              value: child,
            );
          }).toList(),
        ),
      )
      .toList();

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          child: e.value,
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: UnicosColor.darkGrey7)),
          ),
        );
      }).toList(),
    );
  }

  @override
  int compare(DataGridRow? a, DataGridRow? b, SortColumnDetails sortColumn) {
    return -1;
  }
}
