import 'package:flutter/material.dart';

import 'unicos_card.dart';

class UnicosText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;

  const UnicosText(
    this.text, {
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  factory UnicosText.title(String text) {
    return UnicosText(
      text,
      fontSize: 18,
      color: const Color(0xFF464255),
      fontWeight: FontWeight.w500,
      maxLines: 2,
    );
  }

  factory UnicosText.medium(String text) {
    return UnicosText(
      text,
      fontSize: 14,
      color: const Color(0xFF464255),
      fontWeight: FontWeight.w500,
    );
  }

  factory UnicosText.semibold(
    String text, {
    double fontSize = 18,
    Color color = const Color(0xFF464255),
    int? maxLines,
  }) {
    return UnicosText(
      text,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w600,
      maxLines: maxLines,
    );
  }

  factory UnicosText.regular(
    String text, {
    double fontSize = 14,
    Color color = const Color(0xFFA2A2A2),
    int? maxLines,
  }) {
    return UnicosText(
      text,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w400,
      maxLines: maxLines,
    );
  }

  static Widget hight(String text, {String? hightText}) {
    return Tooltip(
      message: hightText,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: Color(0xFFE3E7EF),
          borderRadius: BorderRadius.circular(4),
        ),
        child: UnicosText(
          text,
          fontSize: 14,
          color: const Color(0xFF464255),
          fontWeight: FontWeight.w500,
          maxLines: 1,
        ),
      ),
    );
  }

  static Widget quocte(String text) {
    return UnicosCard(
      borderColor: Color(0xFFE5E7EB),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 13),
      color: Color(0xFFFFFFFF),
      child: UnicosText.regular(fontSize: 18, color: Color(0xFF111827), text),
    );
  }

  static Widget label({required String label, String? value}) {
    return Row(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [UnicosText.title(label), UnicosText.quocte(value ?? '')],
    );
  }
}
