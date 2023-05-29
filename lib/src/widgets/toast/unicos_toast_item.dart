import 'package:flutter/material.dart';

import '../unicos_card.dart';
import 'unicos_toast_view_model.dart';

class UnicosToastItem extends StatelessWidget {
  final UnicosToastViewModel viewModel;
  final EdgeInsets separator;

  const UnicosToastItem({
    super.key,
    required this.viewModel,
    this.separator = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: separator,
      child: UnicosCard(
        borderColor: const Color(0xFFD0D5DE),
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 17,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 11,
              height: 11,
              margin: const EdgeInsets.only(right: 19, top: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: viewModel.type.color,
              ),
            ),
            Expanded(
              child: Text(
                viewModel.message,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF464255),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
