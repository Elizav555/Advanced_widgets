import 'package:advanced_widgets/widgets/weather_painter.dart';
import 'package:flutter/material.dart';

import '../utils/text_decorator.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget(
      {Key? key, required this.weatherState, required this.weatherDesc})
      : super(key: key);
  final double weatherState;
  final String weatherDesc;

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: selected ? 1 : 0.5,
      origin: selected ? const Offset(0.0, 180.0) : const Offset(180.0, -180.0),
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: selected
                ? Column(
                    children: [
                      CustomPaint(
                        painter: WeatherPainter(state: widget.weatherState),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 80.0)),
                      InnerShadow(
                        shadows: [
                          Shadow(
                              color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.color ??
                                  Theme.of(context).primaryColor,
                              offset: const Offset(0.3, 0.6),
                              blurRadius: 0.5)
                        ],
                        child: Text(widget.weatherDesc,
                            style: const TextStyle(
                              fontSize: 32,
                            )),
                      )
                    ],
                  )
                : CustomPaint(
                    painter: WeatherPainter(state: widget.weatherState),
                  )),
      ),
    );
  }
}
