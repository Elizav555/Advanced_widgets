import 'dart:math';

import '../theme/app_themes.dart';

class AppState {
  var themeType = ThemeType.light;
  final weatherState = Random().nextDouble();

  String get weatherDesc {
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
