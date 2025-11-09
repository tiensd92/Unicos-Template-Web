import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../resources/resources.dart';

class UnicosText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final String? toolTipText;
  final bool isLink;

  const UnicosText(
    this.text, {
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.maxLines,
    this.toolTipText,
    this.isLink = false,
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

    if (isLink && toolTipText?.isNotEmpty == true) {
      return Link(uri: Uri.parse(toolTipText!), builder: (_, _) => textWidget);
    }

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
    bool isLink = false,
  }) {
    return UnicosText(
      text,
      fontSize: 18,
      isLink: isLink,
      toolTipText: toolTipText,
      color: color,
      fontWeight: FontWeight.w500,
      maxLines: maxLines,
    );
  }

  factory UnicosText.medium24(
    String text, {
    String? toolTipText,
    Color color = UnicosColor.darkBody,
    int? maxLines,
    bool isLink = false,
  }) {
    return UnicosText(
      text,
      fontSize: 24,
      isLink: isLink,
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
    bool isLink = false,
  }) {
    return UnicosText(
      text,
      fontSize: 14,
      isLink: isLink,
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
    bool isLink = false,
  }) {
    return UnicosText(
      text,
      fontSize: 18,
      color: color,
      isLink: isLink,
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
    bool isLink = false,
  }) {
    return UnicosText(
      text,
      fontSize: 14,
      color: color,
      isLink: isLink,
      toolTipText: toolTipText,
      fontWeight: FontWeight.w400,
      maxLines: maxLines,
    );
  }

  factory UnicosText.regular12(
    String text, {
    Color color = UnicosColor.darkBody,
    int? maxLines,
    String? toolTipText,
    bool isLink = false,
  }) {
    return UnicosText(
      text,
      fontSize: 12,
      color: color,
      isLink: isLink,
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
    bool isLink = false,
  }) {
    return UnicosText(
      text,
      isLink: isLink,
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
}
