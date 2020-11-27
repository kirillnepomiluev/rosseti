import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rosseti/themes/custom_theme.dart';
import 'package:rosseti/themes/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'router.dart' as router;


Map <String, Object> userdata;
bool isDarkTheme;
SharedPreferences prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferences.getInstance().then((value) {
    prefs = value;
    if  (prefs != null && prefs.get("isDarkTeme")!= null) {
      isDarkTheme = prefs.get("isDarkTeme");
    }
  });

  isDarkTheme = isDarkTheme == null? false : isDarkTheme;

  initializeDateFormatting().then((_) => runApp(
    CustomTheme(
      initialThemeKey: isDarkTheme?  MyThemeKeys.DARKFC :  MyThemeKeys.LIGHTFC,
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'Product App',
      theme: CustomTheme.of(context),
      onGenerateRoute: router.Router.generateRoute,
    );
  }
}
