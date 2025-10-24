import 'package:flutter/material.dart';

class UnicosCard extends StatelessWidget {
  final Widget child;
  final Color? borderColor;
  final EdgeInsets padding;
  final bool hasScroll;
  final Color color;

  const UnicosCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.borderColor,
    this.hasScroll = false,
    this.color = const Color(0xFFFFFFFF),
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
            )
          : theme.shape,
      child: Padding(
        padding: padding,
        child: hasScroll ? SingleChildScrollView(child: child) : child,
      ),
    );
  }
}
