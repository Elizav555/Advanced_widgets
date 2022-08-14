import 'package:advanced_widgets/state/app_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppStateNotifier>(
      create: (_) => AppStateNotifier(),
      child: const MaterialApp(
        title: 'Weather App',
        home: MyHomePage(title: 'Weather App Home Page'),
      ),
    );
  }
}
