import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'unicos_indicator.dart';

class UnicosImage extends StatelessWidget {
  final String imageUrl;

  const UnicosImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: 1039,
      height: 28800,
      fit: BoxFit.cover,
      errorWidget: (_, _, _) => Placeholder(),
      placeholder: (_, _) => Center(child: UnicosIndicator(dimession: 30)),
    );
  }
}
