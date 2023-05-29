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

  SvgPicture svg(
      {double? width,
      double? height,
      BoxFit fit = BoxFit.contain,
      Color? color}) {
    return SvgPicture.asset(
      this,
      width: width,
      height: height,
      fit: fit,
      color: color,
      package: 'unicos_template',
    );
  }
}
