import 'package:flutter/material.dart';
import 'package:unicos_template/src/apprivals/apprivals.dart';

import '../resources/resources.dart';

class UnicosTag extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double fontSize;
  final EdgeInsets padding;
  final Widget? trailing;

  const UnicosTag({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    this.fontSize = 18,
    this.trailing,
    this.padding = const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
  });

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(200),
      ),
      padding: padding,
      child: trailing == null
          ? textWidget
          : Row(
              spacing: 6,
              mainAxisSize: MainAxisSize.min,
              children: [textWidget, trailing!],
            ),
    );
  }

  factory UnicosTag.small({
    Key? key,
    required Color color,
    required String text,
    Widget? trailing,
  }) => UnicosTag(
    key: key,
    text: text,
    fontSize: 12,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
    color: color.withValues(alpha: 0.15),
    textColor: color,
    trailing: trailing,
  );

  factory UnicosTag.smallTetirary(String text, {Key? key}) =>
      UnicosTag.small(key: key, text: text, color: UnicosColor.tetirary);

  factory UnicosTag.smalGrey(String text, {Key? key}) =>
      UnicosTag.small(key: key, text: text, color: UnicosColor.darkGrey4);

  factory UnicosTag.smallSuccess(String text, {Key? key}) =>
      UnicosTag.small(key: key, text: text, color: UnicosColor.success);

  factory UnicosTag.smallQuatinery(String text, {Key? key}) =>
      UnicosTag.small(key: key, text: text, color: UnicosColor.quatinery);

  factory UnicosTag.smallEditable(
    String text, {
    Key? key,
    VoidCallback? onPressed,
  }) => UnicosTag.small(
    key: key,
    text: text,
    color: UnicosColor.success,
    trailing: IconButton(
      iconSize: 12,
      onPressed: onPressed,
      constraints: BoxConstraints(),
      padding: EdgeInsets.zero,
      icon: UnicosDrawable.closeIcon.svg(
        height: 12,
        color: UnicosColor.darkGrey4,
      ),
    ),
  );
}
