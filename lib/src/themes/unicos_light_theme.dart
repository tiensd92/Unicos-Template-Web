import 'package:flutter/material.dart';

import 'unicos_card_theme.dart';
import 'unicos_nav_bar_theme.dart';
import 'unicos_tex_filed_theme.dart';

class UnicosLightTheme {
  static final theme = ThemeData(
    primarySwatch: const MaterialColor(
      0xFF28C76F,
      {
        900: Color(0xFF00691E),
        800: Color(0xFF008933),
        700: Color(0xFF009a3F),
        600: Color(0xFF00Ad4B),
        500: Color(0xFF00BC55),
        400: Color(0xFF28C770),
        300: Color(0xFF5FD28A),
        200: Color(0xFF92DEAC),
        100: Color(0xFFBEEBCC),
        50: Color(0xFFE4F7EA),
      },
    ),
    fontFamily: 'PopPins',
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF6F6F6),
    cardTheme: UnicosCardTheme(),
    extensions: [
      UnicosNavBarTheme(),
      UnicosTextFiledTheme(),
    ],
  );
}
