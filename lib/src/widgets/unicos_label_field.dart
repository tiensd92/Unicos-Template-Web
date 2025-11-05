import 'package:flutter/material.dart';
import 'package:unicos_template/src/apprivals/apprivals.dart';

import '../resources/resources.dart';
import 'unicos_text.dart';

class UnicosLabelField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final Widget value;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsets padding;
  final Widget? trailing;

  const UnicosLabelField(
    this.label, {
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.value,
    this.backgroundColor = UnicosColor.darkGrey1,
    this.borderColor = UnicosColor.darkGrey1,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        trailing == null
            ? Text(
                label,
                style: const TextStyle(
                  color: UnicosColor.darkBody,
                  fontSize: 12,
                ),
              )
            : Row(
                spacing: 6,
                children: [
                  Expanded(
                    child: Text(
                      label,
                      style: const TextStyle(
                        color: UnicosColor.darkBody,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  trailing!,
                ],
              ),
        Container(
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: borderColor == null
                ? null
                : Border.all(color: borderColor!),
          ),
          child: Row(
            children: [
              if (prefixIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: prefixIcon,
                ),
              Expanded(child: value),
              if (suffixIcon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: suffixIcon,
                ),
            ],
          ),
        ),
      ],
    );
  }

  factory UnicosLabelField.lock(
    String label, {
    Key? key,
    required String value,
  }) {
    return UnicosLabelField(
      label,
      key: key,
      value: UnicosText.medium14(value),
      suffixIcon: UnicosDrawable.lockIcon.svg(),
    );
  }

  factory UnicosLabelField.input(
    String label, {
    Key? key,
    required Widget value,
    Widget? trailing,
  }) {
    return UnicosLabelField(
      label,
      key: key,
      value: value,
      backgroundColor: null,
      borderColor: null,
      padding: EdgeInsets.zero,
      trailing: trailing,
    );
  }
}
