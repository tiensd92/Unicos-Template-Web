import 'package:flutter/material.dart';

class UnicosTableHeaderRow extends StatelessWidget {
  final String label;

  const UnicosTableHeaderRow({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Color(0xFF838383),
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
