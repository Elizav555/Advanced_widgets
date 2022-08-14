import 'package:advanced_widgets/state/app_state.dart';
import 'package:flutter/material.dart';

import '../theme/app_themes.dart';

class AppStateNotifier with ChangeNotifier {
  AppState state = AppState();

  void changeTheme(ThemeType type) {
    state.themeType = type;
    notifyListeners();
  }

  void regenerateState() {
    state = AppState();
    notifyListeners();
  }
}
