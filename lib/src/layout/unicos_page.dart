import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'reponsive_layout.dart';

class UnicosPage extends StatelessWidget {
  final Widget body;
  final Widget? header;
  final Widget? navigation;
  final String titlePage;
  final UnicosBreadCrumb? breadCrumb;
  final EdgeInsets padding;

  const UnicosPage({
    super.key,
    required this.body,
    this.header,
    this.navigation,
    required this.titlePage,
    this.breadCrumb,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double scale = size.width >= 600 ? 1 : size.width / 600;
    final isMobile = size.width <= 900;
    final isMedium = size.width > 900 && size.width <= 1200;
    final double height = size.height / scale;

    return Title(
      title: titlePage,
      color: const Color(0xFF28C76F),
      child: Scaffold(
        drawer: navigation == null
            ? null
            : (isMobile || isMedium
                  ? ReponsiveLayout(
                      fixedWidth: 348,
                      backgroundColor: const Color(0xFFFFFFFF),
                      child: navigation!,
                    )
                  : null),
        body: ReponsiveLayout(
          child: Row(
            children: [
              navigation == null || isMobile || isMedium
                  ? const SizedBox.shrink()
                  : SizedBox(width: 348, height: height, child: navigation),
              Expanded(
                child: Column(
                  children: [
                    ?header,
                    ?breadCrumb,
                    Flexible(
                      child: SingleChildScrollView(
                        child: Padding(padding: padding, child: body),
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
