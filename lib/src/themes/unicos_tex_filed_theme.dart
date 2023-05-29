import 'package:flutter/material.dart';

class UnicosTextFiledTheme extends ThemeExtension<UnicosTextFiledTheme> {
  final TextStyle hintStyle;
  final TextStyle style;
  final Color borderColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color focusedErrorBorderColor;
  final Color errorBorderColor;

  UnicosTextFiledTheme({
    this.style = const TextStyle(
      fontSize: 16,
      color: Color(0xFF464255),
    ),
    this.hintStyle = const TextStyle(
      fontSize: 16,
      color: Color(0xFFA3A3A3),
    ),
    this.borderColor = const Color(0xFFECECEC),
    this.enabledBorderColor = const Color(0xFFECECEC),
    this.focusedBorderColor = const Color(0xFF00A389),
    this.focusedErrorBorderColor = const Color(0xFFFF5B5B),
    this.errorBorderColor = const Color(0xFFFF5B5B),
  });

  @override
  ThemeExtension<UnicosTextFiledTheme> copyWith({
    TextStyle? hintStyle,
    TextStyle? style,
    Color? borderColor,
    Color? enabledBorderColor,
    Color? focusedBorderColor,
    Color? focusedErrorBorderColor,
    Color? errorBorderColor,
  }) {
    return UnicosTextFiledTheme(
      style: style ?? this.style,
      hintStyle: hintStyle ?? this.hintStyle,
      borderColor: borderColor ?? this.borderColor,
      enabledBorderColor: enabledBorderColor ?? this.enabledBorderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      focusedErrorBorderColor:
          focusedErrorBorderColor ?? this.focusedErrorBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
    );
  }

  @override
  ThemeExtension<UnicosTextFiledTheme> lerp(
      covariant ThemeExtension<UnicosTextFiledTheme>? other, double t) {
    if (other is! UnicosTextFiledTheme) {
      return this;
    }

    return UnicosTextFiledTheme(
      style: style.copyWith(
        color: Color.lerp(style.color, other.style.color, t),
      ),
      hintStyle: hintStyle.copyWith(
        color: Color.lerp(hintStyle.color, other.hintStyle.color, t),
      ),
      borderColor: Color.lerp(borderColor, other.borderColor, t) ?? borderColor,
      enabledBorderColor:
          Color.lerp(enabledBorderColor, other.enabledBorderColor, t) ??
              enabledBorderColor,
      focusedBorderColor:
          Color.lerp(focusedBorderColor, other.focusedBorderColor, t) ??
              focusedBorderColor,
      focusedErrorBorderColor: Color.lerp(
              focusedErrorBorderColor, other.focusedErrorBorderColor, t) ??
          focusedErrorBorderColor,
      errorBorderColor:
          Color.lerp(errorBorderColor, other.errorBorderColor, t) ??
              errorBorderColor,
    );
  }
}
