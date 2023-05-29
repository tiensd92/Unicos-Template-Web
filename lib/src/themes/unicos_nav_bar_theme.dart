import 'package:flutter/material.dart';

class UnicosNavBarTheme extends ThemeExtension<UnicosNavBarTheme> {
  final TextStyle textStyle;
  final TextStyle activeTextStyle;
  final Color hoverColor;
  final Color hoverDarkColor;

  UnicosNavBarTheme({
    this.textStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xFF464255),
    ),
    this.activeTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xFF28C76F),
    ),
    this.hoverColor = const Color(0x1428C76F),
    this.hoverDarkColor = const Color(0xFF28C76F),
  });

  @override
  ThemeExtension<UnicosNavBarTheme> copyWith({
    TextStyle? textStyle,
    TextStyle? activeTextStyle,
    Color? hoverColor,
    Color? hoverDarkColor,
  }) {
    return UnicosNavBarTheme(
      textStyle: textStyle ?? this.textStyle,
      activeTextStyle: activeTextStyle ?? this.activeTextStyle,
      hoverColor: hoverColor ?? this.hoverColor,
      hoverDarkColor: hoverDarkColor ?? this.hoverDarkColor,
    );
  }

  @override
  ThemeExtension<UnicosNavBarTheme> lerp(
      ThemeExtension<UnicosNavBarTheme>? other, double t) {
    if (other is! UnicosNavBarTheme) {
      return this;
    }

    return UnicosNavBarTheme(
      textStyle: textStyle.copyWith(
        color: Color.lerp(textStyle.color, other.textStyle.color, t),
      ),
      activeTextStyle: textStyle.copyWith(
        color:
            Color.lerp(activeTextStyle.color, other.activeTextStyle.color, t),
      ),
      hoverColor: Color.lerp(hoverColor, other.hoverColor, t) ?? hoverColor,
      hoverDarkColor:
          Color.lerp(hoverDarkColor, other.hoverDarkColor, t) ?? hoverDarkColor,
    );
  }
}
