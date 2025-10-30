import 'package:flutter/material.dart';

import '../resources/resources.dart';
import '../widgets/widgets.dart';
import 'reponsive_layout.dart';

class UnicosPage extends StatelessWidget {
  final Widget body;
  final Widget? header;
  final Widget? navigation;
  final String titlePage;
  final String? titleSubPage;
  final String? backButton;
  final EdgeInsets padding;
  final VoidCallback? onBack;

  const UnicosPage({
    super.key,
    required this.body,
    this.header,
    this.navigation,
    required this.titlePage,
    this.titleSubPage,
    this.backButton,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
    this.onBack,
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
                      backgroundColor: UnicosColor.white,
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
                    if (titleSubPage?.isNotEmpty == true)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 67),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                titleSubPage!,
                                maxLines: 1,
                                style: TextStyle(
                                  color: UnicosColor.darkBody,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              child: backButton?.isNotEmpty == true
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: UnicosButton.back(
                                        backButton!,
                                        onPressed: onBack,
                                      ),
                                    )
                                  : SizedBox.shrink(),
                            ),
                          ],
                        ),
                      ),
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
