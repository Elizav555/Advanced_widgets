import 'package:flutter/material.dart';

class MyTheme extends InheritedWidget {
  final ThemeData theme;

  const MyTheme({
    Key? key,
    required Widget child,
    required this.theme,
  }) : super(key: key, child: child);

  static ThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyTheme>()?.theme ??
        ThemeData.light();
  }

  @override
  bool updateShouldNotify(MyTheme oldWidget) {
    return theme != oldWidget.theme;
  }
}
