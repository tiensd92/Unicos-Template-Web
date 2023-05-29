part of 'nav_bar.dart';

class UnicosHoverNavBar extends StatelessWidget {
  const UnicosHoverNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navBarTheme = Theme.of(context).extension<UnicosNavBarTheme>()!;
    final hoverColor = navBarTheme.hoverColor;
    final hoverDarkColor = navBarTheme.hoverDarkColor;

    return CustomPaint(
      painter: _UnicosHoverNavBarPainter(
        color: hoverColor,
        darkColor: hoverDarkColor,
      ),
    );
  }
}

class _UnicosHoverNavBarPainter extends CustomPainter {
  final Color color;
  final Color darkColor;

  _UnicosHoverNavBarPainter({
    required this.color,
    required this.darkColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path path0 = Path();
    path0.moveTo(size.width, 0);
    path0.lineTo(0, 0);
    path0.lineTo(0, size.height);
    path0.lineTo(size.width, size.height);
    path0.lineTo(size.width, size.height * 0.75);
    path0.lineTo(size.width * 0.9, size.height * 0.5);
    path0.lineTo(size.width, size.height * 0.25);
    path0.lineTo(size.width, 0);
    path0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color;
    canvas.drawPath(path0, paint0Fill);

    Path path1 = Path();
    path1.moveTo(0, 0);
    path1.cubicTo(
        size.width * 0.01534123,
        0,
        size.width * 0.02777778,
        size.height * 0.05223350,
        size.width * 0.02777778,
        size.height * 0.1166667);
    path1.lineTo(size.width * 0.02777778, size.height * 0.8833333);
    path1.cubicTo(size.width * 0.02777778, size.height * 0.9477667,
        size.width * 0.01534123, size.height, 0, size.height);
    path1.lineTo(0, size.height);
    path1.lineTo(0, 0);
    path1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = darkColor;
    canvas.drawPath(path1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
