import 'package:flutter/material.dart';
import 'package:unicos_template/src/apprivals/apprivals.dart';

class UnicosLabelGradient extends StatelessWidget {
  final double dimension;
  final List<Color>? colors;
  final BoxShape shape;
  final String text;
  final double fontSize;

  const UnicosLabelGradient({
    super.key,
    this.dimension = 50,
    this.colors,
    this.shape = BoxShape.circle,
    required this.text,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: dimension,
      height: dimension,
      decoration: BoxDecoration(
        shape: shape,
        gradient: LinearGradient(
          colors: colors ?? text.gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFFFFFFFF),
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
