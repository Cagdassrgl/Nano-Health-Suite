// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ColoredStar extends StatelessWidget {
  final double size;
  final double colorRatio;

  ColoredStar({required this.size, required this.colorRatio});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: ColoredStarPainter(
        colorRatio: colorRatio,
      ),
    );
  }
}

class ColoredStarPainter extends CustomPainter {
  final double colorRatio;

  ColoredStarPainter({required this.colorRatio});

  @override
  void paint(Canvas canvas, Size size) {
    final starPath = Path()
      ..moveTo(size.width * 0.5, 0)
      ..lineTo(size.width * 0.7, size.height * 0.35)
      ..lineTo(size.width, size.height * 0.4)
      ..lineTo(size.width * 0.75, size.height * 0.65)
      ..lineTo(size.width * 0.8, size.height)
      ..lineTo(size.width * 0.5, size.height * 0.8)
      ..lineTo(size.width * 0.2, size.height)
      ..lineTo(size.width * 0.25, size.height * 0.65)
      ..lineTo(0, size.height * 0.4)
      ..lineTo(size.width * 0.3, size.height * 0.35)
      ..close();

    final paint = Paint();

    // Sarı yarısını çiz
    paint.color = Colors.yellow;
    canvas.drawPath(starPath, paint);

    // Gri yarısını çiz
    paint.color = Colors.grey;
    canvas.clipRect(
        Rect.fromLTRB(size.width * colorRatio, 0, size.width, size.height));
    canvas.drawPath(starPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
