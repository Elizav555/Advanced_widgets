import 'package:advanced_widgets/state/app_state_notifier.dart';
import 'package:advanced_widgets/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppStateNotifier>().state;
    return Theme(
      data: appThemes[state.themeType] ?? ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            PopupMenuButton(
                icon: const Icon(Icons.mode_edit),
                itemBuilder: (context) {
                  return ThemeType.values
                      .map(
                        (element) => PopupMenuItem<ThemeType>(
                          value: element,
                          child: Text("$element"),
                        ),
                      )
                      .toList();
                },
                onSelected: (ThemeType value) {
                  context.read<AppStateNotifier>().changeTheme(value);
                }),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}