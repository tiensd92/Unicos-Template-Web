import 'package:flutter/material.dart';

class UnicosLabel extends StatelessWidget {
  final String lablel;
  final Widget? child;

  const UnicosLabel({
    super.key,
    required this.lablel,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final label = Text(
      lablel,
      style: const TextStyle(
        color: Color(0xFF464255),
        fontSize: 12,
      ),
    );

    if (child != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label,
          const SizedBox(height: 17),
          child!,
        ],
      );
    }

    return label;
  }
}
