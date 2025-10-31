import 'package:flutter/material.dart';
import 'package:unicos_template/unicos_template.dart';

class UnicosButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color color;
  final Color disableColor;
  final double? height;
  final double? width;
  final EdgeInsets padding;

  const UnicosButton({
    super.key,
    this.color = const Color(0xFF00A389),
    this.disableColor = const Color(0xFFB9BBBD),
    required this.child,
    this.onPressed,
    this.height,
    this.width,
    this.padding = const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: color,
          disabledBackgroundColor: disableColor,
          disabledForegroundColor: disableColor,
          surfaceTintColor: color,
          elevation: 0,
          padding: padding,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: child,
      ),
    );
  }

  factory UnicosButton.labelIcon({
    required String label,
    double? width,
    TextStyle style = const TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    required Widget icon,
    VoidCallback? onPressed,
    Color color = const Color(0xFF00A389),
    Color disableColor = const Color(0xFFB9BBBD),
    double? height,
    EdgeInsets padding = const EdgeInsets.all(20),
  }) {
    return UnicosButton(
      onPressed: onPressed,
      color: color,
      width: width,
      disableColor: disableColor,
      height: height,
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 10),
          Text(label, style: style),
        ],
      ),
    );
  }

  factory UnicosButton.label({
    required String label,
    TextStyle style = const TextStyle(
      fontSize: 18,
      color: Color(0xFFFFFFFF),
      fontWeight: FontWeight.w500,
    ),
    VoidCallback? onPressed,
    Color color = const Color(0xFF00A389),
    Color disableColor = const Color(0xFFB9BBBD),
    double? width,
    EdgeInsets padding = const EdgeInsets.symmetric(vertical: 20),
  }) {
    return UnicosButton(
      onPressed: onPressed,
      color: color,
      disableColor: disableColor,
      width: width,
      padding: padding,
      child: Text(label, style: style),
    );
  }

  factory UnicosButton.labelIconSmall({
    required String label,
    double? width,
    TextStyle style = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    required Widget icon,
    VoidCallback? onPressed,
    Color color = const Color(0xFF00A389),
    Color disableColor = const Color(0xFFB9BBBD),
    double? height,
    EdgeInsets padding = const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 16,
    ),
  }) {
    return UnicosButton.labelIcon(
      padding: padding,
      width: width,
      color: color,
      disableColor: disableColor,
      height: height,
      icon: icon,
      label: label,
      onPressed: onPressed,
      style: style,
    );
  }

  factory UnicosButton.back(String label, {VoidCallback? onPressed}) {
    return UnicosButton(
      color: UnicosColor.darkGrey7,
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        spacing: 14,
        mainAxisSize: MainAxisSize.min,
        children: [
          UnicosDrawable.backIcon.svg(),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: UnicosColor.darkBody,
            ),
          ),
        ],
      ),
    );
  }
}
