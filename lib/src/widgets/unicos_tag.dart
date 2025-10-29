import 'package:flutter/material.dart';

import '../resources/resources.dart';

class UnicosTag extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double fontSize;
  final EdgeInsets padding;

  const UnicosTag({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    this.fontSize = 18,
    this.padding = const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
  }

  factory UnicosTag.small({
    Key? key,
    required Color color,
    required String text,
  }) => UnicosTag(
    key: key,
    text: text,
    fontSize: 12,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
    color: color.withValues(alpha: 0.15),
    textColor: color,
  );

  factory UnicosTag.smallTetirary(String text, {Key? key}) =>
      UnicosTag.small(key: key, text: text, color: UnicosColor.tetirary);

  factory UnicosTag.smalGrey(String text, {Key? key}) =>
      UnicosTag.small(key: key, text: text, color: UnicosColor.darkGrey4);

  factory UnicosTag.smallSuccess(String text, {Key? key}) =>
      UnicosTag.small(key: key, text: text, color: UnicosColor.success);

  factory UnicosTag.smallQuatinery(String text, {Key? key}) =>
      UnicosTag.small(key: key, text: text, color: UnicosColor.quatinery);
}
