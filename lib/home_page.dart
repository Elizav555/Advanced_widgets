import 'package:advanced_widgets/state/app_state_notifier.dart';
import 'package:advanced_widgets/theme/app_themes.dart';
import 'package:advanced_widgets/widgets/my_theme_widget.dart';
import 'package:advanced_widgets/widgets/weather_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppStateNotifier>().state;
    return MyTheme(
        theme: appThemes[state.themeType] ?? ThemeData.light(),
        child: Builder(builder: (innerContext) {
          return Theme(
            data: MyTheme.of(innerContext),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WeatherWidget(
                      weatherState: state.weatherState,
                      weatherDesc: state.weatherDesc,
                    ),
                    Text("Weather state : ${state.weatherState}"),
                    MaterialButton(
                      color: MyTheme.of(innerContext).primaryColor,
                      onPressed:
                          context.read<AppStateNotifier>().regenerateState,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Regenerate"),
                      ),
                    )
                  ],
                ),
              ),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        }));
  }
}
