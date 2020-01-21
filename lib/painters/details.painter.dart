import 'package:flutter/rendering.dart';

class DetailsPainter extends CustomPainter {
  final Color colorFondo;
  final double wave;
  DetailsPainter({this.colorFondo, this.wave});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    // TODO: Set properties to paint

    paint.color = colorFondo.withOpacity(0.85);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * (0.25),
      size.height * (0.250 + wave),
      size.width * 0.5,
      size.height * .250,
    );
    path.quadraticBezierTo(
      size.width * (0.75),
      size.height * (0.250 - wave),
      size.width,
      size.height * 0.25,
    );
    path.lineTo(
      size.width,
      0,
    );
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);

    paint.color = colorFondo.withOpacity(0.65);
    paint.style = PaintingStyle.fill;

    var path2 = Path();

    path2.moveTo(0, size.height * 0.25);
    path2.quadraticBezierTo(
      size.width * (0.25),
      size.height * (0.250 + wave),
      size.width * 0.5,
      size.height * 0.250,
    );
    path2.quadraticBezierTo(
      size.width * (0.75),
      size.height * (0.25 - wave),
      size.width,
      size.height * 0.25,
    );
    path2.lineTo(
      size.width,
      size.height,
    );
    path2.lineTo(0, size.height);

    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(DetailsPainter oldDelegate) {
    return true;
  }
}
