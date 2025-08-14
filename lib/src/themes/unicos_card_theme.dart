import 'package:flutter/material.dart';

class UnicosCardTheme extends CardThemeData {
  @override
  double? get elevation => 0;

  @override
  EdgeInsetsGeometry? get margin => EdgeInsets.zero;

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      );

  @override
  Color? get color => Color(0xFFFFFFFF);
}
