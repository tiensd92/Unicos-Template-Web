import 'package:flutter/material.dart';

import '../apprivals/apprivals.dart';
import '../resources/resources.dart';

class UnicosCheckBox extends StatelessWidget {
  final bool isChecked;
  final String? text;
  final ValueChanged<bool>? onChange;

  const UnicosCheckBox({
    super.key,
    this.isChecked = false,
    this.onChange,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    final checkBox = isChecked
        ? UnicosDrawable.boxCheckedIcon.svg(height: 20)
        : UnicosDrawable.boxUncheckIcon.svg(height: 20);

    return GestureDetector(
      onTap: () {
        onChange?.call(!isChecked);
      },
      child: text?.isNotEmpty == true
          ? Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                checkBox,
                Text(
                  text!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: UnicosColor.darkBody,
                  ),
                ),
              ],
            )
          :  checkBox,
    );
  }
}
