import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rosseti/blocs.dart';
import 'package:rosseti/themes/custom_theme.dart';
import 'package:rosseti/themes/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'router.dart' as router;

SharedPreferences prefs;
Map <String, dynamic> curUser;
Map <String, Object> userdata;
bool isDarkTheme;
String userName = "Иванов Ф.Д.";

bool isViewTypeBig = true;
TasksBloc currentBloc;
FirebaseApp app;
FirebaseFirestore store = FirebaseFirestore.instance;




String currentId;
Map<String, dynamic> currentData = Map();
bool needLogin =true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await   Firebase.initializeApp();

  await SharedPreferences.getInstance().then((value) {
    prefs = value;
    if  (prefs != null && prefs.get("isDarkTeme")!= null) {
      isDarkTheme = prefs.get("isDarkTeme");
    }
    if  (prefs != null && prefs.get("user")!= null) {
      needLogin = false;
      store.collection("users").where("login", isEqualTo: prefs.get("user")).get().then((value) {
        if (value.docs.isNotEmpty) {
          curUser = value.docs.first.data();
        }});
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
      initialRoute:  needLogin ? '/login' : "/",
      title: 'Product App',
      theme: CustomTheme.of(context),
      onGenerateRoute: router.Router.generateRoute,
    );
  }
}
