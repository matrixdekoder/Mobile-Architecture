import 'package:flutter/material.dart';

class ArcTest extends StatelessWidget {
  final Size size;

  const ArcTest({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: Test(),
    );
  }
}

class Test extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var offset = Offset(size.width / 2, size.height / 2);
    var rect = Rect.fromCircle(center: offset, radius: size.width / 2);
    var gradient = RadialGradient(
      center: const Alignment(0.0, 0.0), // near the top right
      radius: 0.5,
      colors: [
        Colors.transparent, // yellow sun
        Colors.black87, // blue sky
      ],
      stops: [0.5, 1.0],
    );
    // rect is the area we are painting over
    var paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
