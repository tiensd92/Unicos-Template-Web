import 'package:flutter/material.dart';

import '../apprivals/apprivals.dart';
import '../resources/resources.dart';

class UnicosCheckBox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool>? onChange;

  const UnicosCheckBox({super.key, this.isChecked = false, this.onChange});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange?.call(!isChecked);
      },
      child: isChecked
          ? UnicosDrawable.boxCheckedIcon.svg()
          : UnicosDrawable.boxUncheckIcon.svg(),
    );
  }
}
