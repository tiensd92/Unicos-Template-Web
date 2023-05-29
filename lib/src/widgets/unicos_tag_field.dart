import 'package:flutter/material.dart';
import 'package:unicos_template/src/widgets/widgets.dart';

class UnicosTagField<T> extends StatelessWidget {
  final List<T> tags;
  final TextEditingController? controller;
  final String? hintText;
  final String? label;
  final FocusNode? focusNode;

  const UnicosTagField({
    Key? key,
    required this.tags,
    this.hintText,
    this.label,
    this.focusNode,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnicosTextField(
      controller: controller,
      hintText: hintText,
      label: label,
      focusNode: focusNode,
    );
  }
}
