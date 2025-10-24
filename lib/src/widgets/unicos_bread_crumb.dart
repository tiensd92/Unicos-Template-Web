import 'package:flutter/material.dart';

import '../apprivals/apprivals.dart';
import '../resources/resources.dart';

class UnicosBreadCrumb extends StatelessWidget {
  final List<String> breadCrumbs;

  const UnicosBreadCrumb({super.key, required this.breadCrumbs});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 16),
                    child: Text(
                      breadCrumbs[index],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
            separatorBuilder: ($1, $2) => Center(
                  child: UnicosDrawable.arrowRightIcon.svg(),
                ),
            itemCount: breadCrumbs.length),
      ),
    );
  }
}
