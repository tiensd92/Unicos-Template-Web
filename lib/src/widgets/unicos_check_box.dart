import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          ? SvgPicture.asset(UnicosDrawable.boxCheckedIcon)
          : SvgPicture.asset(UnicosDrawable.boxUncheckIcon),
    );
  }
}
