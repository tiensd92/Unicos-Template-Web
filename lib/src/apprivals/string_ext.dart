import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension UnicosStringExt on String {
  Image img({double? width, double? height, BoxFit? fit, Color? color}) {
    return Image.asset(
      this,
      width: width,
      height: height,
      fit: fit,
      color: color,
      package: 'unicos_template',
    );
  }

  SvgPicture svg({
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Color? color,
  }) {
    return SvgPicture.asset(
      this,
      width: width,
      height: height,
      fit: fit,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color, BlendMode.srcIn),
      package: 'unicos_template',
    );
  }

  List<Color> get gradientColors {
    // Use a default gradient for empty or null strings to avoid errors
    if (isEmpty) {
      return [const Color(0xFF00A389), const Color(0xFF4EF2D8)];
    }

    // --- Step 1: Generate Base Color from Hash ---
    // Dart's hashCode is an int. We mask it to 24 bits (RRGGBB) and add
    // 0xFF to the alpha channel to make it fully opaque (AARRGGBB).
    final baseInt = 0xFF000000 | (hashCode & 0x00FFFFFF);
    final baseColor = Color(baseInt);

    // --- Step 2: Helper for Channel Adjustment ---
    /// Ensures a color channel value (0-255) remains within bounds after adjustment.
    int adjustChannel(int channel, int offset) {
      return max(0, min(255, channel + offset));
    }

    // Define how much to shift the channels to create the dark and light variants
    const darkOffset = -45; // Subtracted to make the color darker
    const lightOffset = 55; // Added to make the color lighter

    // --- Step 3: Create the Dark Color ---
    final darkColor = Color.fromARGB(
      255,
      adjustChannel((baseColor.r * 255).round() & 0xFF, darkOffset),
      adjustChannel((baseColor.g * 255).round() & 0xFF, darkOffset),
      adjustChannel((baseColor.b * 255).round() & 0xFF, darkOffset),
    );

    // --- Step 4: Create the Light Color ---
    final lightColor = Color.fromARGB(
      255,
      adjustChannel((baseColor.r * 255).round() & 0xFF, lightOffset),
      adjustChannel((baseColor.g * 255).round() & 0xFF, lightOffset),
      adjustChannel((baseColor.b * 255).round() & 0xFF, lightOffset),
    );

    // Return the gradient list, starting with the darker color
    return [darkColor, lightColor];
  }
}
