import 'package:flutter/material.dart';

class UnicosTag extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback? onTap;
  final double fontSize;
  final EdgeInsets padding;

  const UnicosTag({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    this.onTap,
    this.fontSize = 18,
    this.padding = const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
  });

  @override
  Widget build(BuildContext context) {
    final child = Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(200),
      ),
      padding: padding,
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );

    if (onTap == null) {
      return child;
    }

    return GestureDetector(
      onTap: onTap,
      child: child,
    );
  }

  factory UnicosTag.red({
    Key? key,
    required String text,
    final VoidCallback? onTap,
  }) =>
      UnicosTag(
        key: key,
        text: text,
        color: Color(0xFFFF3F40),
        textColor: Color(0xFFFFFFFF),
        onTap: onTap,
      );

  factory UnicosTag.gray({
    Key? key,
    required String text,
    final VoidCallback? onTap,
  }) =>
      UnicosTag(
        key: key,
        text: text,
        color: Color(0xFFB9BBBD),
        textColor: Color(0xFFFFFFFF),
        onTap: onTap,
      );

  factory UnicosTag.green({
    Key? key,
    required String text,
    final VoidCallback? onTap,
  }) =>
      UnicosTag(
        key: key,
        text: text,
        color: Color(0xFF00A389),
        textColor: Color(0xFFFFFFFF),
        onTap: onTap,
      );

  factory UnicosTag.violet({
    Key? key,
    required String text,
    final VoidCallback? onTap,
  }) =>
      UnicosTag(
        key: key,
        text: text,
        color: Color(0xFFAB54DB),
        textColor: Color(0xFFFFFFFF),
        onTap: onTap,
      );

  factory UnicosTag.smallGreen({
    Key? key,
    required String text,
    final VoidCallback? onTap,
  }) =>
      UnicosTag(
        key: key,
        text: text,
        fontSize: 12,
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        color: Color(0xFF00A389),
        textColor: Color(0xFFFFFFFF),
        onTap: onTap,
      );
}
