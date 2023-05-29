import 'package:flutter/material.dart';

import 'unicos_navigation_item.dart';

class UnicosNavigation extends StatelessWidget {
  final Widget logo;
  final List<UnicosNavigationItem> items;

  const UnicosNavigation({
    super.key,
    required this.logo,
    this.items = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 47),
              child: logo,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, index) => items[index],
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemCount: items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
