import 'package:flutter/material.dart';

class UnicosCard extends StatelessWidget {
  final Widget child;
  final Color? borderColor;
  final EdgeInsets padding;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;

  const UnicosCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.borderColor,
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).cardTheme;

    return Card(
      color: color,
      elevation: 0,
      shape: borderColor != null
          ? (theme.shape as RoundedRectangleBorder).copyWith(
              side: BorderSide(color: borderColor!),
              borderRadius: borderRadius,
            )
          : theme.shape,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
