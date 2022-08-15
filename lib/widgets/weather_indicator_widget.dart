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

class _WeatherWidgetState extends State<WeatherWidget>
    with TickerProviderStateMixin {
  late final AnimationController _alignmentController, _scaleController;
  late final Animation<AlignmentGeometry> _alignmentAnimation;

  bool isSelected = false;
  bool isTextShown = false;

  void _onTap() {
    setState(() {
      isSelected = !isSelected;
      isSelected
          ? {_scaleController.forward(), _alignmentController.forward()}
          : {
              _scaleController.animateBack(0.25),
              _alignmentController.animateBack(0)
            };
    });
  }

  @override
  void initState() {
    super.initState();

    _alignmentController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _alignmentAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.topRight,
      end: Alignment.center,
    ).animate(
      CurvedAnimation(
        parent: _alignmentController,
        curve: Curves.decelerate,
      ),
    );

    _scaleController = AnimationController(
      value: 0.25,
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() => isTextShown = true);
      }
      if (status == AnimationStatus.reverse) {
        setState(() => isTextShown = false);
      }
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _alignmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _scaleController,
          builder: (BuildContext context, Widget? child) {
            return AlignTransition(
              alignment: _alignmentAnimation,
              child: Transform.scale(
                transformHitTests: true,
                scale: _scaleController.value * 2,
                child: GestureDetector(
                  onTap: _onTap,
                  child: InkWell(
                    child: CustomPaint(
                      painter: WeatherPainter(state: widget.weatherState),
                      size: Size(
                        _scaleController.value * 200,
                        _scaleController.value * 160,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const Padding(padding: EdgeInsets.only(top: 80.0)),
        if (isTextShown)
          TextShadow(
            shadows: [
              Shadow(
                  color: Theme.of(context).textTheme.bodyMedium?.color ??
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
    );
  }
}
