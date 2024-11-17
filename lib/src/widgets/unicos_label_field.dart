import 'package:flutter/material.dart';

import '../themes/themes.dart';

class UnicosLabelField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final String? label;
  final String? value;

  const UnicosLabelField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.label,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<UnicosTextFiledTheme>();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 39,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: label?.isNotEmpty ?? false,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                label ?? '',
                style: const TextStyle(
                  color: Color(0xFFA2A2A2),
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Row(
            children: [
              if (prefixIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: prefixIcon,
                ),
              if (value != null)
                value?.isNotEmpty == true
                    ? Text(
                        value ?? '',
                        style: theme?.style,
                      )
                    : Text(
                        value ?? '',
                        style: theme?.hintStyle,
                      )
            ],
          )
        ],
      ),
    );
  }
}
