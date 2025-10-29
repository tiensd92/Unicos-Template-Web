import 'package:flutter/material.dart';

import '../resources/resources.dart';
import 'unicos_card.dart';

class UnicosText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final String? toolTipText;

  const UnicosText(
    this.text, {
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.maxLines,
    this.toolTipText,
  });

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );

    if (toolTipText?.isNotEmpty != true) {
      return textWidget;
    }

    return Tooltip(message: toolTipText, child: textWidget);
  }

  factory UnicosText.medium18(
    String text, {
    String? toolTipText,
    Color color = UnicosColor.darkBody,
    int? maxLines,
  }) {
    return UnicosText(
      text,
      fontSize: 18,
      toolTipText: toolTipText,
      color: color,
      fontWeight: FontWeight.w500,
      maxLines: maxLines,
    );
  }

  factory UnicosText.medium14(
    String text, {
    String? toolTipText,
    Color color = UnicosColor.darkBody,
    int? maxLines,
  }) {
    return UnicosText(
      text,
      fontSize: 14,
      toolTipText: toolTipText,
      color: color,
      fontWeight: FontWeight.w500,
      maxLines: maxLines,
    );
  }

  factory UnicosText.semibold18(
    String text, {
    Color color = UnicosColor.darkBody,
    int? maxLines,
    String? toolTipText,
  }) {
    return UnicosText(
      text,
      fontSize: 18,
      color: color,
      toolTipText: toolTipText,
      fontWeight: FontWeight.w600,
      maxLines: maxLines,
    );
  }

  factory UnicosText.regular14(
    String text, {
    Color color = UnicosColor.darkBody,
    int? maxLines,
    String? toolTipText,
  }) {
    return UnicosText(
      text,
      fontSize: 14,
      color: color,
      toolTipText: toolTipText,
      fontWeight: FontWeight.w400,
      maxLines: maxLines,
    );
  }

  factory UnicosText.regular40(
    String text, {
    Color color = UnicosColor.darkBody,
    int? maxLines,
    String? toolTipText,
  }) {
    return UnicosText(
      text,
      fontSize: 40,
      color: color,
      toolTipText: toolTipText,
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

  static Widget quocte(String text, {Widget? icon}) {
    final value = UnicosText.regular14(color: Color(0xFF111827), text);

    Widget child = icon == null
        ? value
        : Row(
            children: [
              Expanded(child: value),
              icon,
            ],
          );

    return UnicosCard(
      borderRadius: BorderRadius.circular(8),
      borderColor: Color(0xFFE5E7EB),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 13),
      color: Color(0xFFF9FAFB),
      child: child,
    );
  }

  static Widget label({required String label, String? value, Widget? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        UnicosText.medium18(label),
        UnicosText.quocte(value ?? '', icon: icon),
      ],
    );
  }
}
