import 'package:flutter/material.dart';

import '../apprivals/apprivals.dart';
import '../resources/resources.dart';

class UnicosBreadCrumb extends StatelessWidget {
  final List<String> breadCrumbs;

  const UnicosBreadCrumb({super.key, required this.breadCrumbs});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      width: double.infinity,
      decoration: BoxDecoration(border: Border.all(color: Color(0xFFE5E7EB))),
      child: ListView.separated(
        padding: EdgeInsets.only(left: 52),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 16),
            child: Text(
              breadCrumbs[index],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF464255),
              ),
            ),
          ),
        ),
        separatorBuilder: (_, _) =>
            Center(child: UnicosDrawable.arrowRightIcon.svg()),
        itemCount: breadCrumbs.length,
      ),
    );
  }
}
