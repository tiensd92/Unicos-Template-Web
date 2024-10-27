import 'package:flutter/material.dart';
import 'package:unicos_template/unicos_template.dart';

import 'unicos_table_header_row.dart';

class UnicosTable extends StatelessWidget {
  final List<String> labels;

  const UnicosTable({super.key, required this.labels});

  @override
  Widget build(BuildContext context) {
    return UnicosCard(
      child: Table(
       
        children: [
          TableRow(
            children:
                labels.map((e) => UnicosTableHeaderRow(label: e)).toList(),
          ),
        ],
      ),
    );
  }
}
