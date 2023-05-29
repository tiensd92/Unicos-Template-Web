import 'package:flutter/material.dart';

class UnicosCard extends StatelessWidget {
  final Widget child;
  final Color? borderColor;
  final EdgeInsets padding;

  const UnicosCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(34),
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).cardTheme;

    return Card(
      shape: borderColor != null
          ? (theme.shape as RoundedRectangleBorder).copyWith(
              side: BorderSide(
                color: borderColor!,
              ),
            )
          : theme.shape,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
