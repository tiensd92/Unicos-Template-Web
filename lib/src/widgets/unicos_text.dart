import 'package:flutter/material.dart';

class UnicosText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  const UnicosText(
    this.text, {
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  factory UnicosText.medium(String text,
      {double fontSize = 18, Color color = const Color(0xFF464255)}) {
    return UnicosText(
      text,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }
}
