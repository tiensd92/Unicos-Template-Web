import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_multiselect/flutter_simple_multiselect.dart';

import '../resources/resources.dart';
import 'unicos_tag.dart';

class UnicosMultiSelect<T> extends StatelessWidget {
  final List<T> values;
  final List<T> selecetedValues;
  final EdgeInsets padding;
  final ValueChanged<T>? onRemove;
  final ValueChanged<T>? onSelected;

  const UnicosMultiSelect({
    super.key,
    required this.values,
    required this.selecetedValues,
    this.padding = const EdgeInsets.only(
      left: 20,
      right: 20,
      top: 10,
      bottom: 18,
    ),
    this.onRemove,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMultiselect<T>(
      autofocus: false,
      padding: padding,
      enableBorderColor: UnicosColor.darkGrey4,
      focusedBorderColor: UnicosColor.success,
      borderRadius: 8,
      borderSize: 1,
      resetTextOnSubmitted: true,
      minTextFieldWidth: 300,
      suggestionPadding: EdgeInsets.zero,
      leadingSelectionPadding: 0,
      suggestionsBoxMaxHeight: 300,
      length: selecetedValues.length,
      tagBuilder: (context, index) => UnicosTag.smallEditable(
        selecetedValues[index].toString(),
        onPressed: () => onRemove?.call(selecetedValues[index]),
      ),
      suggestionBuilder: (context, state, data) {
        /* var existingIndex = selecetedValues.indexWhere(
          (element) => element == data,
        ); */
        var selectedData = data;
        return Material(
          color: UnicosColor.white,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onPanDown: (_) {
              onSelected?.call(selectedData);
              state.selectAndClose(data);
            },
            child: ListTile(
              dense: true,
              //selected: existingIndex >= 0,
              //trailing: existingIndex >= 0 ? const Icon(Icons.check) : null,
              selectedColor: Colors.white,
              selectedTileColor: Colors.green,
              title: Text(selectedData.toString()),
            ),
          ),
        );
      },
      suggestionsBoxRadius: 12,
      findSuggestions: (query) {
        return values
            .whereNot((e) => selecetedValues.contains(e))
            .where(
              (e) => e.toString().toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      },
    );
  }
}
