import 'package:flutter/material.dart';

import 'reponsive_layout.dart';

class UnicosPage extends StatelessWidget {
  final Widget body;
  final Widget? header;
  final Widget? navigation;
  final String titlePage;

  const UnicosPage({
    super.key,
    required this.body,
    this.header,
    this.navigation,
    required this.titlePage,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double scale = size.width >= 600 ? 1 : size.width / 600;
    final isMobile = size.width <= 900;
    final double height = size.height / scale;

    return Title(
      title: titlePage,
      color: const Color(0xFF28C76F),
      child: Scaffold(
        drawer: navigation == null
            ? null
            : (isMobile
                ? ReponsiveLayout(
                    fixedWidth: 348,
                    backgroundColor: const Color(0xFFFFFFFF),
                    child: navigation!,
                  )
                : null),
        body: ReponsiveLayout(
          child: Row(
            children: [
              navigation == null || isMobile
                  ? const SizedBox.shrink()
                  : SizedBox(
                      width: 348,
                      height: height,
                      child: navigation,
                    ),
              Expanded(
                child: Column(
                  children: [
                    header ?? const SizedBox.shrink(),
                    Expanded(
                      child: Flexible(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 67),
                            child: body,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
