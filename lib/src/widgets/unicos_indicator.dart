import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class UnicosIndicator extends StatelessWidget {
  static bool isShowing = false;
  final double dimession;

  const UnicosIndicator({super.key, this.dimession = 80});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: dimession,
        height: dimession,
        child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [
            Color(0xFF28C76F),
            Color(0xFFAB54DB),
            Color(0xFFFF3F40),
            Color(0xFF4A52FF),
          ],
          strokeWidth: 2,
          backgroundColor: Colors.transparent,
          pathBackgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  static Future<void> show(BuildContext context) {
    isShowing = true;
    return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (ctx) => const Dialog(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        child: UnicosIndicator(),
      ),
    );
  }

  static void hide(BuildContext context) {
    if (isShowing) {
      Navigator.of(context).pop();
    }
  }
}
