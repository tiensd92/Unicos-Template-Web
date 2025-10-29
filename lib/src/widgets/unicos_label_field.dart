import 'package:flutter/material.dart';
import 'package:unicos_template/src/apprivals/apprivals.dart';

import '../resources/resources.dart';
import '../themes/themes.dart';
import 'unicos_text.dart';

class UnicosLabelField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final String? value;
  final Color backgroundColor;

  const UnicosLabelField(
    this.label, {
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.value,
    this.backgroundColor = UnicosColor.dartGrey1,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<UnicosTextFiledTheme>();

    return Column(
      spacing: 15,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: UnicosColor.darkBody, fontSize: 12),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              if (prefixIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: prefixIcon,
                ),
              Expanded(
                child: value?.isNotEmpty == true
                    ? UnicosText.medium14(value ?? '', maxLines: 1)
                    : Text(value ?? '', style: theme?.hintStyle),
              ),
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
      value: value,
      suffixIcon: UnicosDrawable.lockIcon.svg(),
    );
  }
}
