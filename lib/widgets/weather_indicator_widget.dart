import 'package:advanced_widgets/widgets/weather_painter.dart';
import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({Key? key, required this.weatherState}) : super(key: key);
  final double weatherState;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WeatherPainter(state: weatherState),
    );
  }
}
