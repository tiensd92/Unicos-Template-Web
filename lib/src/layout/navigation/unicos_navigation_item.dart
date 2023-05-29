import 'package:flutter/material.dart';

class UnicosNavigationItem extends StatefulWidget {
  final Widget activeIcon;
  final Widget icon;
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const UnicosNavigationItem({
    super.key,
    required this.activeIcon,
    required this.icon,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  @override
  State<UnicosNavigationItem> createState() => _UnicosNavigationItemState();
}

class _UnicosNavigationItemState extends State<UnicosNavigationItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 900;

    final item = MouseRegion(
      onHover: (event) {
        if (isMobile) {
          return;
        }

        setState(() {
          _hovering = true;
        });
      },
      onExit: (event) {
        if (isMobile) {
          return;
        }

        setState(() {
          _hovering = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 37.5),
            widget.selected || _hovering ? widget.activeIcon : widget.icon,
            const SizedBox(width: 17),
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: widget.selected || _hovering
                    ? const Color(0xFF28C76F)
                    : const Color(0xFF464255),
              ),
            ),
          ],
        ),
      ),
    );

    if (widget.selected) {
      return CustomPaint(
        painter: _SelectedBackground(),
        child: item,
      );
    }

    if (_hovering) {
      return InkWell(
        onTap: widget.selected ? null : widget.onTap,
        child: CustomPaint(
          painter: _SelectedBackground(hover: _hovering),
          child: item,
        ),
      );
    }

    return InkWell(
      onTap: widget.selected ? null : widget.onTap,
      child: item,
    );
  }
}

class _SelectedBackground extends CustomPainter {
  final bool hover;

  _SelectedBackground({
    this.hover = false,
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
    paint0Fill.color = const Color(0xff28C76F).withOpacity(0.08);
    canvas.drawPath(path0, paint0Fill);

    if (!hover) {
      Path path1 = Path();
      path1.moveTo(0, 0);
      path1.cubicTo(
          size.width * 0.01725688,
          size.height * 0.008196721,
          size.width * 0.02964427,
          size.height * 0.05957393,
          size.width * 0.02964427,
          size.height * 0.1229508);
      path1.lineTo(size.width * 0.02964427, size.height * 0.8770492);
      path1.cubicTo(
          size.width * 0.02964427,
          size.height * 0.9404262,
          size.width * 0.01725688,
          size.height,
          size.width * 0.001976285,
          size.height);
      path1.lineTo(0, 0);
      path1.close();

      Paint paint1Fill = Paint()..style = PaintingStyle.fill;
      paint1Fill.color = const Color(0xff28C76F).withOpacity(1.0);
      canvas.drawPath(path1, paint1Fill);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
