import 'dart:math';

import 'package:advanced_widgets/utils/extencions.dart';

import '../theme/app_themes.dart';

class AppState {
  late ThemeType themeType;

  final weatherState = Random().nextDouble().toPrecision(1);

  late final String weatherDesc;

  AppState() {
    themeType = _getRandomTheme();
    weatherDesc = _formWeatherDesc();
  }

  ThemeType _getRandomTheme() {
    var randomValueIndex = Random().nextInt(ThemeType.values.length - 1);
    return ThemeType.values[randomValueIndex];
  }

  String _formWeatherDesc() {
    final temp = Random().nextInt(30);
    if (weatherState < 0.4) {
      return "Sunny $temp°";
    }
    if (weatherState < 0.7) {
      return "Cloudy $temp°";
    }
    return "Rainy $temp°";
  }
}
