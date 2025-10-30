import 'package:flutter/material.dart';

import '../resources/resources.dart';

class UnicosHeaderPage extends StatelessWidget {
  final UnicosHeaderPageViewModel viewModel;
  final bool hasNavigation;

  const UnicosHeaderPage({
    super.key,
    required this.viewModel,
    this.hasNavigation = false,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 900;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 37),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (hasNavigation && isMobile)
              ? SizedBox(
                  width: 67,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Icon(
                        Icons.menu,
                        size: 40,
                        color: Color(0xFF28C76F),
                      ),
                    ),
                  ),
                )
              : const SizedBox(width: 67),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.page,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: UnicosColor.darkBody,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(radius: 38, child: Placeholder()),
                    const SizedBox(width: 24),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.nameDisplay,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF28262D),
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          viewModel.position,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFFA2A2A2),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 67),
        ],
      ),
    );
  }
}

class UnicosHeaderPageViewModel {
  final String nameDisplay;
  final String position;
  final String avatar;
  final String page;

  UnicosHeaderPageViewModel({
    required this.nameDisplay,
    required this.position,
    required this.avatar,
    required this.page,
  });
}

mixin ListenerOpenNavigation {
  VoidCallback? onOpenNav;
}
