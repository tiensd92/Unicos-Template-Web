import 'package:flutter/material.dart';
import 'package:unicos_template/src/apprivals/apprivals.dart';

import '../resources/resources.dart';

class UnicosDropDown<T> extends StatelessWidget {
  final T? value;
  final ValueChanged<T?>? onChanged;
  final List<T> values;
  final Widget Function(T value) builder;
  final String? label;
  final bool isExpanded;
  final String? hintText;

  UnicosDropDown({
    super.key,
    required this.values,
    this.value,
    this.onChanged,
    required this.builder,
    this.label,
    this.isExpanded = true,
    this.hintText,
  }) : assert(values.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    final button = Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 25,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<T>(
        isExpanded: isExpanded,
        isDense: true,
        hint: hintText?.isNotEmpty ?? false
            ? Text(
                hintText!,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFA2A2A2),
                ),
              )
            : null,
        borderRadius: BorderRadius.circular(12),
        underline: const SizedBox.shrink(),
        icon: UnicosDrawable.dropDownIcon.svg(
          width: 20,
          fit: BoxFit.fitWidth,
        ),
        items: values
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: builder(e),
              ),
            )
            .toList(),
        onChanged: onChanged,
        value: value,
      ),
    );

    if (label?.isNotEmpty ?? false) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label!,
            style: const TextStyle(
              color: Color(0xFF464255),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 17),
          button,
        ],
      );
    }

    return button;
  }

  factory UnicosDropDown.withLabel({
    required String label,
    ValueChanged<T?>? onChanged,
    required Widget Function(T value) builder,
    required List<T> values,
    String? hintText,
    T? value,
  }) {
    return UnicosDropDown(
      label: label,
      onChanged: onChanged,
      builder: builder,
      values: values,
      value: value,
      hintText: hintText,
    );
  }
}
