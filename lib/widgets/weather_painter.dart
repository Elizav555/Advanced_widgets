import 'package:flutter/material.dart';

class WeatherPainter extends CustomPainter {
  final double state;

  WeatherPainter({
    required this.state,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2, centerY = size.height / 2;

    final backPainter = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final rect = Rect.fromCenter(
        center: Offset(centerX, centerY), width: 160, height: 120);

    canvas.drawOval(rect, backPainter);

    final sunPainter = Paint()
      ..color = Colors.yellowAccent.withOpacity(_getSunOpacity())
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(centerX, centerY), 30, sunPainter);

    final cloudPainter = Paint()
      ..color = Colors.black.withOpacity(_getCloudOpacity())
      ..style = PaintingStyle.fill;

    final borderPainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = Colors.grey;

    double x = centerX - 30, y = centerY + (state > 0.6 ? 20 : 40);
    const Radius radius = Radius.circular(1);

    final cloudPath = Path()
      ..moveTo(x, y)
      ..arcToPoint(Offset(x + 7, y - 37), radius: radius)
      ..arcToPoint(Offset(x + 40, y - 42), radius: radius)
      ..arcToPoint(Offset(x + 59, y - 26), radius: radius)
      ..arcToPoint(Offset(x + 59, y), radius: radius)
      ..close();

    if (state > 0.3) {
      canvas.drawPath(cloudPath, backPainter);
      canvas.drawPath(cloudPath, borderPainter);
    }
    canvas.drawPath(cloudPath, cloudPainter);

    final dropsPainter = Paint()
      ..color = Colors.blue.withOpacity(_getDropsOpacity())
      ..style = PaintingStyle.fill;

    canvas.drawLine(Offset(x + 5, y + 5), Offset(x - 5, y + 15), dropsPainter);
    canvas.drawLine(Offset(x + 15, y + 5), Offset(x + 5, y + 15), dropsPainter);
    canvas.drawLine(
        Offset(x + 25, y + 5), Offset(x + 15, y + 15), dropsPainter);
    canvas.drawLine(
        Offset(x + 35, y + 5), Offset(x + 25, y + 15), dropsPainter);
    canvas.drawLine(
        Offset(x + 45, y + 5), Offset(x + 35, y + 15), dropsPainter);
    canvas.drawLine(
        Offset(x + 55, y + 5), Offset(x + 45, y + 15), dropsPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  double _getSunOpacity() {
    return state > 0.6 ? 0 : 1;
  }

  double _getCloudOpacity() {
    if (state < 0.4) {
      return 0;
    }

    return 10 / 6 * state - 4 / 6;
  }

  double _getDropsOpacity() {
    if (state < 0.7) {
      return 0;
    }
    return 10 / 3 * state - 7 / 3;
  }
}
