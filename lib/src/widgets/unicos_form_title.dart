import 'package:flutter/material.dart';
import 'package:unicos_template/unicos_template.dart';

class UnicosFormTitle extends StatelessWidget {
  final String title;
  final String? description;
  final Widget? action;

  const UnicosFormTitle({
    super.key,
    required this.title,
    this.description,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF464255),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (description?.isNotEmpty ?? false)
                  Text(
                    description!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFA3A3A3),
                    ),
                  ),
              ],
            ),
          ),
          action ?? const SizedBox.shrink(),
        ],
      ),
    );
  }

  factory UnicosFormTitle.withClose({
    required String title,
    String? description,
    VoidCallback? onClose,
  }) {
    return UnicosFormTitle(
      title: title,
      description: description,
      action: InkWell(
        onTap: onClose,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFD0D5DE),
            borderRadius: BorderRadius.circular(13),
          ),
          child: UnicosDrawable.closeIcon.svg(
            width: 21,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
