import 'dart:ui' as ui;
import 'dart:math';
import 'package:do_something_app/resources/app_colors.dart';
import 'package:flutter/material.dart';

class Arc extends StatelessWidget {
  final Size size;

  const Arc({Key key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: RectPainter(shadow: true, color: AppColors.white),
    );
  }
}

class RectPainter extends CustomPainter {
  final Color color;
  final bool shadow;

  RectPainter({this.shadow = false, this.color = AppColors.black});

  @override
  void paint(Canvas canvas, Size size) {
    if (shadow) {
      custom(canvas, size, true, Colors.black87.withOpacity(0.15));
      custom(canvas, size, false, color);
    } else {
      custom(canvas, size, false, color);
    }
  }

  custom(Canvas canvas, Size size, bool shadow, Color color) {
    final strokeShadow = 4.0;
    var gradient = RadialGradient(
      center: const Alignment(0.0, 0.0), // near the top right
      radius: 0.5,
      colors: [
        Colors.transparent, // yellow sun
        Colors.black, // blue sky
      ],
      stops: [0.5, 1.0],
    );

    final double strokeWidth = 60.0;

    canvas.save();
    final radius = size.height / 2 + strokeWidth / 2 - (shadow ? 2.0 : 0.0);
    final center = Offset(size.width / 2, (shadow ? -1.0 : 0.0));
    Rect rectArc = Rect.fromCircle(center: center, radius: radius);
    Paint paintArc;
    if (shadow) {
      paintArc = Paint()..shader = gradient.createShader(rectArc);
      canvas.clipRect(Rect.fromLTWH(size.width / 2 - size.height / 2,
          -strokeShadow, size.height, size.height + strokeShadow));
    } else {
      paintArc = Paint()
        ..color = color
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke;
      canvas.clipRect(Rect.fromLTWH(
          size.width / 2 - size.height / 2, 0.0, size.height, size.height));
    }

    canvas.drawArc(rectArc, 0.0, pi, false, paintArc);
    canvas.restore();

    final ui.Gradient reactGradient = ui.Gradient.linear(
        ui.Offset(size.width, 0.0),
        ui.Offset(size.width, strokeShadow),
        <ui.Color>[Colors.black26, Colors.black],
        [0.0, 1.0]);

    canvas.save();
    Rect rectL =
        Rect.fromLTWH(0.0, 0.0, size.width / 2 - size.height / 2, size.height);
    Paint paintL = Paint()..color = color;
    if (shadow) {
      paintL = paintL..shader = reactGradient;
      canvas.clipRect(Rect.fromLTWH(0.0, -strokeShadow,
          size.width / 2 - size.height / 2, size.height + strokeShadow));
      paintL = paintL
        ..strokeWidth = strokeShadow
        ..style = PaintingStyle.stroke;
    }
    canvas.drawRect(rectL, paintL);
    canvas.restore();

    canvas.save();
    Rect rectR = Rect.fromLTWH(size.width / 2 + size.height / 2, 0.0,
        size.width / 2 - size.height / 2, size.height);
    Paint paintR = Paint()..color = color;

    if (shadow) {
      canvas.clipRect(Rect.fromLTWH(
          size.width / 2 + size.height / 2,
          -strokeShadow,
          size.width / 2 - size.height / 2,
          size.height + strokeShadow));
      paintR = paintR
        ..shader = reactGradient
        ..strokeWidth = strokeShadow
        ..style = PaintingStyle.stroke;
    }
    canvas.drawRect(rectR, paintR);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
