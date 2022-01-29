// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RadialPainter extends CustomPainter {
  final double progress;
  RadialPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Color(0xFF200087)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);

    double relativeProgress = 360 * progress;

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: size.width / 2,
      ),
      math.radians(-90),
      math.radians(-relativeProgress),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
